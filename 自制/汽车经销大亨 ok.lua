local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
   vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
   wait(1)
   vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
local mt = getrawmetatable(game);
setreadonly(mt,false)
local namecall = mt.__namecall

mt.__namecall = newcclosure(function(self, ...)
        local Method = getnamecallmethod()
        local Args = {...}

        if Method == 'FireServer' and self.Name == "JobRemoteHandler" and rawget(...,"Action") == "StartDeliveryJob" then
print(Args)
 _G.remotetable = ...
    end
        return namecall(self, ...) 
end)

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
    game:GetService("VirtualInputManager"):SendKeyEvent(true, "J" , false , game)
end) -- replace "E" with your keybind

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 30

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()
local win = lib:Window("Y&F | 汽车经销大亨",Color3.fromRGB(0, 255, 0), Enum.KeyCode.J) -- your own keybind 

local tab = win:Tab("主要功能")
local tab2 = win:Tab("其他功能")

tab:Toggle("自动驾驶(新版)", false, function(state)
getfenv().auto = (state and true or false)
while getfenv().auto do
local chr = game.Players.LocalPlayer.Character
local car = chr.Humanoid.SeatPart.Parent.Parent
dist = (chr.HumanoidRootPart.Position-car.Engine.CFrame.LookVector*1000).Magnitude
local TweenService = game:GetService("TweenService")
local TweenInfoToUse = TweenInfo.new(dist/1000, Enum.EasingStyle.Sine, Enum.EasingDirection.InOut, 0, true, 0)

local TweenValue = Instance.new("CFrameValue")
TweenValue.Value = car:GetPrimaryPartCFrame()

TweenValue.Changed:Connect(function()
car:SetPrimaryPartCFrame(TweenValue.Value)
end)
local OnTween = TweenService:Create(TweenValue, TweenInfoToUse, {Value=car.Engine.CFrame+car.Engine.CFrame.LookVector*1000})
OnTween:Play()
OnTween.Completed:Wait()
end
end)

tab:Toggle("自动收集零件", false, function(state)
    getfenv().test = (state and true or false)
    while getfenv().test do
        wait()
    local function update()
        local count = game:GetService("Players").LocalPlayer.PlayerGui.Menu.Event.Frame.PrizeFrame.ProgressBar.Count
        local text = count.Text:split("/")
        local num = tonumber(text[1])
    return num
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v.ClassName == "Model" and not v:FindFirstChild("Part") and v:FindFirstChild("Owned") and update() ~= 12 and getfenv().test == true then
            repeat wait()
        game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
            until v:FindFirstChild("Part") or getfenv().test == false
        local test = nil
        end
    end
    for i,v in pairs(workspace:GetChildren()) do
        if v.ClassName == "Model" and v:FindFirstChild("Part") and v:FindFirstChild("Owned") and update() ~= 12 and getfenv().test == true then
        game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
        local ohye = update()
        local test = nil
        for a,b in pairs(v:GetChildren()) do
        if b.ClassName == "MeshPart" and b.Transparency < 0.5 then
            test = b
        end
        end
        if test~= nil then
        repeat task.wait()
            game.Players.LocalPlayer.Character:PivotTo(v.WorldPivot)
            game:GetService("VirtualInputManager"):SendKeyEvent(true,"E",false,game)
        until test.Transparency > 0.5 or getfenv().test == false
    repeat task.wait()
        game:GetService("ReplicatedStorage").Remotes.EventController.PerformAction:FireServer("AssembleCarPart", {})
    until ohye ~= update()
    end
end
end
    end
    end)
    
tab:Toggle("自动送货", false, function(state)
    getfenv().deliver = (state and true or false)
    spawn(function()
        while getfenv().deliver do
            task.wait()
            pcall(function()
        if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
            wait(5)
            getfenv().spawned = false
        end
        end)
        end
        end)

    while getfenv().deliver do
        wait()
        pcall(function()
    if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
        task.wait(0.1)
    for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
    if v.Name == "DeliveryPart" and v.Transparency ~= 1 then
        getfenv().spawned = false
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,20,-10))
        game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
       for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
        if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
            for a,b in pairs(workspace.ActionTasksGames.Jobs:GetChildren()) do
                if b.ClassName == "Model" and b:GetAttribute("JobId") then
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = b:GetAttribute("JobId")})
            game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
        end
    end
        end 
    end
