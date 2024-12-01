local PhysicsService = game:GetService("PhysicsService")
local RunService = game:GetService("RunService")
local MarketplaceService = game:GetService("MarketplaceService")
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Players = game:GetService("Players")
local VirtualUser = game:GetService("VirtualUser")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

-- Global Environment Variables
getgenv().thunt_gui_executed = true
getgenv().cheat_settings = {}
getgenv().cheat_settings.autochest = false
getgenv().cheat_settings.autosell = false
getgenv().cheat_settings.autobuyshovels = false
getgenv().cheat_settings.autobuybackpacks = false
getgenv().cheat_settings.autobuypets = false
getgenv().cheat_settings.autorebirth = false
getgenv().cheat_settings.autobuycrates = false
getgenv().cheat_settings.autoopencrates = false
--getgenv().cheat_settings.freegamepass = false
getgenv().cheat_settings.gcollide = true
--getgenv().cheat_settings.autoinvisible = false
getgenv().cheat_settings.walkspeed = false
getgenv().cheat_settings.jumppower = false
getgenv().cheat_settings.autoserverhop = false
getgenv().cheat_settings.antiafk = true
getgenv().cheat_settings.savesettings = false

-- Predefining needed game data
getgenv().thunt_data = {}
getgenv().thunt_data.chests = ReplicatedStorage:WaitForChild("Chests")
getgenv().thunt_data.crates = ReplicatedStorage:WaitForChild("Crates")
getgenv().thunt_data.shovels = ReplicatedStorage:WaitForChild("Shovels")
getgenv().thunt_data.backpacks = ReplicatedStorage:WaitForChild("Backpacks")
getgenv().thunt_data.pets = ReplicatedStorage:WaitForChild("Pets")
getgenv().thunt_data.gamepasses = ReplicatedStorage:WaitForChild("Gamepasses")
getgenv().thunt_data.buy_item = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Checkout")
getgenv().thunt_data.buy_crate = ReplicatedStorage:WaitForChild("Events"):WaitForChild("BuyCrate")
getgenv().thunt_data.open_crate = ReplicatedStorage:WaitForChild("Events"):WaitForChild("SendOpenCrate")
getgenv().thunt_data.rebirth = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Rebirth")
getgenv().thunt_data.check_if_owned = ReplicatedStorage:WaitForChild("Events"):WaitForChild("CheckIfOwned")

function thunt_data.getChestNames(with_health)
    local ret_val = {}
    for ind, val in pairs(getgenv().thunt_data.chests:GetChildren()) do
        if with_health then
            ret_val[ind] = val.Name.." ("..val:WaitForChild("Health").Value..")"
        else
            ret_val[ind] = val.Name
        end
    end
    return ret_val
end

function thunt_data.getCrateNames()
    local ret_val = {}
    for ind, val in pairs(getgenv().thunt_data.crates:GetChildren()) do
        ret_val[ind] = val.Name
    end
    return ret_val
end

-- Predefining player data
getgenv().player_data = {}

-- Cheat needed variables
getgenv().cheat_vars = {}
getgenv().cheat_vars.walkspeed = 16
getgenv().cheat_vars.jumppower = 50
getgenv().cheat_vars.servermin = 6
getgenv().cheat_vars.servermax= 14

getgenv().cheat_vars.chosen_autobuycrate = {}
getgenv().cheat_vars.chosen_autoopencrates = {}

local crates_arr = getgenv().thunt_data.getCrateNames()
for i,v in pairs(crates_arr) do
    getgenv().cheat_vars.chosen_autobuycrate[v] = false
    getgenv().cheat_vars.chosen_autoopencrates[v] = false
end


getgenv().cheat_vars.chosen_autofarm = {}
local chests_arr = getgenv().thunt_data.getChestNames(true)
for i,v in pairs(chests_arr) do
    getgenv().cheat_vars.chosen_autofarm[v] = false
end

sandblocks = workspace.SandBlocks--:WaitForChild("SandBlocks")

-- Utility functions
-- Data related functions
local function saveData()
    if getgenv().player_data["player"] == nil then
        return false
    end
    local table = 
    {
        cheat_var = getgenv().cheat_vars,
        cheat_setting = getgenv().cheat_settings
    }
    local json = HttpService:JSONEncode(table)
    makefolder("BongoTHS")
    writefile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt", json)
    return true
end

