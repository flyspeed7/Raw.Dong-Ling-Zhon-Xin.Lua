local OpenUI = Instance.new("ScreenGui") 
local ImageButton = Instance.new("ImageButton") 
local UICorner = Instance.new("UICorner") 
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
ImageButton.Parent = OpenUI 
ImageButton.BackgroundColor3 = Color3.fromRGB(5, 6, 7) 
ImageButton.BackgroundTransparency = 0.500 
ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
ImageButton.Size = UDim2.new(0, 50, 0, 50) 
ImageButton.Image = "rbxassetid://15613380753" 
ImageButton.Draggable = true 
UICorner.CornerRadius = UDim.new(0, 200) 
UICorner.Parent = ImageButton 
ImageButton.MouseButton1Click:Connect(function() 
  if uihide == false then
	uihide = true
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 0, 0, 0),"In","Quad",0.4,true)
else
	uihide = false
	game.CoreGui.ui.Main:TweenSize(UDim2.new(0, 560, 0, 319),"Out","Quad",0.4,true)
		end 
		
end)

uihide = false

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()
local win = lib:Window("Y&F | 彩虹朋友 1/2",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E)

local tab = win:Tab("主要")

tab:Button("自动收集", function()
attempts = 0
   for i,v in pairs(game:GetService("Workspace"):GetChildren()) do
 if v:FindFirstChild("TouchTrigger") and attempts < 10 then
     attempts = attempts + 1
       firetouchinterest(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart,v.TouchTrigger,0)
 
   end
end
end)

tab:Button("自动放置", function()
game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true)
firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 0)
task.wait()
firetouchinterest(game:GetService("Workspace").GroupBuildStructures:FindFirstChild("Trigger", true), game.Players.LocalPlayer.Character.HumanoidRootPart, 1)
end)

tab:Toggle("怪物透视", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
end)

tab:Toggle("物品透视", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") then
                    if not v:FindFirstChild("Lol") then
                        local esp = Instance.new("Highlight", v)
                        esp.Name = "Lol"
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        esp.FillColor = Color3.new(0, 255, 0)
                    end
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("TouchTrigger") then
                v:FindFirstChild("Lol"):Destroy()
            end
        end
    end
end)