end
    end
    elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and getfenv().spawned ~= true then
        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
        getfenv().spawned = true
    wait(0.1)
    end
    end)
    end
end)
    
tab:Toggle("自动售卖汽车", false, function(state)
    getfenv().Customer = (state and true or false)
    while getfenv().Customer do
        task.wait()
    pcall(function()
        local function plot()
            for i,v in pairs(workspace.Tycoons:GetDescendants()) do
            if v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Plot") and v.Value == game.Players.LocalPlayer.Name or v.Name == "Owner" and v.ClassName == "StringValue" and string.find(v.Parent.Name,"Slot") and v.Value == game.Players.LocalPlayer.Name then
            tycoon = v.Parent
            end
            end
            return tycoon
            end
    _G.rat = nil
local customer
    for i,v in pairs(plot().Dealership:GetChildren()) do
        if v.ClassName == "Model" and v.PrimaryPart ~= nil and  v.PrimaryPart.Name == "HumanoidRootPart" then
            customer = v
        end
    end
    local text = customer:GetAttribute("OrderSpecBudget"):split(";")
    local num = tonumber(text[2])
    local plr = game.Players.LocalPlayer
    local guis = plr.PlayerGui
    local menu = guis.Menu
    local req = guis.Dialogue.CarSpec.Frame.Frame
    for i,v in pairs(menu.Shop.Cars.Frame.Frame:GetDescendants()) do
        if v.Name == "PriceValue" and tonumber(string.gsub(v.Value,",",""):split("$")[2]) > tonumber(text[1]) and tonumber(string.gsub(v.Value,",",""):split("$")[2]) < tonumber(text[2]) then
    local ok =tonumber(string.gsub(v.Value,",",""):split("$")[2])
    if ok < num then
    num = ok
    _G.rat = v
    end
    end
    end
    textn = 1
repeat wait()
text = _G.rat.Parent.Name:split("")[textn]
    textn=textn+1

    warn(text,textn)
until tonumber(text) == nil
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "AcceptOrder",["OrderId"] = customer:GetAttribute("OrderId")})
    wait()
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Specs"] = {["Springs"] = customer:GetAttribute("OrderSpecSprings"),["Color"] = customer:GetAttribute("OrderSpecColor"),["Rims"] = customer:GetAttribute("OrderSpecRims"),["Car"] = text.._G.rat.Parent.Name:split(tostring(_G.rat.Parent.Name:split("")[textn-1]))[2],["RimColor"] = customer:GetAttribute("OrderSpecRimColor")},["Action"] = "CompleteOrder",["OrderId"] = customer:GetAttribute("OrderId")})
    wait()
    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.NPCHandler:FireServer({["Action"] = "CollectReward",["OrderId"] = customer:GetAttribute("OrderId")})
    repeat wait()
    until customer.Parent == nil or  getfenv().Customer == false
    end)
    end
end)

tab:Toggle("自动升级", false, function(state)
    getfenv().buyer = (state and true or false )
while getfenv().buyer do
task.wait()
-- 购买按钮
local function plot()
    for i,v in pairs(workspace.Tycoons:GetDescendants()) do
    if v.Name == "Owner" and v.ClassName == "StringValue" and v.Value == game.Players.LocalPlayer.Name then
    tycoon = v.Parent
    end
    end
    return tycoon
    end
    -- 购买按钮
    pcall(function()
    for i,v in pairs(plot().Dealership.Purchases:GetChildren()) do 
        if getfenv().buyer == true and v.TycoonButton.Button.Transparency == 0 then
    game:GetService("ReplicatedStorage").Remotes.Build:FireServer("BuyItem", v.Name)
    wait(0.3)
    end 
end   
end)
end
end)

tab:Toggle("删除弹出窗口", false, function(state)
    getfenv().annoy = (state and true or false )
if getfenv().annoy == true then
-- annoying popup remover
getfenv().fun =game:GetService("Players").LocalPlayer.PlayerGui.ChildAdded:Connect(function(ok)
    if ok.Name == "Popup2" then
        ok:Destroy()
    end
end)
elseif getfenv().annoy == false then
getfenv().fun:Disconnect()
end
end)

