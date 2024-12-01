if not game:IsLoaded() then game.Loaded:Wait() end
if game.PlaceId ~= 4490140733 then return end

local Library = require(game:GetService("ReplicatedStorage"):WaitForChild("Framework"):WaitForChild("Library"));
assert(Library, "Oopps! Library has not been loaded. Maybe try re-joining?") 
while not Library.Loaded do wait() end
print("Library has been loaded!")

function GetPath(...)
    local path = {...}
    local oldPath = Library
        if path and #path > 0 then
                for _,v in ipairs(path) do
                        oldPath = oldPath[v]
                end
        end
    return oldPath
end 

local Food = GetPath("Food")
local Entity = GetPath("Entity")
local Customer = GetPath("Customer")
local Waiter = GetPath("Waiter")
local Appliance = GetPath("Appliance")
local Bakery = GetPath("Bakery")


--// FAST WAITERS HOOKS

local FastWaiter = false
Waiter.StartActionLoop = function(waiter)
        coroutine.wrap(function()
                while not waiter.isDeleted do
                        waiter:PerformAction()
                        -- Wait for next waiter action
                        if FastWaiter then
                                wait()
                        else
                                wait(1.5)
                        end
                end
        end)()
end

local Original_CheckForQueuedCustomers = Waiter.CheckForQueuedCustomers
Waiter.CheckForQueuedCustomers = function(waiter)
        if not FastWaiter then return Original_CheckForQueuedCustomers(waiter) end

        if not Library.Variables.MyBakery.isOpen then
                return false
        end

        local myFloor = waiter:GetMyFloor()

        if myFloor.floorLevel ~= 1 then
                if Library.Variables.MyBakery.floors[1]:HasAtLeastOneIdleStateOfClass("Waiter") then
                        return false
                end

                if #Library.Variables.MyBakery.floors[1].waiters > 5 then
                        return false
                end
        end

        local readyCustomerGroup = nil
        for _, customerGroup in ipairs(Library.Variables.MyBakery.customerQueue) do
                if customerGroup[1].state == "WaitingForSeat" and not customerGroup[1].waiterIsAttendingToInQueue then
                        readyCustomerGroup = customerGroup
                        break
                end
        end

        if not readyCustomerGroup then return false end

        for _, customer in ipairs(readyCustomerGroup) do
                customer.waiterIsAttendingToInQueue = true
        end

        local firstCustomer = readyCustomerGroup[1]

        -- waiter is attending to me but I still haven't been seated?  timeout
        coroutine.wrap(function()
                wait()
                if #readyCustomerGroup == 0 then
                        return
                end
                if readyCustomerGroup[1].waiterIsAttendingToInQueue and readyCustomerGroup[1].state == "WaitingForSeat" then
                        --Library.Print("timeout successful")
                        for _, customer in ipairs(readyCustomerGroup) do
                                customer.waiterIsAttendingToInQueue = false
                        end
                end
        end)()

        waiter.state = "WalkingToQueuedCustomerGroup"


        if firstCustomer.state ~= "WaitingForSeat" or firstCustomer.stateData.busyWalking then
                for _, customer in ipairs(readyCustomerGroup) do
                        customer.waiterIsAttendingToInQueue = false
                end
                waiter:ResetAllStates()
                return
        end

        -- stop user pings
        firstCustomer:CleanupGroupInteract()
        firstCustomer:StopGroupEmoji()

        -- seat the customer group
        Library.Variables.MyBakery:SeatQueuedCustomerGroup(firstCustomer)

        -- update positioning
        Library.Variables.MyBakery:UpdateCustomerQueuePositioning()

        -- face the group
        waiter:FaceEntity(firstCustomer)

        -- free the waiter up
        waiter.state = "Idle"

        return true

end

