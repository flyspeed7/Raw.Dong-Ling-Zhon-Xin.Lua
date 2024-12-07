local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Raw.Dong-Ling-Zhon-Xin.Lua/refs/heads/main/Raw.Main-Orion-UI.Lua"))()
  local Window = OrionLib:MakeWindow({Name = "秋枫| 格蕾丝", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})
  local Tab= Window:MakeTab({ 
         Name = "Main", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
   local Section = Tab:AddSection({  
  
          Name = "自制"  
  
  })  
 Tab:AddToggle({  
          Name = "自动删除怪物",  
          Default = false,  
          Callback = function()  
game.StarterGui:SetCore("SendNotification", {
                Title = "加载完成✅",
                Text = "你可以使用了",
                Duration = 2
end
workspace.DescendantAdded:Connect(function(descendant)
    if descendant:IsA("ParticleEmitter") then
        descendant.Rate = descendant.Rate * 10
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "base" and descendant:IsA("BasePart") then
        local player = game.Players.LocalPlayer
        if player and player.Character and player.Character:FindFirstChild("HumanoidRootPart") then
            descendant.Position = player.Character.HumanoidRootPart.Position

            game.StarterGui:SetCore("SendNotification", {
                Title = "鬼物来的时候,我会帮你消除",
                Text = "自动消除鬼物",
                Duration = 3
            })
        end
    end
end)

workspace.DescendantAdded:Connect(function(descendant)
    if descendant.Name == "eye" or descendant.Name == "elkman" or descendant.Name == "Rush" or descendant.Name == "Worm" or descendant.Name == "eyePrime" then
        descendant:Destroy()
    end
end)

local players = game:GetService("Players")
local localPlayer = players.LocalPlayer

while true do
    local eyeGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("eyegui")
    if eyeGui then
        eyeGui:Destroy()
    end
    task.wait(0.1)
end

while true do
    local smileGui = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("smilegui")
    if smileGui then
        smileGui:Destroy()
    end
    task.wait(0.1)
end

while true do
    local funnygoatman = localPlayer:FindFirstChild("PlayerGui"):FindFirstChild("GOATPORT")
    if funnygoatman then
        funnygoatman:Destroy()
    end
    task.wait(0.1)
end
          end  
  }) 
 
 Tab:AddButton({        
Name = "断开Orion连接",        
Callback = function()        
          OrionLib:Destroy()
     end
})