local function loadData()
    if getgenv().player_data["player"] == nil then
        return false
    end
    if(not isfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")) then
        return nil
    end
    local file_content = readfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")
    local table = HttpService:JSONDecode(file_content)
    if table.cheat_setting.savesettings == true then
        getgenv().cheat_vars = table.cheat_var
        getgenv().cheat_settings = table.cheat_setting
    end
    return true
end

local function removeData()
    if getgenv().player_data["player"] == nil then
        return false
    end
    if isfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt") then
        delfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")
    end
end

-- Other functions
local function spawnThread(task, ...)
    local cor = coroutine.create(task)
    local success, message = coroutine.resume(cor, ...)
    return cor, success, message
end

local function updatePlayerData()
    getgenv().player_data["player"] = Players.LocalPlayer
    getgenv().player_data["character"] = getgenv().player_data["player"].Character or getgenv().player_data["player"].CharacterAdded:Wait()
    getgenv().player_data["humanoid"] = getgenv().player_data["character"]:WaitForChild("Humanoid")
    getgenv().player_data["root"] = getgenv().player_data["character"]:WaitForChild("HumanoidRootPart")
    getgenv().player_data["tool"] = nil
    for ind, val in pairs(getgenv().player_data["player"].Backpack:GetChildren()) do--:WaitForChild("Backpack"):GetChildren()) do
        if val:IsA("Tool") then
            getgenv().player_data["tool"] = val
            break
        end
    end

    if getgenv().player_data["tool"] == nil then
        for ind, val in pairs(getgenv().player_data["character"]:GetChildren()) do
            if val:IsA("Tool") then
                getgenv().player_data["tool"] = val
                break
            end
        end
    end
    getgenv().player_data["coins"] = getgenv().player_data["player"].leaderstats.Coins--:WaitForChild("leaderstats"):WaitForChild("Coins")
end

local function createInstance(inst, args)
    local instance = Instance.new(inst)
    -- Instance properties
    for key, value in pairs(args) do
        instance[key] = value
    end
    return instance
end

local function strToVec2(str, char)
    local temp = string.split(str, char)
    return {temp[1], temp[2]}
end

-- Cheat functions
updatePlayerData()

--[[local function goInvisible()
    local clone = getgenv().player_data["character"]:WaitForChild("LowerTorso"):WaitForChild("Root"):Clone()
    local before_tp = getgenv().player_data["root"].CFrame 

    getgenv().player_data["root"].Anchored = true
    getgenv().player_data["root"].CFrame = CFrame.new(-102, 10, -416)
    getgenv().player_data["root"].Anchored = false
    
    local part = createInstance("Part", 
    {
        Anchored = true,
        CFrame = CFrame.new(-102, 10, -416),
        Size = Vector3.new(5, 5, 5),
        CanTouch = true,
        CanCollide = false,
        Parent = workspace
    })
    part.Touched:Connect(function()
        game.Players.LocalPlayer.Character.LowerTorso.Root:Destroy()
        game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = before_tp
        part:Destroy()
    end)
end]]

local function serverHop(min_players, max_players)
    local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
    local teleported = false
    local cursor = ""
    while not teleported  do
        if servers.nextPageCursor ~= nil then
            for i,v in pairs(servers.data) do
                if v.playing < min_players then
                    continue
                end
                if v.playing > max_players then
                    continue
                end
                teleported = true
                TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                break
            end
            if not teleported then
                cursor = servers.nextPageCursor
                servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor))
            end
        else
            wait(10)
            servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor))
        end
        wait(1)
    end
end

local function teleportTo(cframe)
    getgenv().player_data["root"].CFrame = cframe
end

local function setWalkSpeed(number)
    getgenv().player_data["humanoid"].WalkSpeed = number
end

local function setJumpPower(number)
    getgenv().player_data["humanoid"].JumpPower = number
end

local function platformStand()
    local args = 
    {
        Anchored = true,
        Parent = workspace,
        CFrame = getgenv().player_data["root"].CFrame - Vector3.new(0, 3.6, 0)
    }
    
    local part = createInstance("Part", args)

    -- Removing part
    part.TouchEnded:Connect(function(tpart)
        if tpart.Parent == getgenv().player_data["character"] then
            part:Destroy()
        end
    end)
end