local Original_CheckForCustomerOrder = Waiter.CheckForCustomerOrder
Waiter.CheckForCustomerOrder = function(waiter)
        if not FastWaiter then return Original_CheckForCustomerOrder(waiter) end

        local myFloor = waiter:GetMyFloor()

        local waitingCustomer = myFloor:GetCustomerWaitingToOrder()

        if not waitingCustomer then

                local indices = Library.Functions.RandomIndices(Library.Variables.MyBakery.floors)
                for _, index in ipairs(indices) do
                        local floor = Library.Variables.MyBakery.floors[index]
                        if floor ~= myFloor then
                                if not floor:HasAtLeastOneIdleStateOfClass("Waiter") then
                                        waitingCustomer = floor:GetCustomerWaitingToOrder()
                                        if waitingCustomer then
                                                break
                                        end
                                end
                        end
                end

                if not waitingCustomer then
                        return false
                end
        end

        waiter.state = "WalkingToTakeOrder"

        local customerGroup = {waitingCustomer}
        for _, customerPartner in ipairs(waitingCustomer.stateData.queueGroup) do
                if customerPartner.state == "WaitingToOrder" and not customerPartner.waiterIsAttendingToFoodOrder then
                        table.insert(customerGroup, customerPartner)
                end
        end        

        for _, seatedCustomer in ipairs(customerGroup) do
                seatedCustomer.waiterIsAttendingToFoodOrder = true
        end

        local function untagGroup()
                for _, seatedCustomer in ipairs(customerGroup) do
                        seatedCustomer.waiterIsAttendingToFoodOrder = false
                end
        end

        local firstCustomer = customerGroup[1]
        local groupTable = waiter:EntityTable()[firstCustomer.stateData.tableUID]
        if not groupTable or groupTable.isDeleted then
                waiter.state = "Idle"
                return
        end
        local tx, ty, tz = groupTable.xVoxel, groupTable.yVoxel, groupTable.zVoxel

        local customerFloor = firstCustomer:GetMyFloor()
        waiter:WalkToNewFloor(customerFloor, function()
                if firstCustomer.leaving or firstCustomer.isDeleted then
                        waiter.state = "Idle"
                        return
                end
                waiter:WalkToPoint(tx, ty, tz, function()

                        if firstCustomer.isDeleted or firstCustomer.leaving then
                                waiter.state = "Idle"
                                return
                        end

                        local orderStand = customerFloor:FindOrderStandOnAnyFloor()
                        if not orderStand then
                                Library.Print("CRITICAL: NO ORDER STAND FOUND!", true)
                                untagGroup()
                                waiter.state = "Idle"
                                waiter:TimedEmoji("ConcernedEmoji", 2)
                                return
                        end

                        local firstCustomer = customerGroup[1]
                        if firstCustomer then
                                firstCustomer:StopGroupEmoji()
                                firstCustomer:CleanupGroupInteract()
                        end

                        local groupOrder = {}
                        local tookOrdersFrom = {}
                        for _, seatedCustomer in ipairs(customerGroup) do
                                if seatedCustomer.state == "WaitingToOrder" then
                                        table.insert(tookOrdersFrom, seatedCustomer)
                                        groupOrder[seatedCustomer.UID] = Library.Food.RandomFoodChoice(seatedCustomer.UID, seatedCustomer.ID, seatedCustomer:IsRichCustomer(), seatedCustomer:IsPirateCustomer(), seatedCustomer.isNearTree)
                                        seatedCustomer.state = "WaitingForFood"
                                        seatedCustomer:StopChat()
                                end
                        end

                        -- if no orders are taken, abort
                        if #tookOrdersFrom == 0 then
                                waiter.state = "Idle"
                                return
                        end

                        -- take order animation
                        waiter:PlayLoadedAnimation("write")
                        for _, customer in ipairs(customerGroup) do
                                waiter:FaceEntity(customer)
                        end
                        waiter:StopLoadedAnimation("write")

                        waiter.state = "WalkingToDropoffOrder"

                        waiter:WalkToNewFloor(orderStand:GetMyFloor(), function()

                                if orderStand.isDeleted then
                                        for _, customer in ipairs(customerGroup) do
                                                customer:ForcedToLeave()
                                        end
                                        waiter.state = "Idle"
                                        return
                                end

                                waiter:WalkToPoint(orderStand.xVoxel, orderStand.yVoxel, orderStand.zVoxel, function()

                                        if orderStand.isDeleted then
                                                for _, customer in ipairs(customerGroup) do
                                                        customer:ForcedToLeave()
                                                end
                                                waiter.state = "Idle"
                                                return
                                        end

                                        -- deposit each of the orders
                                        for _, orderedCustomer in ipairs(tookOrdersFrom) do
                                                if orderedCustomer.isDeleted then
                                                        continue
                                                end
                                                orderedCustomer:ChangeToWaitingForFoodState(groupOrder[orderedCustomer.UID])
                                                orderStand:AddFoodToQueue(groupOrder[orderedCustomer.UID])
                                        end


                                        Library.Network.Fire("AwardWaiterExperienceForTakingOrderWithVerification", waiter.UID)

                                        waiter:FaceEntity(orderStand)

                                        waiter.state = "Idle"

                                end)
                        end)

                end)
        end)

        return true