tab2:Textbox("输入星星数量",true, function(object, focus)
    if focus then
       getfenv().stars = tonumber(object.Text)
        end
end)

tab2:Textbox("输入最低奖励",true, function(object, focus)
    if focus then
       getfenv().smaller = tonumber(object.Text)
        end
end)

tab2:Textbox("输入最大奖励",true, function(object, focus)
    if focus then
       getfenv().bigger = tonumber(object.Text)
        end
end)

tab2:Toggle("自动送货2", false, function(state)
    getfenv().deliver2 = (state and true or false)
            game.Players.LocalPlayer.Character.Head.Anchored = false
            spawn(function()
                while getfenv().deliver2 do
                    task.wait()
                    pcall(function()
                if game.Players.LocalPlayer.Character:WaitForChild("Humanoid").Sit == false then
                    wait(5)
                    getfenv().spawned = false
                end
                end)
                end
                end)
                local function gettruck()
                    local truck = nil
                    for i,v in pairs(workspace.Cars:GetChildren()) do
                        if v.Name == "DeliveryTruck" and v:GetAttribute("JobId") == _G.remotetable.Jobs[1].Id then
                          truck = v
                    end
                    end
                    return truck or "no truck found"
                    end
                    print(gettruck())
                    spawn(function()
                        timeout = 0
                            while getfenv().deliver2 do
                        task.wait()
                    if gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout < 10 then
                    timeout = timeout + 1
                    wait(1)
                    elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart== nil and timeout >= 10 then
                        timeout = 0
                        warn("truck bugged and got destroyed")
                        gettruck():Destroy()
                        wait(1)
                      elseif gettruck() ~= "no truck found" and game.Players.LocalPlayer.Character.Humanoid.SeatPart~= nil  then
                        timeout = 0
                        print("timeout reset")
                        wait(1)
                    end
                    end
                    end)
                    spawn(function()
                        print("bro spawned in")
                        while getfenv().deliver2 do
                        task.wait()
                        if getfenv().checkif ~= nil then
                        wait(40)
                            getfenv().checkif = nil
                        end
                        end
                          end)
                          getfenv().checkif = nil
            while getfenv().deliver2 do
                wait()

            if game.Players.LocalPlayer.Character.Humanoid.Sit == true then
                task.wait(0.1)

            for i,v in pairs(workspace.ActionTasksGames.Jobs:GetDescendants()) do
            if v.Name == "DeliveryPart" and v.Transparency ~= 1 and game.Players.LocalPlayer.Character.Humanoid.SeatPart ~= nil then
                game.Players.LocalPlayer.Character.Head.Anchored = false
                tppart = v
                getfenv().spawned = false
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame)
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.new(-30,30,-10))
                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(v.CFrame*CFrame.Angles(0,math.rad(90),0))
               for i,v in pairs(game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:GetChildren()) do
                if v.ClassName == "Model" and v:GetAttribute("StockTurbo") then
                            repeat wait(0.1)
                                pcall(function()
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame)
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.new(-30,30,-10))
                                game.Players.LocalPlayer.Character.Humanoid.SeatPart.Parent.Parent:PivotTo(tppart.CFrame*CFrame.Angles(0,math.rad(90),0))
                                end)
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["Action"] = "TryToCompleteJob",["JobId"] = v.Name})
                            until game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true or game.Players.LocalPlayer.Character.Humanoid.SeatPart == nil or getfenv().deliver2 == false
                            game.Players.LocalPlayer.Character.Head.Anchored = false
                            game.Players.LocalPlayer.Character.HumanoidRootPart.Velocity = Vector3.new(0,0,0)
                            local function getstars()
                            local stars = 0
                            for i,v in pairs(game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Frame.Stars:GetChildren()) do
                            if string.find(v.Name,"Star") and v.ImageColor3 == Color3.fromRGB(255, 189, 34) then
                            stars = stars+1
                            end
                        end
                        return stars
                        end
                        local function isused(hi)
                            yeno = nil
                            for i,v in pairs(_G.usedids) do
                            if v == hi then
                            yeno = "Vehicle was already used"
                            end
                            end
                            return yeno
                            end
                        print(tonumber(getstars()).." Stars bonus")
                        if tonumber(getstars()) < getfenv().stars and game:GetService("Players").LocalPlayer.PlayerGui:WaitForChild("MissionRewardStars").Enabled == true and getfenv().checkif == nil then
                            whate = nil
                            if type(_G.usedids) ~= "table" then
                                _G.usedids = {}
                            end
                            for i,v in pairs(getgc(true)) do
                        if type(v) == "table" and rawget(v,"MoneyReward") ~= nil and whate == nil and getfenv().checkif == nil then
                            task.wait()
                        if tonumber(v.MoneyReward) > getfenv().smaller and tonumber(v.MoneyReward) < getfenv().bigger and whate == nil and getfenv().checkif == nil and isused(v.Id) ~= "Vehicle was already used" then
                        task.wait()
                            table.insert(_G.usedids,v.Id)
                        whate = v
                        print("Vehicle has been changed",v)
                        _G.remotetable = {["Truck"] = "DeliveryTruck",["Action"] = "StartDeliveryJob",["Jobs"] = {[1] = {["Id"] = whate.Id,["Image"] = "http://www.roblox.com/asset/?id=7962599980",["CFrame"] = CFrame.new(-1476.16199, 601.700134, 3489.31299, -1, 0, 0, 0, 1, 0, 0, 0, -1),["JobData"] = whate}}}
                        if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                        wait(0.5)
                        game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})
                        wait(0.5)
                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                        end
                        getfenv().checkif = true
                            end
                        end
                        end
                        end
                        wait()
                    if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                        game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars").Enabled = false
                    game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer({["JobId"] = game:GetService("Players").LocalPlayer.PlayerGui.MissionRewardStars:GetAttribute("JobId"),["Action"] = "CollectReward"})

                end                  
            end
                end 
            end
        end
            elseif game.Players.LocalPlayer.Character.Humanoid.Sit == false and gettruck() == "no truck found" then
                print(gettruck())
                if game:GetService("Players").LocalPlayer.PlayerGui:FindFirstChild("MissionRewardStars") then
                    pcall(function()
                    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame =  tppart.CFrame
                    game.Players.LocalPlayer.Character.Head.Anchored = true
                    end)
                    wait(1)
                end
                whate = nil
                game:GetService("ReplicatedStorage").Remotes.DealershipCustomerController.JobRemoteHandler:FireServer(_G.remotetable)
            local unstck = 0
            repeat wait()
                unstck=unstck+1
            until gettruck() ~= "no truck found" or getfenv().deliver2 == false or unstck > 100
            game.Players.LocalPlayer.Character.Head.Anchored = false
            end
            end