local function findChest(filters)
    for ind1, part1 in pairs(sandblocks:GetChildren()) do
        if part1:FindFirstChild("Chest") then
            local chest_type =  part1:FindFirstChild("Mat")
            if chest_type == nil then
                continue
            end
            for i,v in pairs(filters) do
                if v == chest_type.Value or v:match(chest_type.Value) then
                    return part1
                end
            end
        end
    end
    return nil
end

local function getFirstBlock()
    local children = sandblocks:GetChildren()
    for i,v in pairs(children) do
        if v:FindFirstChild("Rock") == nil or v:FindFirstChild("Chest") == nil then
            --return v
        end
    end
    return nil
end

local function digBlock(block)
    while getgenv().player_data["tool"] == nil do
        updatePlayerData()
        wait()
    end
    while(getgenv().player_data["tool"].Parent ~= getgenv().player_data["character"] and getgenv().player_data["tool"].Parent ~= getgenv().player_data["player"].Backpack) do--:WaitForChild("Backpack"))  do
        updatePlayerData()
        wait()
    end

    getgenv().player_data["humanoid"]:EquipTool(getgenv().player_data["tool"])

    getgenv().player_data["tool"]:FindFirstChild("RemoteClick"):FireServer(block)
end

local function checkMaxBackpack()
    local amount = getgenv().player_data["player"].PlayerGui.Gui.Buttons.Sand.Amount--:WaitForChild("PlayerGui"):WaitForChild("Gui"):WaitForChild("Buttons"):WaitForChild("Sand"):WaitForChild("Amount")
    local backpack_status = strToVec2(Amount.Text, " / ")
    return backpack_status[1] == backpack_status[2]
end

--[[local function checkMaxBackpack()
    local amount = game:GetService("Workspace").LocalPlayer.Starterpack.Counter.SurfaceGui.TextLabel
    local backpack_status = strToVec2(TextLabel.Text, "/")
    return backpack_status[1] == backpack_status[2]
end]]

local function sell()
    while checkMaxBackpack() do
        --game:GetService("ReplicatedStorage").Events.AreaSell:FireServer()
        teleportTo(CFrame.new(2201, 10, -254))
        wait(1)
    end
end

local function sellReturn()
    local cframe = getgenv().player_data["root"].CFrame
    sell()
    getgenv().player_data["root"].CFrame = cframe
end

local function checkIfItemOwned(item_name)
    getgenv().thunt_data.check_if_owned:InvokeServer(item_name)
end

local function buyItem(item_name)
    local args = 
    {
        [1] = item_name
    }  
    getgenv().thunt_data.buy_item:FireServer(unpack(args))
end

local function buyCrate(crate_name, target_name,quantity)
    local args = 
    {
        [1] = getgenv().thunt_data.crates[crate_name],
        [2] = target_name,
        [3] = quantity
    }
    
    getgenv().thunt_data.buy_crate:FireServer(unpack(args))
end

local function openCrate(crate_name)
    local args = 
    {
        [1] = getgenv().thunt_data.crates[crate_name]
    }

    getgenv().thunt_data.open_crate:FireServer(unpack(args))
end

local function rebirth()
    getgenv().thunt_data.rebirth:FireServer()
end

local function getCurrentItem(item_type)
    if string.lower(item_type) == "shovels" then
        return getgenv().player_data["tool"].Name
    elseif string.lower(item_type) == "backpacks" then
        local backpack
        for i,v in pairs(getgenv().player_data["character"]:GetChildren()) do
            if v:IsA("Model") then
                return v.Name
            end
        end
    elseif string.lower(item_type) == "pets" then
        local pet_holder = getgenv().player_data["character"].PetHolder--:WaitForChild("PetHolder")
        local children = pet_holder:GetChildren()
        if #children == 0 then
            return "None"
        end
        return children[1].Name
    end
end

local function getNextBestItem(item_type, max_price)
    local current_item_name = getCurrentItem(item_type)
    if current_item_name == nil then
        return nil
    end
    local current_item
    local min_price
    if current_item_name ~= "None" then
        current_item = getgenv().thunt_data[item_type][current_item_name]
        if current_item == nil then
            return nil
        end
        min_price = current_item.Price.Value--:WaitForChild("Price").Value
    else
        min_price = 0
    end
    
    local next_best_item
    for i, item in pairs(getgenv().thunt_data[item_type]:GetChildren()) do
        if item_type == "shovels" then
            local item_tool = item:WaitForChild(item.Name)
            local item_configuration = item_tool:WaitForChild("Configurations")
            local item_type = item_configuration:WaitForChild("ToolType")

            if item_type.Value == "Bomb" then
                continue
            end
        end

        local item_price = item.Price.Value--:WaitForChild("Price").Value

        if item_price <= min_price then
            continue
        elseif item_price > max_price then
            continue
        end

        next_best_item = item
        min_price = item_price
    end
    return next_best_item