end

--// 

-- ANTI-AFK
if getconnections then
        for i,v in next, getconnections(game.Players.LocalPlayer.Idled) do
                v:Disable()
        end
end

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local Original_RandomFoodChoice = Food.RandomFoodChoice
local GoldFood = false
Food.RandomFoodChoice = function(customerOwnerUID, customerOwnerID, isRichCustomer, isPirateCustomer, isNearTree)
    if GoldFood then
                local spoof = Food.new("45", customerOwnerUID, customerOwnerID, true, true)
                spoof.IsGold = true
                return spoof
        end

        return Original_RandomFoodChoice(customerOwnerUID, customerOwnerID, isRichCustomer, isPirateCustomer, isNearTree)
end

local Original_DropPresent = Customer.DropPresent
local AutoGift = false

local Original_CheckForFoodDelivery = Waiter.CheckForFoodDelivery
Waiter.CheckForFoodDelivery = function(waiter)
        if not GoldFood then 
                return Original_CheckForFoodDelivery(waiter)
        end

        local myFloor = waiter:GetMyFloor()
        local readyStands = myFloor:GatherOrderStandsWithDeliveryReady()
        if #readyStands == 0 then                
                local indices = Library.Functions.RandomIndices(Library.Variables.MyBakery.floors)
                for _, index in ipairs(indices) do
                        local floor = Library.Variables.MyBakery.floors[index]
                        if floor ~= myFloor and not floor:HasAtLeastOneIdleStateOfClass("Waiter") then
                                readyStands = floor:GatherOrderStandsWithDeliveryReady()
                                if #readyStands > 0 then break end
                        end                
                end

                if #readyStands == 0 then
                        return false
                end
        end

        local orderStand = readyStands[math.random(#readyStands)]
        if not orderStand then
                return false
        end

        orderStand.stateData.foodReadyTargetCount = orderStand.stateData.foodReadyTargetCount + 1
        waiter.state = "WalkingToPickupFood"
        waiter:WalkToNewFloor(orderStand:GetMyFloor(), function()
                if orderStand.isDeleted then
                        waiter.state = "Idle"
                        return
                end

                waiter:WalkToPoint(orderStand.xVoxel, orderStand.yVoxel, orderStand.zVoxel, function()
                        if orderStand.isDeleted then
                                waiter.state = "Idle"
                                return
                        end

                        orderStand.stateData.foodReadyTargetCount = orderStand.stateData.foodReadyTargetCount - 1
                        if #orderStand.stateData.foodReadyList == 0 then
                                waiter.state = "Idle"
                                return
                        end

                        local selectedFoodOrder = orderStand.stateData.foodReadyList[1]
                        selectedFoodOrder.isGold = true

                        table.remove(orderStand.stateData.foodReadyList, 1)

                        selectedFoodOrder:DestroyPopupListItemUI()
                        local customerOfOrder = waiter:EntityTable()[selectedFoodOrder.customerOwnerUID]
                        if not customerOfOrder then
                                Library.Print("CRITICAL: customer owner of food not found", true)
                                waiter.state = "Idle"
                                return false
                        end
                        waiter:FaceEntity(orderStand)
                        waiter:HoldFood(selectedFoodOrder.ID, selectedFoodOrder.isGold)
                        waiter.state = "WalkingToDeliverFood"
                        if not customerOfOrder.isDeleted then
                                waiter:WalkToNewFloor(customerOfOrder:GetMyFloor(), function()
                                        waiter:WalkToPoint(customerOfOrder.xVoxel, customerOfOrder.yVoxel, customerOfOrder.zVoxel, function()
                                                waiter:DropFood()
                                                if customerOfOrder.isDeleted then
                                                        Library.Print("CRITICAL: walked to customer, but they were forced to leave.  aborting", true)
                                                        waiter.state = "Idle"
                                                        return
                                                end
                                                customerOfOrder:ChangeToEatingState()
                                                waiter:FaceEntity(customerOfOrder)
                                                Library.Network.Fire("AwardWaiterExperienceForDeliveringOrderWithVerification", waiter.UID)
                                                waiter.state = "Idle"
                                        end)
                                end)
                                return
                        end
                        waiter.state = "Idle"
                        waiter.stateData.heldDish = waiter.stateData.heldDish:Destroy()
                end)
        end)

        return true
end

Customer.DropPresent = function(gift) 
        if AutoGift then
                local character = Player.Character or Player.CharacterAdded:Wait()
                local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

                local UID = Library.Network.Invoke("Santa_RequestPresentUID", gift.UID)
                Library.Network.Fire("Santa_PickUpGift", UID, humanoidRootPart.Position + Vector3.new(1,0,0))
        else 
                Original_DropPresent(gift)
        end
end

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner = Instance.new("UICorner")

--Properties:

ScreenGui.Parent = game.Players.LocalPlayer:WaitForChild("PlayerGui")
ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
ScreenGui.ResetOnSpawn = false

Frame.Parent = ScreenGui
Frame.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
Frame.BackgroundTransparency = 0.500
Frame.Position = UDim2.new(0.858712733, 0, 0.0237762257, 0)
Frame.Size = UDim2.new(0.129513338, 0, 0.227972031, 0)

TextButton.Parent = Frame
TextButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
TextButton.BackgroundTransparency = 1.000
TextButton.Size = UDim2.new(1, 0, 1, 0)
TextButton.Font = Enum.Font.SourceSans
TextButton.Text = "关闭"
TextButton.TextColor3 = Color3.fromRGB(0, 0, 0)
TextButton.TextScaled = true
TextButton.TextSize = 50.000
TextButton.TextStrokeColor3 = Color3.fromRGB(255, 255, 255)
TextButton.TextStrokeTransparency = 0.000
TextButton.TextWrapped = true
TextButton.MouseButton1Down:Connect(function()
    if TextButton.Text == "关闭" then
        TextButton.Text = "打开"
    else
        TextButton.Text = "关闭"
    end
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "E" , false , game)
end) -- replace "E" with your keybind

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 30

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()

local win = lib:Window("餐厅大亨2",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E) -- your own keybind 

local tab = win:Tab("主要功能")

local Original_ChangeToWaitForOrderState = Customer.ChangeToWaitForOrderState
local FastOrder = false
Customer.ChangeToWaitForOrderState = function(customer)
        if not FastOrder then 
                Original_ChangeToWaitForOrderState(customer) 
                return
        end

        if customer.state ~= "WalkingToSeat" then return end

        local seatLeaf = customer:EntityTable()[customer.stateData.seatUID]
        local tableLeaf = customer:EntityTable()[customer.stateData.tableUID]

        if seatLeaf.isDeleted or tableLeaf.isDeleted then
                customer:ForcedToLeave()
                return
        end

        customer:SetCustomerState("ThinkingAboutOrder")
        customer:SitInSeat(seatLeaf).Completed:Connect(function()

                customer.humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
                customer.xVoxel = seatLeaf.xVoxel
                customer.zVoxel = seatLeaf.zVoxel

                coroutine.wrap(function()
                        wait(0.05)
                        customer:ReadMenu()
                        wait(0.1)

                        if customer.isDeleted or customer.state ~= "ThinkingAboutOrder" then return end

                        customer:StopReadingMenu()
                        customer:SetCustomerState("DecidedOnOrder")

                        local myGroup = {customer}
                        for _, partner in ipairs(customer.stateData.queueGroup) do
                                if not partner.isDeleted then
                                        table.insert(myGroup, partner)
                                end
                        end
                        local foundUndecidedMember = false
                        for _, groupMember in ipairs(myGroup) do
                                if groupMember.state ~= "DecidedOnOrder" then
                                        foundUndecidedMember = true
                                        break
                                end
                        end

                        if not foundUndecidedMember then
                                for _, groupMember in ipairs(myGroup) do
                                        groupMember:ReadyToOrder()
                                end
                        end
                end)()
        end)
end

tab:Toggle("快速订单", false, function(Value)
    FastOrder = Value
end)

tab:Toggle("快速服务员", false, function(Value)
    FastWaiter = Value
end)

tab:Toggle("黄金食品", false, function(Value)
    GoldFood = Value
end)

tab:Toggle("收集礼物", false, function(Value)
          AutoGift = Value

                if Value and Value == true then
                        if not Workspace or not Workspace.__DEBRIS then return end

                        coroutine.wrap(function() 
                                for _, object in pairs(Workspace.__DEBRIS:GetChildren()) do
                                        if object.Name == "SantaPresent" and object:FindFirstChild("SantaPresent") and object.SantaPresent:FindFirstChild("Activated") then
                                                pcall(function() 
                                                        local activated = object.SantaPresent.Activated
                                                        for _, connection in pairs(getconnections(activated.Event)) do
                                                                connection:Fire()
                                                                wait()
                                                        end
                                                end)                                        
                                                wait(1)
                                        end
                                end
                        end)()
                end
      end)
      
local Wells = {"101","49","50"}
local Slots = {"57"}

local FurnituresCooldowns = {}
local AutoInteract = false

local function UseWell(wellUID, wellId)
    local event = "RequestWishingWellUsage"
    if wellId == "101" then
        event = "RequestHauntedWishingWellUsage"
    end

    Library.Network.Fire(event,wellUID)        
        print("Collected Wishing Well!")
end

task.spawn(function() 
        while true do 
                if AutoInteract then 
                        local bakeryData = Library.Variables.UIDData
                        if not bakeryData then
                                Rayfield.Flags["AutoInteract"]:Set(false)
                                AutoInteract = false
                                return
                        end

                        for i,v in pairs(bakeryData["Furniture"]) do
                                local ID = v.ID

                                -- Wishing Wells
                                if ID and table.find(Wells,ID) and v.ClassName == "Furniture" and not FurnituresCooldowns[v.UID] then
                                        task.spawn(function()
                                                local event = "GetWishingWellRefreshTime"
                                                if ID == "101" then
                                                        event = "GetHauntedWishingWellRefreshTime"
                                                end

                                                local cooldown = Library.Network.Invoke(event, ID == "101" and v.UID or v.ID)

                                                if cooldown and cooldown == 0 and AutoInteract then
                                                        UseWell(v.UID, ID)
                                                        FurnituresCooldowns[v] = nil
                                                else
                                                        FurnituresCooldowns[v] = Workspace:GetServerTimeNow() + cooldown
                                                end
                                        end)
                                end

                                -- Slot Machines
                                if ID and table.find(Slots,ID) then
                                        task.spawn(function()
                                                local cooldown = Library.Network.Invoke("GetSlotRefreshTime")

                                                if cooldown and cooldown == 0 and AutoInteract then
                                                        Library.Network.Fire("RequestSlotUsage", v.UID)
                                                        print("Collected Slot Machine!")
                                                        FurnituresCooldowns[v] = nil
                                                else 
                                                        FurnituresCooldowns[v] = Workspace:GetServerTimeNow() + cooldown
                                                end
                                        end)
                                end

                                wait()
                        end        

                        local currentTime = Workspace:GetServerTimeNow()
                        -- Make sure that AutoInteract still enabled cause why not
                        if AutoInteract then 
                                for furniture, cooldown in pairs(FurnituresCooldowns) do 
                                        local ID = furniture.ID

                                        if ID and currentTime >= cooldown then

                                                if table.find(Wells,ID) and v.ClassName == "Furniture" then
                                                        task.spawn(function()
                                                                local event = "GetWishingWellRefreshTime"
                                                                if ID == "101" then
                                                                        event = "GetHauntedWishingWellRefreshTime"
                                                                end

                                                                local cooldown = Library.Network.Invoke(event, ID == "101" and v.UID or v.ID)
                                                                if cooldown and cooldown == 0 and AutoInteract then
                                                                        UseWell(v.UID, ID)
                                                                        FurnituresCooldowns[v] = nil
                                                                else
                                                                        FurnituresCooldowns[v] = Workspace:GetServerTimeNow() + cooldown
                                                                end
                                                        end)
                                                end

                                                -- COLLECT SLOTS OR UPDATE TIME
                                                if table.find(Slots,ID) then
                                                        local cooldown = Library.Network.Invoke("GetSlotRefreshTime")

                                                        if cooldown and cooldown == 0 and AutoInteract then
                                                                Library.Network.Fire("RequestSlotUsage", v.UID)
                                                                print("Collected Slot Machine!")
                                                                FurnituresCooldowns[v] = nil
                                                        else 
                                                                FurnituresCooldowns[v] = Workspace:GetServerTimeNow() + cooldown
                                                        end
                                                end
                                        end
                                end
                        end
                end
                wait(5)
        end
end)

tab:Toggle("自动抽奖", false, function(Value)
    AutoInteract = Value
end)


local TiersLayout = {
        Cook = Library.Shared.CookTierLayout, 
        Waiter = Library.Shared.WaiterTierLayout
}

function CheckIfCanBuy(className)
        local stats = Library.Stats.Get(true);
        if not stats then return end

        local allWorkers = Library.Variables.MyBakery:GetAllOfClassName(className)
        if not allWorkers then return end

        local level = Library.Experience.BakeryExperienceToLevel(Library.Variables.MyBakery.experience)

        for _, tier in pairs(TiersLayout[className]) do 
                local alreadyOwned = false
                for _, worker in pairs(allWorkers) do 
                        if tier.Tier == worker.tier then 
                                alreadyOwned = true
                                break
                        end
                end

                if not alreadyOwned then 
                        if tier.BakeryLevelRequired <= level and tier.Cost < stats.Cash then 
                                Library.Network.Fire("RequestNPCPurchase", className, tier.Tier)
                                print(string.format("Bought a %s of tier %s", className, tier.Tier))
                                wait(0.5)
                        end
                end
        end
end

local AutoBuyWorkers = false
Library.Network.Fired("BakeryLevelUp"):Connect(function()
        if not AutoBuyWorkers then return end

        CheckIfCanBuy("Cook")
        CheckIfCanBuy("Waiter")
end)

tab:Toggle("自动购买员工", false, function(Value)
    AutoBuyWorkers = Value
                if Value then
                        CheckIfCanBuy("Cook")
                        CheckIfCanBuy("Waiter")
                end
end)


local Original_WalkThroughWaypoints = Entity.WalkThroughWaypoints
local FastNPC = false
local TeleportNPC = false
local NPCSpeed = 100
Entity.WalkThroughWaypoints = function(entity, voxelpoints, waypoints, undefined1, undefined2)
        if entity:BelongsToMyBakery() then
                if TeleportNPC then
                        TeleportThroughWaypoints(entity, voxelpoints, waypoints)
                        return
                elseif FastNPC and entity.humanoid then 
                        entity.humanoid.WalkSpeed = NPCSpeed
                elseif not FastNPC and entity.humanoid and entity.data and entity.data.walkSpeed then
                        entity.humanoid.WalkSpeed = entity.data.walkSpeed
                end
        end

        Original_WalkThroughWaypoints(entity, voxelpoints, waypoints, undefined1, undefined2)
end


function TeleportThroughWaypoints(entity, voxelpoints, waypoints)
    entity:PlayLoadedAnimation("walking")

        if #voxelpoints == 0 then
                return
        end

        if not entity:BelongsToMyBakery() and entity.stateData.walkingThroughWaypoints then
                repeat wait() until entity.isDeleted or not entity.stateData.walkingThroughWaypoints
                if entity.isDeleted then
                        return
                end
        end
        if not entity:BelongsToMyBakery() then
                entity.stateData.walkingThroughWaypoints = true
        end

        -- replication fix?
        if not entity:BelongsToMyBakery() then
                entity.model.HumanoidRootPart.Anchored = false
        end

        local wayPoint = waypoints[#waypoints]
        local voxelPoint = voxelpoints[#waypoints]


        if wayPoint and voxelPoint and voxelPoint["x"] and voxelPoint["y"] then
                entity.model.HumanoidRootPart.CFrame = CFrame.new(wayPoint) * CFrame.new(0, 2, 0)
                local oldX, oldZ = entity.xVoxel, entity.zVoxel

                entity.xVoxel = voxelPoint.x
                entity.zVoxel = voxelPoint.y

                if entity:BelongsToMyBakery() then
                        entity:GetMyFloor():BroadcastNPCPositionChange(entity, oldX, oldZ)
                end
        else
                for i, v in ipairs(waypoints) do
                        entity.model.HumanoidRootPart.CFrame = CFrame.new(v) * CFrame.new(0, 2, 0)
                        --entity.humanoid.MoveToFinished:Wait()
                        local oldX, oldZ = entity.xVoxel, entity.zVoxel
                        entity.xVoxel = voxelpoints[i].x
                        entity.zVoxel = voxelpoints[i].y


                        if entity:BelongsToMyBakery() then
                                entity:GetMyFloor():BroadcastNPCPositionChange(entity, oldX, oldZ)
                        end
                end        
        end

        if not entity:BelongsToMyBakery() then
                entity.stateData.walkingThroughWaypoints = false
        end

        entity:StopLoadedAnimation("walking")
        entity:PlayLoadedAnimation("idle")
end

tab:Toggle("机器人传送", false, function(Value)
    TeleportNPC = Value
end)