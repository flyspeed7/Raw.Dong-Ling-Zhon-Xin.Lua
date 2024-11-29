local function tpSpawn()
    Character.HumanoidRootPart.CFrame = CFrame.new(188,32,271)
end

local ESP = Instance.new("Highlight")
ESP.OutlineColor = Color3.new(255,255,255)
ESP.OutlineTransparency = 0
ESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
ESP.FillColor = Color3.new(255,0,0)
ESP.FillTransparency = 0.5
ESP.Parent = game:GetService("ReplicatedStorage")
ESP.Name = "ESPHighlightinger"

local desthigh = game.ReplicatedStorage:FindFirstChild("ESPHighlight")
if desthigh then
    desthigh:Destroy()
end
ESP.Name = "ESPHighlight"

local pESP = Instance.new("Highlight")
pESP.OutlineColor = Color3.new(255,255,255)
pESP.OutlineTransparency = 0
pESP.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
pESP.FillColor = Color3.new(0,255,0)
pESP.FillTransparency = 0.5
pESP.Parent = game:GetService("ReplicatedStorage")
pESP.Name = "pESPHighlightinger"

local desthigh = game.ReplicatedStorage:FindFirstChild("pESPHighlight")
if desthigh then
    desthigh:Destroy()
end
pESP.Name = "pESPHighlight"

local Headlight = Instance.new("PointLight")
Headlight.Name = "Headlight"
Headlight.Parent = Character:WaitForChild("Head")
Headlight.Brightness = 2.5
Headlight.Enabled = false
Headlight.Range = 40
Headlight.Color = Color3.new(255,255,255)
Headlight.Shadows = true

local destlight = Character:WaitForChild("Head"):FindFirstChild("Headlight")
if destlight then
    if destlight.Shadows == false then
        destlight:Destroy()
    end
end
Headlight.Shadows = false

Tab:AddToggle({
        Name = "实体 ESP",
        Default = false,
        Callback = function(Value)
                if Value == true then
            for _, monster in pairs(workspace.Monsters:GetChildren()) do
                local newlight = ESP:Clone()
                newlight.Parent = monster
            end
        else
            for _, i in pairs(workspace.Monsters:GetChildren()) do
                local esp = i:FindFirstChild(ESP.Name)
                if esp then
                    esp:Destroy()
                end
            end
        end
        end    
})

Tab:AddToggle({
        Name = "玩家 ESP",
        Default = false,
        Callback = function(Value)
                if Value == true then
            for _, player in pairs(game.Players:GetChildren()) do
                if player.Name ~= Character.Name then
                    local newlight = pESP:Clone()
                    newlight.Parent = player.Character
                end
            end
        else
            for _, player in pairs(game.Players:GetChildren()) do
                local esp = player.Character:FindFirstChild(pESP.Name)
                if esp then
                    esp:Destroy()
                end
            end
        end
        end    
})
-- 188, 32, 271

Tab:AddButton({
        Name = "自动收集积木块",
        Callback = function()
        for v=1, 24 do
            if workspace:FindFirstChild("Block"..v) then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Block"..v).TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
        end
        end    
})

Tab:AddButton({
        Name = "自动收集食品包",
        Callback = function()
        for v=1, 15 do
            if workspace:FindFirstChild("FoodGreen") then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("FoodGreen").TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
            if workspace:FindFirstChild("FoodOrange") then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("FoodOrange").TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
            if workspace:FindFirstChild("FoodPink") then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("FoodPink").TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
        end
        end    
})

Tab:AddButton({
        Name = "自动收集保险丝",
        Callback = function()
        for v=1, 14 do
            if workspace:FindFirstChild("Fuse"..v) then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Fuse"..v).TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
        end
        end    
})

Tab:AddButton({
        Name = "自动收集电池",
        Callback = function()
        for v=1, 24 do
            if workspace:FindFirstChild("Battery") then
                Character.HumanoidRootPart.CFrame = workspace:FindFirstChild("Battery").TouchTrigger.CFrame
                wait(0.2)
                Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model").Trigger.CFrame
                wait(0.2)
                tpSpawn()
                wait(0.2)
            end
        end
        end    
})

Tab:AddButton({
        Name = "传送到威胁",
        Callback = function()
        Character.HumanoidRootPart.CFrame = workspace["GroupBuildStructures"]:FindFirstChildOfClass("Model"):FindFirstChild("Trigger").CFrame
    end    
})

Tab:AddParagraph("制作：Q3E4","QQ群:884776077")