end

local function buyNextBestItem(item_type)
    local item = getNextBestItem(item_type, getgenv().player_data["coins"].Value)
    if item == nil then
        return
    end
    buyItem(item.Name)
end

local function buyEverything()
    if getgenv().cheat_settings.autorebirth then
        rebirth()
    end

    if getgenv().cheat_settings.autobuyshovels then
        buyNextBestItem("shovels")
    end

    if getgenv().cheat_settings.autobuybackpacks then
        buyNextBestItem("backpacks")
    end

    if getgenv().cheat_settings.autobuypets then
        buyNextBestItem("pets")
    end

    updatePlayerData()
end

--[[ Free gamepasses
local oldFunction
oldFunction = hookmetamethod(game, "__namecall", newcclosure(function(Self, ...)
    if not checkcaller() then
        if Self == MarketplaceService then
            local method = getnamecallmethod()
            if method == "UserOwnsGamePassAsync" then
                if getgenv().cheat_settings.freegamepass then
                    return true
                else
                    return oldFunction(Self, ...)
                end
            end
        end
    end
    return oldFunction(Self, ...)
end))]]

--[[ Sell
if getgenv().cheat_settings.autosell then
    if checkMaxBackpack() then
        sellReturn()
        buyEverything()
    end
end]]

-- Autochest
local function autoChest(chests)
    local block = findChest(chests) or getFirstBlock()
    if block == nil then
        return
    end
    local hp = block.Health.Value
    local retries = 0
    while getgenv().cheat_settings.autochest and block ~= nil do
        if block.Parent ~= sandblocks then
            break
        end
        if getgenv().cheat_settings.autosell then
            if checkMaxBackpack() then
                sellReturn()
                buyEverything()
            end
        end
        getgenv().cheat_settings.gcollide = false
        teleportTo(block.CFrame + Vector3.new(0, block.Size.Y, 0))
        digBlock(block)
        wait(getgenv().player_data["tool"].Configurations.AttackLength.Value)--:WaitForChild("Configurations"):WaitForChild("AttackLength").Value)
--[[    if hp then
            retries = retries + 1
        else
            retries = 0
        end
        if retries >= 3 then
            block.Parent = nil
            break
        end
        ]]
        --hp = block.Health.Value
    end
end

-- Cheat event functions
-- Auto character update
--[[getgenv().player_data["player"].CharacterAdded:Connect(function(char)
    updatePlayerData()
    if getgenv().cheat_settings.autoinvisible then
        goInvisible()
    end
end)
]]
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

local lib = loadstring(game:HttpGet"https://pastebin.com/raw/aDQ86WZA")()

local win = lib:Window("Y&F | 寻宝模拟器",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E) -- your own keybind 

local tab = win:Tab("主要功能")

tab:Button("自动挖宝箱GUI", function()
loadstring(game:HttpGet("https://pastefy.app/lS5bla3z/raw"))()
end)

tab:Toggle("自动重生", false, function(state)
    getgenv().cheat_settings.autorebirth = state
end)

tab:Toggle("自动售卖", false, function(state)
    getgenv().cheat_settings.autosell = state
end)

tab:Toggle("自动购买铲子", false, function(state)
    getgenv().cheat_settings.autobuyshovels = state
end)

tab:Toggle("自动购买宠物", false, function(state)
    getgenv().cheat_settings.autobuypets = state
end)

tab:Toggle("自动购买背包", false, function(state)
    getgenv().cheat_settings.autobuypets = state
end)

tab:Toggle("自动购买板条箱", false, function(state)
    getgenv().cheat_settings.autobuycrates = state
end)

spawnThread(function()
    while wait() do
        while getgenv().cheat_settings.autorebirth do
            rebirth()
            wait(1)
        end
    end
end)

spawnThread(function()
    while wait() do
        while getgenv().cheat_settings.autobuycrates do
            for k,v in pairs(getgenv().cheat_vars.chosen_autobuycrate) do
                if v == true then
                    buyCrate(k, getgenv().player_data["player"].Name, 1)
                end
            end
            wait(0.5)
        end
    end
end)