end)
        
tab2:Toggle("自动圣诞节漂移", false, function(state)
    _G.oh = (state and true or false)
            for i,v in pairs(workspace:GetDescendants()) do
                if v.Name == "DriftAsphalt" then
                    v.Velocity = v.CFrame.LookVector*0
                    end
                end
            while _G.oh do
                task.wait()
            if game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == true then
           if _G.velo ~= true then
                for i,v in pairs(workspace:GetDescendants()) do
                if v.Name == "DriftAsphalt" then
                    v.Velocity = v.CFrame.LookVector*1000
                    end
                end
                _G.velo = true
            end
            if game.Players.LocalPlayer:DistanceFromCharacter(Vector3.new(-2055.981689453125, 654.3567504882812, 7831.22900390625)) > 20 then
                game:GetService("Players").LocalPlayer.PlayerGui.Animation.DriftPoints.Position = UDim2.new(0.5, 0,1, -130)
                local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
            car:PivotTo(CFrame.new(-2055.981689453125, 654.3567504882812, 7831.22900390625))
            end
        elseif game:GetService("Players").LocalPlayer.PlayerGui.Menu.Race.Visible == false then
            local chr = game.Players.LocalPlayer.Character
            local car = chr.Humanoid.SeatPart.Parent.Parent
            car:PivotTo(CFrame.new(-2068.947021484375, 656.533447265625, 7767.55810546875))
            wait(0.1)
        workspace.Races.RaceHandler.StartLobby:FireServer("Xmas")
        wait(1)
            end
        end
            end)