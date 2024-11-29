--[[Ragdoll on Skates Obby 脚本自制
local a = loadstring(game:HttpGet("https://raw.githubusercontent.com/bloodball/-back-ups-for-libs/main/turtle"))()

local b = a:Window("R-S-O 脚本")

b:Label("开发者:琳", Color3.fromRGB(127, 143, 166))

b:Button("", function()
    game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Skips", math.huge)
end)

b:Box("Input Skips", function(c, d)
    if d then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Skips", c)
    end
end)

b:Button("inf Wins", function()
    game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Wins", math.huge)
end)

b:Box("Input wins", function(e, f)
    if f then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Wins", e)
    end
end)

b:Button("inf Spins", function()
    game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Spins", math.huge)
end)

b:Box("Input spins", function(g, h)
    if h then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Spins", g)
    end
end)

b:Button("inf Coins", function()
    game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Coins", math.huge)
end)

b:Box("Input coins", function(i, j)
    if j then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Coins", i)
    end
end)

b:Label("my discord server https://discord.gg/JudFZSNw", Color3.fromRGB(127, 143, 166))

b:Label("credit me if u do steal", Color3.fromRGB(127, 143, 166))
]]
  local Tab= Window:MakeTab({ 
         Name = "穿着溜冰鞋的布娃娃Obby", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
   local Section = Tab:AddSection({  
  
          Name = "自己做的😋"  
  
  })  
 Tab:AddButton({         
 Name = "复制服务器名字",         
 Callback = function()         
           setclipboard("Ragdoll on Skates Obby")
           
      end 
 })
Tab:AddButton({         
 Name = "无限跳过",         
 Callback = function()         
           game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Skips", math.huge)
           
      end 
 })
Tab:AddTextbox({
    Name = "输入获取跳过",
    TextDisappear = false,
    Callback = function(c, d)
            if d then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Skips", c)
    end
    end
})
Tab:AddButton({         
 Name = "无限胜利",         
 Callback = function()         
           game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Wins", math.huge)
           
      end 
 })
 Tab:AddTextbox({
    Name = "输入获取胜利",
    TextDisappear = false,
    Callback = function(e, f)
    if f then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Wins", e)
    end
    end
})
Tab:AddButton({         
 Name = "无限旋转",         
 Callback = function()         
          game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Spins", math.huge)
           
      end 
 })
 Tab:AddTextbox({
    Name = "输入获取旋转",
    TextDisappear = false,
    Callback = function(g, h)
    if h then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Spins", g)
    end
    end
})
Tab:AddButton({         
 Name = "无限金币",         
 Callback = function()         
           game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Coins", math.huge)
           
      end 
 })
 Tab:AddTextbox({
    Name = "输入获取跳过",
    TextDisappear = false,
    Callback = function(i, j)
    if j then
        game:GetService("ReplicatedStorage").Shared.RemoteFunctions.PlayerProfileRemote:InvokeServer("increment", "Coins", i)
    end
    end
})
