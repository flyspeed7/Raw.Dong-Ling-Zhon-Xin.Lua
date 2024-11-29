--[[
	死妈仔们请不要天天看我的开源库哦~~,因为你们太死妈了~~
]]
local Library = loadstring(game:HttpGet("https://raw.githubusercontent.com/xHeptc/Kavo-UI-Library/main/source.lua"))()
local Window = Library.CreateLib("冬凌汉化 | Cy刀模拟器", "Sentinel")

local MainTab = Window:NewTab("主要的")
local MainSection = MainTab:NewSection("主要功能")
local EggSection = MainTab:NewSection("买蛋功能")
local MiscSection = MainTab:NewSection("更多功能")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local EggFrame = player.PlayerGui.MainGui.Frames.EggsFrame.ScrollingFrame

local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Workspace = game:GetService("Workspace")

-- Main
_G.AutoSwing = false
_G.AutoRebirth = false

-- Egg
_G.AutoHatch = false
_G.SelectedEgg = nil

-- Miscellaneous
_G.AutoHill = false
_G.AutoBonusArea = false
_G.SelcetedBonusArea = nil

local EggCost = {
    Egg1 = 250,
    Egg2 = 1000,
    Egg3 = 2500,
    Egg4 = 5000,
    Egg5 = 10000,
    Egg6 = 25000,
    Egg7 = 50000,
    Egg8 = 75000,
    Egg9 = 100000,
    Egg10 = 125000,
    Egg11 = 150000,
    Egg12 = 175000,
    Egg13 = 200000,
    Egg14 = 200000,
    Egg15 = 225000
}

local EggDropdown = {}
for Name, _ in pairs(EggCost) do
    local eggTitle = EggFrame:WaitForChild(Name).EggTitle.Text
    table.insert(EggDropdown, eggTitle)
end

local BonusAreaDropdown = {}
for _, area in ipairs(workspace.BonusAreas:GetChildren()) do
    local areaName = area.Name
    table.insert(BonusAreaDropdown, areaName)
end

MainSection:NewToggle("自动挥舞", "可以自动挥舞", function(state)
    _G.AutoSwing = state
    while _G.AutoSwing and task.wait(0.1) do
        if character:FindFirstChildOfClass("Tool") and character.Humanoid.Health > 0 then
            character:FindFirstChildOfClass("Tool"):Activate()
        elseif character:FindFirstChild("Humanoid") and character.Humanoid.Health > 0 then
            local tool = player.Backpack:FindFirstChildOfClass("Tool")
            if tool then
                character.Humanoid:EquipTool(tool)
            end
        end
    end
end)

MainSection:NewToggle("自动重生", "终于不用买自动重生了😭", function(state)
    _G.AutoRebirth = state
    while _G.AutoRebirth and task.wait(0.2) do
        if character.Humanoid.Health > 0 then
            local playerData = player:FindFirstChild("PlayerData")
            if playerData and playerData.Strength.Value >= playerData.RebirthRequirement.Value and playerData.CanRebirth.Value then
                ReplicatedStorage:WaitForChild("RebirthPlayer"):FireServer(false)
            end
        end
    end
end)

EggSection:NewDropdown("买坤蛋", "你想买什么坤蛋?", EggDropdown, function(currentOption)
    _G.SelectedEgg = currentOption
end)

EggSection:NewToggle("自动孵化坤蛋", "你不用手动点击了", function(state)
    _G.AutoHatch = state
    while _G.AutoHatch and task.wait(0.2) do
        if character.Humanoid.Health > 0 then
            local HatchPet = ReplicatedStorage:WaitForChild("HatchPet")
            local hasSpace = ReplicatedStorage.CheckSpace:InvokeServer(false, 0, true)

            for Name, _ in pairs(EggCost) do
                if EggFrame:WaitForChild(Name).EggTitle.Text == _G.SelectedEgg then
                    if player.leaderstats.Gems.Value >= EggCost[Name] and hasSpace then
                        HatchPet:FireServer(Name, 1, hasSpace)
                    end
                    break
                end
            end
        end
    end
end)

MiscSection:NewDropdown("你要传送到哪里?", "快速传送!", BonusAreaDropdown, function(currentOption)
    _G.SelcetedBonusArea = currentOption
end)

MiscSection:NewToggle("自动区域之王", "自动传送到你区域的最高乘数", function(state)
    _G.AutoBonusArea = state
    while _G.AutoBonusArea and task.wait(0) do
        if character and character:FindFirstChild("HumanoidRootPart") and character.Humanoid.Health > 0 then
            for _, area in ipairs(workspace.BonusAreas:GetChildren()) do
                local areaName = area.Name
                if areaName == _G.SelcetedBonusArea then
                    local BonusArea = area:FindFirstChild('BonusArea')
                    if BonusArea then
                        BonusArea.CFrame = character.HumanoidRootPart.CFrame
                        BonusArea.Transparency = 1
                        BonusArea.BrickColor = BrickColor.new("Maroon")
                    end
                    break
                end
            end
        end
    end
end)

MiscSection:NewToggle("自动上最高乘数", "使你的手指解放!", function(state)
    _G.AutoHill = state
    while _G.AutoHill and task.wait(0) do
        if character and character:FindFirstChild("HumanoidRootPart") and character.Humanoid.Health > 0 then
            for _, descendant in ipairs(Workspace:GetChildren()) do
                if descendant:IsA("Model") and descendant.Name == "KingOfHill" then
                    local bonusArea = descendant:FindFirstChild("BonusArea")
                    if bonusArea and bonusArea:GetAttribute("Bonus") == 700 then
                        bonusArea.CFrame = character.HumanoidRootPart.CFrame
                        bonusArea.Transparency = 1
                        bonusArea.BrickColor = BrickColor.new("New Yeller")
                        break
                    end
                end
            end
        end
    end
end)

character.Humanoid.WalkSpeed = 48
player.CharacterAdded:Connect(function(Char)
    character = Char
    character.Humanoid.WalkSpeed = 48
end)

player.Idled:Connect(function()
    local virtualUser = game:GetService('VirtualUser')
    virtualUser:CaptureController()
    virtualUser:ClickButton2(Vector2.new())
end)