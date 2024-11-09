local NotificationHolder = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Module.Lua"))() 
 local Notification = loadstring(game:HttpGet("https://raw.githubusercontent.com/BocusLuke/UI/main/STX/Client.Lua"))() 
 wait(1)
 
  Notification:Notify( 
     {Title = "小公告", Description = "开始推演"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=7733747106", ImageColor = Color3.fromRGB(255, 84, 84)} 
 ) 
 wait(3) 
 Notification:Notify( 
     {Title = "不许圈钱", Description = "圈钱死妈，全家户口就一页"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=7733747106", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
 wait(3)
 Notification:Notify( 
     {Title = "请认准作者:小凌-Q3E4", Description = "作者:Q3E4-小凌"}, 
     {OutlineColor = Color3.fromRGB(80, 80, 80),Time = 10, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=7733747106", ImageColor = Color3.fromRGB(255, 84, 84)} 
 )
 wait(3)
  Notification:Notify( 
     {Title = "作者:1211373508", Description = "QQ 群：884776077"}, 
     {OutlineColor = Color3.fromRGB(255, 0, 0),Time = 5, Type = "image"}, 
     {Image = "http://www.roblox.com/asset/?id=7733747106", ImageColor = Color3.fromRGB(0, 0, 255)} 
 ) 
 wait(1)
 
       local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6797864253" 
     sound.Parent = game.Workspace 
     sound:Play()
  
--[[
Title = <string> - The title of the notification.
Content = <string> - The content of the notification.
Image = <string> - The icon of the notification.
Time = <number> - The duration of the notfication.
]]
local ScreenGui = Instance.new("ScreenGui") 
 ScreenGui.Name = "Credits" 
 ScreenGui.Parent = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui") 
  
 local playerGui = game.Players.LocalPlayer.PlayerGui 
  
 local health = 100 
  
 local healthGui = Instance.new("ScreenGui") 
 healthGui.Name = "HealthGui" 
 healthGui.Parent = playerGui 
  
 local healthFrame = Instance.new("Frame") 
 healthFrame.Name = "HealthFrame" 
 healthFrame.Size = UDim2.new(0, 150, 0, 20) 
 healthFrame.Position = UDim2.new(1, -170, 0, 20) 
 healthFrame.BackgroundColor3 = Color3.fromRGB(255, 0, 0) 
 healthFrame.BorderSizePixel = 0 
 healthFrame.Parent = healthGui 
 local healthBar = Instance.new("Frame") 
 healthBar.Name = "HealthBar" 
 healthBar.Size = UDim2.new(1, 0, 1, 0) 
 healthBar.BackgroundColor3 = Color3.fromRGB(255, 249, 74) 
 healthBar.BorderSizePixel = 0 
 healthBar.Parent = healthFrame 
  
 local function updateHealthGUI() 
    healthBar.Size = UDim2.new(health / 100, 0, 1, 0) 
 end 
  
 updateHealthGUI() 
  
 game.Players.LocalPlayer.Character.Humanoid.HealthChanged:Connect(function(newHealth) 
    health = newHealth 
    updateHealthGUI() 
 end) 
  
 local playerGui = game.Players.LocalPlayer.PlayerGui 
  
 local fpsGui = Instance.new("ScreenGui") 
 fpsGui.Name = "FpsGui" 
 fpsGui.Parent = playerGui 
  
 local fpsLabel = Instance.new("TextLabel") 
 fpsLabel.Name = "FpsLabel" 
 fpsLabel.Size = UDim2.new(0, 100, 0, 20) 
 fpsLabel.Position = UDim2.new(0, 20, 0, 20) 
 fpsLabel.BackgroundColor3 = Color3.new(0, 0, 0) 
 fpsLabel.TextColor3 = Color3.new(1, 1, 1) 
 fpsLabel.Font = Enum.Font.SourceSans 
 fpsLabel.FontSize = Enum.FontSize.Size14 
 fpsLabel.Text = "帧数: " 
 fpsLabel.Parent = fpsGui 
  
 local lastUpdate = tick() 
  
 local fps = 0 
  
 local function updateFpsCounter() 
     local deltaTime = tick() - lastUpdate 
     lastUpdate = tick() 
  
     fps = math.floor(1 / deltaTime) 
  
     fpsLabel.Text = "帧数: " .. fps 
 end 
  
 game:GetService("RunService").RenderStepped:Connect(updateFpsCounter) 
  
 local ImageLabel = Instance.new("ImageLabel") 
 ImageLabel.Name = "Image" 
 ImageLabel.AnchorPoint = Vector2.new(0.5, 0.5) 
 ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0) 
 ImageLabel.Size = UDim2.new(0.2, 0, 0.2, 0) 
 ImageLabel.Image = "rbxassetid://18733651372" 
 ImageLabel.Parent = ScreenGui 
 local TextLabel = Instance.new("TextLabel") 
 TextLabel.Name = "Text" 
 TextLabel.AnchorPoint = Vector2.new(0.5, 0.5) 
 TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0) 
 TextLabel.Size = UDim2.new(0.5, 0, 0.1, 0) 
 TextLabel.Font = Enum.Font.GothamBold 
 TextLabel.TextColor3 = Color3.new(1, 1, 1) 
 TextLabel.TextScaled = true 
 TextLabel.Text = "冬凌中心 5.0.0[FORMAL]" 
 TextLabel.Parent = ScreenGui 
  
 local function animateCredits() 
     local TweenService = game:GetService("TweenService") 
     local imageTween = TweenService:Create(ImageLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.2, 0)}) 
     local textTween = TweenService:Create(TextLabel, TweenInfo.new(10, Enum.EasingStyle.Quad, Enum.EasingDirection.Out), {Position = UDim2.new(0.5, 0, -0.1, 0)}) 
     imageTween:Play() 
     textTween:Play() 
  
     wait(10) 
  
     ImageLabel.Position = UDim2.new(0.5, 0, 0.4, 0) 
     TextLabel.Position = UDim2.new(0.5, 0, 0.6, 0) 
     ScreenGui:Destroy() 
 end 
  
 animateCredits() 
  
 local creditText = "冬凌加载中..." 
 local creditDuration = 5 
  
 local decalIds = { 
     5479567228, 
     5479565074, 
     5479559610, 
 } 
  
 local decalId = decalIds[math.random(#decalIds)] 
 local ScreenGui = Instance.new("ScreenGui") 
 ScreenGui.Name = "NotificationCreditsGui" 
 ScreenGui.ResetOnSpawn = false 
 ScreenGui.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
 ScreenGui.Parent = game.Players.LocalPlayer.PlayerGui 
  
 local Frame = Instance.new("Frame") 
 Frame.BackgroundTransparency = 1 
 Frame.BorderSizePixel = 0 
 Frame.Position = UDim2.new(1, -200, 1, -50) 
 Frame.Size = UDim2.new(0, 200, 0, 50) 
 Frame.Parent = ScreenGui 
  
 local Decal = Instance.new("Decal") 
 Decal.Texture = "rbxassetid://16060333448" .. decalId ---输入图片ID
 Decal.Face = Enum.NormalId.Back 
 Decal.Parent = Frame 
  
 local TextLabel = Instance.new("TextLabel") 
 TextLabel.BackgroundTransparency = 1 
 TextLabel.Font = Enum.Font.SourceSans 
 TextLabel.Text = creditText 
 TextLabel.TextColor3 = Color3.fromRGB(255, 255, 255) 
 TextLabel.TextSize = 16 
 TextLabel.Position = UDim2.new(0, 10, 0, 10) 
 TextLabel.Size = UDim2.new(1, -20, 1, -20) 
 TextLabel.Parent = Frame 
  
 local function animateNotification() 
     Frame:TweenPosition(UDim2.new(1, -200, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true) 
     wait(creditDuration - 1) 
     Frame:TweenPosition(UDim2.new(1, 0, 1, -50), Enum.EasingDirection.InOut, Enum.EasingStyle.Sine, 0.5, true) 
     wait(0.5) 
     ScreenGui:Destroy() 
 end 
  
 animateNotification() 
 local Notification = loadstring(game:HttpGet("https://api.irisapp.ca/Scripts/IrisBetterNotifications.lua")) 
 local bindable = Instance.new("BindableFunction") 
 bindable.OnInvoke = function(button) 
      local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6073491164" 
     sound.Parent = game.Workspace 
     sound:Play()
 end 
  
  print("反挂机已经为你开好了 喵~")  
                  local vu = game:GetService("VirtualUser")  
                  game:GetService("Players").LocalPlayer.Idled:connect(function()  
                     vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)  
                     wait(1)  
                     vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)  
                  end)  
                  wait(10)
local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/OrionLibe.GUI/refs/heads/main/orionui.lua"))()
  local Window = OrionLib:MakeWindow({Name = "冬凌 | 脚本中心", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion", IntroText = "作者:小凌 UI库:小云"})

--[[
Name = <string> - The name of the UI.
HidePremium = <bool> - Whether or not the user details shows Premium status or not.
SaveConfig = <bool> - Toggles the config saving in the UI.
ConfigFolder = <string> - The name of the folder where the configs are saved.
IntroEnabled = <bool> - Whether or not to show the intro animation.
IntroText = <string> - Text to show in the intro animation.
IntroIcon = <string> - URL to the image you want to use in the intro animation.
Icon = <string> - URL to the image you want displayed on the window.
CloseCallback = <function> - Function to execute when the window is closed.
]]
  local about = Window:MakeTab({  
      Name = "信息/介绍",  
      Icon = "rbxassetid://7743878358",  
      PremiumOnly = false  
  })  
  about:AddButton({	
Name = "打死ui[不隐藏]",	
Callback = function()	
  	OrionLib:Destroy()
     end
})
local Section = about:AddSection({
	Name = "更新日志: \n 加了几个脚本希望你喜欢"
})
  about:AddParagraph("您的用户名:"," "..game.Players.LocalPlayer.Name.."")  
  about:AddParagraph("您的注入器:"," "..identifyexecutor().."")  
  about:AddParagraph("您当前服务器的ID"," "..game.GameId.."")  
  about:AddParagraph("已获取进程","进程:0×1fa30d90")  
  about:AddParagraph("大家多多不支持","脚本无加密你可以看github")  
  about:AddParagraph("缝合","做大做强")  
  local Tab = Window:MakeTab({

	Name = "国内脚本",

	Icon = "rbxassetid://4483345998",

	PremiumOnly = false

})
 Tab:AddButton({         
 Name = "微山",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/weishanteam/Script/main/HUB_Loader.lua'))()
           
      end 
 })
 
Tab:AddButton({

	Name = "青风",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,116,53,87,75,53,72,48,72})end)())))("青风脚本")

    end

})

Tab:AddButton({

	Name = "静新",

	Callback = function()

loadstring(game:HttpGet("https://raw.githubusercontent.com/jxdjbx/gggggghjjnbb/main/jdjdd"))()

    end

})

Tab:AddButton({

	Name = "北极",

	Callback = function()

loadstring(game:HttpGet("https://pastebin.com/raw/KwARpDxV",true))()

    end

})

Tab:AddButton({

	Name = "SF",

	Callback = function()

SF_V7 = "作者_神罚"SheFa = "QQ群637340150"loadstring(game:HttpGet(('https://raw.githubusercontent.com/WDQi/SF/main/%E7%9C%8B%E4%BD%A0M.txt')))()

    end

})

Tab:AddButton({

	Name = "导管中心",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\117\115\101\114\97\110\101\119\114\102\102\47\114\111\98\108\111\120\45\47\109\97\105\110\47\37\69\54\37\57\68\37\65\49\37\69\54\37\65\67\37\66\69\37\69\53\37\56\68\37\56\70\37\69\56\37\65\69\37\65\69\34\41\41\40\41\10")()

    end

})

Tab:AddButton({

	Name = "忍",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,52,81,74,109,75,50,99,72})end)())))()

    end

})

Tab:AddButton({

	Name = "剑客",

	Callback = function()

loadstring(game:HttpGet(('https://raw.githubusercontent.com/jiankeQWQ/Sword-Guest/main/JKYYDS')))()

    end

})

Tab:AddButton({

	Name = "脚本中心",

	Callback = function()

loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\103\101\109\120\72\119\65\49"))()

    end

})

Tab:AddButton({

	Name = "鸭",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,81,89,49,113,112,99,115,106})end)())))()

    end

})

Tab:AddButton({

	Name = "水下世界",

	Callback = function()

loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\115\106\115\105\100\106\100\110\110\115\110\115\110\115\47\109\97\105\110\47\82\69\65\68\77\69\46\109\100\34\41\41\40\41")()

    end

})

Tab:AddButton({

	Name = "QB",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,51,69,49,54,76,51,90,106})end)())))()

    end

})

Tab:AddButton({

	Name = "神光",

	Callback = function()

loadstring(game:HttpGet(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,112,97,115,116,101,98,105,110,46,99,111,109,47,114,97,119,47,56,102,50,76,99,113,113,80})end)())))()

    end

})

Tab:AddButton({

	Name = "秋",

	Callback = function()

local SCC_CharPool={
[1]= tostring(utf8.char((function() return table.unpack({104,116,116,112,115,58,47,47,114,97,119,46,103,105,116,104,117,98,117,115,101,114,99,111,110,116,101,110,116,46,99,111,109,47,87,83,56,53,55,57,54,48,47,45,47,109,97,105,110,47,37,69,55,37,65,55,37,56,66,37,67,50,37,66,55,37,69,56,37,56,55,37,65,65,37,69,53,37,56,56,37,66,54,37,69,56,37,56,52,37,57,65,37,69,54,37,57,67,37,65,67,37,69,54,37,57,54,37,66,48,37,69,54,37,66,65,37,57,48,37,69,55,37,65,48,37,56,49,46,116,120,116})end)()))}
loadstring(game:HttpGet(SCC_CharPool[1]))()

    end

})

Tab:AddButton({

	Name = "云",

	Callback = function()

_G.Clouduilib = "白灰脚作者小云，加载出十几秒"loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/White-ash-script/main/%E7%99%BD%E7%81%B0%E8%84%9A%E6%9C%ACbeta.lua", true))()

    end

})

Tab:AddButton({

	Name = "XC",

	Callback = function()

getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))()

    end

})

Tab:AddButton({

	Name = "青",

	Callback = function()

loadstring(game:HttpGet('https://rentry.co/cyq78/raw'))()

    end

})

Tab:AddButton({

	Name = "星火",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/9319/%E6%98%9F%E7%81%AB%E4%BA%A4%E8%BE%89%E8%84%9A%E6%9C%AC%E6%BA%90%E7%A0%81.lua?sign=pw1GHDb-tSJH25rTcTo_QPhzJBe73nf7djKDL1vQN1M%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "鱼",

	Callback = function()

getgenv().FISH = "鱼脚本群:851686462"loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\101\108\112\71\101\116\40\34\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\72\119\81\77\82\90\68\69\34\41\41\40\41")("鱼脚本")

    end

})

Tab:AddButton({

	Name = "皇",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8577/%E7%9A%87v5.txt?sign=ToDT3Udyh4r3WwDu_yVblRL849qC2GJjjjQ7FTidF_w%3D%3A0"))()

    end

})

Tab:AddButton({

	Name = "空情",

	Callback = function()

loadstring(game:HttpGet("https://ayangwp.cn/api/v3/file/get/8628/%E9%9D%99?sign=uxlt7ravTFmP3TZLNgN7zImLHxJWhH93SEbKgFA_PRc%3D%3A0"))()

    end

})
 local Tab = Window:MakeTab({ 
         Name = "可加入的服务器", 
         Icon = "rbxassetid://7734053426", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "加入极速传奇", 
   Callback = function () 
     local game_id = 3101667897 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入鲨口求生2", 
   Callback = function () 
   local game_id = 8908228901 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer)  
   end  
 }) 
 Tab:AddButton({ 
   Name = "加入监狱人生", 
   Callback = function () 
     local game_id = 155615604 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入忍者传奇", 
   Callback = function () 
     local game_id = 3956818381 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入Break in", 
   Callback = function () 
     local game_id = 1318971886 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入自然灾害Game", 
   Callback = function () 
     local game_id = 189707 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入力量传奇", 
   Callback = function () 
     local game_id = 3623096087 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "加入餐厅大亨2", 
   Callback = function () 
     local game_id = 3398014311 
         local game_url = "https://www.roblox.com/games/"..game_id 
         game:GetService("TeleportService"):Teleport(game_id, game.Players.LocalPlayer) 
   end 
 }) 
  
 local Tab = Window:MakeTab({ 
         Name = "小凌音乐🤤", 
         Icon = "rbxassetid://16060333", 
         PremiumOnly = false 
 }) 
 local Section = Tab:AddSection({ 
  
         Name = "以下是长音乐后面会更恶搞和复制ID" 
  
 }) 
 Tab:AddButton({         
 Name = "国外音乐脚本",         
 Callback = function()          
 loadstring(game:HttpGet(('https://pastebin.com/raw/g97RafnE'),true))()                   
      end 
 }) 
   Tab:AddButton({ 
   Name = "国歌[Krx版]", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1845918434" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "妈妈生的", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6689498326" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "Music Ball-CTT", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://9045415830" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "电音", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6911766512" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "梗合集", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://8161248815" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "Its been so long", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6913550990" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "Baller", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://13530439660" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "男娘必听", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6797864253" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "螃蟹之舞", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://54100886218" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "布鲁克林惨案", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://6783714255" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
   Tab:AddButton({ 
   Name = "航空模拟器音乐", 
   Callback = function () 
         local sound = Instance.new("Sound") 
     sound.SoundId = "rbxassetid://1838080629" 
     sound.Parent = game.Workspace 
     sound:Play() 
   end 
 }) 
  
 local Tab = Window:MakeTab({ 
         Name = "老外获得罗宝", 
         Icon = "rbxassetid://11560341824", 
         PremiumOnly = false 
 }) 
 local Section = Tab:AddSection({ 
  
         Name = "以下为老外脚本😨😡🤓😂🤮🤣😎😒🤔" 
  
 }) 
 Tab:AddButton({ 
         Name = "10 Robux", 
         Callback = function() 
 game.Players.LocalPlayer:Kick('获取10Robux完成，请到通知查看') 
 end 
 }) 
 Tab:AddButton({ 
         Name = "20Robux", 
         Callback = function() 
 game.Players.LocalPlayer:Kick('获取20Robux完成，请到通知查看') 
 end 
 }) 
 Tab:AddButton({ 
         Name = "50Robux", 
         Callback = function() 
 game.Players.LocalPlayer:Kick('获取50Robux完成，请到通知查看') 
 end 
 }) 
 Tab:AddButton({ 
         Name = "100Robux", 
         Callback = function() 
 game.Players.LocalPlayer:Kick('臭傻屌被骗了吧😭😰😡😂🤓🤮😒🤣😎') 
 end 
 }) 
 Tab:AddTextbox({ 
         Name = "自定义Robux", 
         Default = "Robux", 
         TextDisappear = true, 
         Callback = function(Value) 
                 game.Players.LocalPlayer.Character.Humanoid.Health = Value 
         end          
 }) 
 
   local Tab = Window:MakeTab({  
    Name = "通用/玩家",  
    Icon = "rbxassetid://7733970494",  
    PremiumOnly = false  
    })  
  
  local Section = Tab:AddSection({  
  
          Name = "有一点功能开不了"  
  
  })  
  Tab:AddSlider({  
  
          Name = "速度展示：",  
  
          Min = 16,  
  
          Max = 200,  
  
          Default = 16,  
  
          Color = Color3.fromRGB(127,251,111),  
  
          Increment = 1,  
  
          ValueName = "数值",  
  
          Callback = function(Value)  
  
                  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value  
  
          end      
  
  })  
  Tab:AddSlider({  
  
          Name = "跳跃高度",  
  
          Min = 50,  
  
          Max = 200,  
  
          Default = 50,  
  
          Color = Color3.fromRGB(127,251,111),  
  
          Increment = 1,  
  
          ValueName = "数值",  
  
          Callback = function(Value)  
  
                  game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value  
  
          end      
  
  })  
  
  Tab:AddButton({  
          Name = "控制玩家(小凌汉化)谢谢",  
          Callback = function()        loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/XiaoLing-CODE.tk3usj449llspw1/main/%E7%8E%A9%E5%AE%B6%E6%8E%A7%E5%88%B6%20%E6%B1%89%E5%8C%96.txt"))()  
            end  
  })  
  Tab:AddButton({
	Name = "飞行V3",
	Callback = function()
     loadstring(game:HttpGet('https://pastebin.com/raw/AjDmq385'))()
  	end    
})
Tab:AddToggle({  
          Name = "自动互动",  
          Default = false,  
          Callback = function(state)  
       if state then
            autoInteract = true
            while autoInteract do
                for _, descendant in pairs(workspace:GetDescendants()) do
                    if descendant:IsA("ProximityPrompt") then
                        fireproximityprompt(descendant)
                    end
                end
                task.wait(0.15) -- Adjust the wait time as needed
            end
        else
            autoInteract = false
        end
          end  
  })  
  
  Tab:AddTextbox({  
          Name = "移动速度",  
          Default = "Speed",  
          TextDisappear = true,  
          Callback = function(Value)  
                  game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value  
          end           
  })  
  
   Tab:AddTextbox({  
          Name = "跳跃高度",  
          Default = "Jump",  
          TextDisappear = true,  
          Callback = function(Value)  
                  game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value  
          end           
  })  
  
  Tab:AddTextbox({  
          Name = "最大血量",  
          Default = "HP",  
          TextDisappear = true,  
          Callback = function(Value)  
                  game.Players.LocalPlayer.Character.Humanoid.MaxHealth = Value  
          end           
  })  
  
  Tab:AddTextbox({  
          Name = "当前血量",  
          Default = "U.HP",  
          TextDisappear = true,  
          Callback = function(Value)  
                  game.Players.LocalPlayer.Character.Humanoid.Health = Value  
          end           
  })  
  
  Tab:AddTextbox({  
          Name = "重力设置",  
          Default = "GR",  
          TextDisappear = true,  
          Callback = function(Value)  
                  game.Workspace.Gravity = Value  
          end  
  })  
  
  Tab:AddButton({  
          Name = "回满血",  
          Callback = function()  
  game.Players.LocalPlayer.Character.Humanoid.Health = game.Players.LocalPlayer.Character.Humanoid.MaxHealth   
  end  
  })  
  local Section = Tab:AddSection({  
  
          Name = "工具包"  
  
  })  
  Tab:AddButton({          
  Name = "工具包",          
  Callback = function()        loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/BTools.txt"))()                    
       end  
  })  
  Tab:AddButton({  
          Name = "透视",  
          Callback = function()  
       loadstring(game:HttpGet('https://pastebin.com/raw/MA8jhPWT'))()  
            end      
  })  
  Tab:AddButton({  
          Name = "飞车",  
          Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/MHE1cbWF"))()  
          end  
  })  
  Tab:AddButton({  
          Name = "甩飞",  
          Callback = function() loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()  
          end  
  })  
  Tab:AddButton({  
    Name = "高亮",  
    Callback = function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/4LDKiJ5a"))()  
      end  
  })  
  Tab:AddButton({  
          Name = "无限跳",  
          Callback = function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/V5PQy3y0", true))()  
      end  
  })  
  
  Tab:AddButton({  
        Name = "阿尔宙斯V3.0 UI",  
        Callback = function()  
        loadstring(game:HttpGet("https://raw.githubusercontent.com/AZYsGithub/chillz-workshop/main/Arceus%20X%20V3"))()  
        end  
  })  
  
  Tab:AddButton({  
    Name = "光影_2",  
    Default = false,  
    Callback = function()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MZEEN2424/Graphics/main/Graphics.xml"))()  
    end  
  })  
  
  Tab:AddButton({  
    Name = "美丽天空",  
    Callback = function()  
      -- Roblox Graphics Enhancher  
      local light = game.Lighting  
      for i, v in pairs(light:GetChildren()) do  
        v:Destroy()  
      end  
  
      local ter = workspace.Terrain  
      local color = Instance.new("ColorCorrectionEffect")  
      local bloom = Instance.new("BloomEffect")  
      local sun = Instance.new("SunRaysEffect")  
      local blur = Inst  
    end  
  })  
  
  Tab:AddButton({  
          Name = "超高画质",  
          Callback = function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/jHBfJYmS"))()  
  end  
  })      
  local Section = Tab:AddSection({  
  
          Name = "范围"  
  
  })  
  Tab:AddButton({  
          Name = "Acrylix（通用）",  
          Callback = function()  
  loadstring(game:HttpGet('https://raw.githubusercontent.com/3dsonsuce/acrylix/main/Acrylix'))()  
  end  
  })  
     Tab:AddTextbox({  
          Name = "自定义范围",  
          Default = "25",  
          TextDisappear = true,  
          Callback = function(Value)  
                     _G.HeadSize = Value
    _G.Disabled = true 
   game:GetService('RunService').RenderStepped:connect(function()
    if _G.Disabled then
    for i,v in next, game:GetService('Players'):GetPlayers() do
    if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
    pcall(function()
    v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
   v.Character.HumanoidRootPart.Transparency = 0.7 
   v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really red")
    v.Character.HumanoidRootPart.Material = "Neon"
    v.Character.HumanoidRootPart.CanCollide = false
    end)
    end 
   end 
   end
    end)
          end           
  })  
  Tab:AddButton({  
    Name = "全游戏通用范围",  
    Callback = function ()  
      local ScreenGui = Instance.new("ScreenGui")  
  local main = Instance.new("Frame")  
  local label = Instance.new("TextLabel")  
  local Hitbox =   
  Instance.new("TextButton")  
  
  ScreenGui.Parent = game.CoreGui  
  
  main.Name = "main"  
  main.Parent = ScreenGui  
  main.BackgroundColor3 = Color3.fromRGB(255, 0, 0)  
  main.Position = UDim2.new(0.40427351, 0, 0.34591195, 0)  
  main.Size = UDim2.new(0, 100, 0, 100)  
  main.Active = true  
  main.Draggable = true  
  
  label.Name = "label"  
  label.Parent = main  
  label.BackgroundColor3 = Color3.fromRGB(139,0,0)  
  label.Size = UDim2.new(0, 100, 0, 20)  
  label.Font = Enum.Font.SourceSans  
  label.Text = "范围 GUI"  
  label.TextColor3 = Color3.fromRGB(0, 0, 0)  
  label.TextScaled = true  
  label.TextSize = 5.000  
  label.TextWrapped = true  
  
  Hitbox.Name = "Hitbox"  
  Hitbox.Parent = main  
  Hitbox.BackgroundColor3 = Color3.fromRGB(0, 0, 255)  
  Hitbox.Position = UDim2.new(0.114285722, 0, 0.372448981, 0)  
  Hitbox.Size = UDim2.new(0, 90, 0, 40)  
  Hitbox.Font = Enum.Font.SourceSans  
  Hitbox.Text = "开启范围"  
  Hitbox.TextColor3 = Color3.fromRGB(0, 0, 0)  
  Hitbox.TextSize = 40.000  
  Hitbox.MouseButton1Down:connect(function()  
          _G.HeadSize = 20  
  
          _G.Disabled = true  
  
  
  game:GetService('RunService').RenderStepped:connect(function()  
                  if _G.Disabled then  
                          for i,v in next, game:GetService('Players'):GetPlayers() do  
                                  if v.Name ~= game:GetService('Players').LocalPlayer.Name then  
                                          pcall(function()  
                                                  v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)  
                                                  v.Character.HumanoidRootPart.Transparency = 0.7  
                                                  v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really black")  
                                                  v.Character.HumanoidRootPart.Material = "Neon"  
                                                  v.Character.HumanoidRootPart.CanCollide = false  
                                          end)  
                                  end  
                          end  
                  end  
          end)  
  end)  
    end  
  })  
  
  Tab:AddButton({  
          Name = "空范围",  
          Callback = function()  
    loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E9%80%8F%E8%A7%86.lua"))()  
  end  
  })  
  Tab:AddButton({  
    Name = "普通范围",  
    Callback = function ()  
  loadstring(game:HttpGet("https://pastebin.com/raw/jiNwDbCN"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "中等范围",  
    Callback = function ()  
  loadstring(game:HttpGet("https://pastebin.com/raw/x13bwrFb"))()  
    end  
  })  
  Tab:AddButton({  
      Name="全图范围",  
      Callback=function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/KKY9EpZU"))()  
      end  
  })  
  Tab:AddButton({  
      Name="终极范围",  
      Callback=function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/CAQ9x4A7"))()  
      end  
  })  
  local Section = Tab:AddSection({  
  
          Name = "复杂功能"  
  
  })  
   Tab:AddButton({         
 Name = "踏空",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/GhostPlayer352/Test4/main/Float'))()
      end 
 })
 
Tab:AddButton({  
    Name = "游戏通行证(跑酷游戏)",
	Callback = function()
	for _,v in pairs(game:GetDescendants()) do
if v.ClassName == "RemoteEvent" then
if v.Parent.Name == "WeaponsRemotes" or v.Parent.Name == "VipRemotes" or v.Parent.Name == "Remotes" then
v:FireServer()
end
end
end
     end
})
   Tab:AddButton({         
 Name = "玩家加入提示",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/boyscp/scriscriptsc/main/bbn.lua"))()
           
      end 
 })
 
 Tab:AddButton({  
          Name = "墙行走",  
          Callback = function()  
  loadstring(game:HttpGet("https://pastebin.com/raw/zXk4Rq2r"))()  
  end  
  })  
  
  Tab:AddToggle({  
          Name = "夜视",  
          Default = false,  
          Callback = function(Value)  
                  if Value then  
                      game.Lighting.Ambient = Color3.new(1, 1, 1)  
                  else  
                      game.Lighting.Ambient = Color3.new(0, 0, 0)  
                  end  
          end  
  })  
  
  Tab:AddButton({  
          Name = "通用ESP",  
          Callback = function()  
          loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))()  
          end  
  })  
  
  Tab:AddButton({  
          Name = "电脑键盘",  
          Callback = function()  
       loadstring(game:HttpGet("https://raw.githubusercontent.com/advxzivhsjjdhxhsidifvsh/mobkeyboard/main/main.txt", true))()  
            end      
  })  
  
  Tab:AddToggle({  
          Name = "穿墙",  
          Default = false,  
          Callback = function(Value)  
                  if Value then  
                      Noclip = true  
                      Stepped = game.RunService.Stepped:Connect(function()  
                              if Noclip == true then  
                                      for a, b in pairs(game.Workspace:GetChildren()) do  
                          if b.Name == game.Players.LocalPlayer.Name then  
                              for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do  
                                  if v:IsA("BasePart") then  
                                      v.CanCollide = false  
                                  end  
                              end  
                          end  
                      end  
                              else  
                                      Stepped:Disconnect()  
                              end  
                      end)  
              else  
                      Noclip = false  
              end  
          end  
  })  
  
  Tab:AddButton({  
          Name = "甩飞别人",  
          Callback = function()  
       loadstring(game:HttpGet("https://pastebin.com/raw/GnvPVBEi"))()  
            end      
  })  
  
  Tab:AddButton({  
          Name = "转圈fling GUI",  
          Callback = function()  
  loadstring(game:HttpGet('https://pastebin.com/raw/r97d7dS0', true))()  
  end  
  })  
  
  Tab:AddButton({  
    Name = "稳定穿墙",  
    Callback = function()  
      local Workspace = game:GetService("Workspace")  
  local Players = game:GetService("Players")  
  local Clipon = true  
  
  Stepped = game:GetService("RunService").Stepped:Connect(function()  
          if not Clipon == false then  
                  for a, b in pairs(Workspace:GetChildren()) do  
          if b.Name == Players.LocalPlayer.Name then  
          for i, v in pairs(Workspace[Players.LocalPlayer.Name]:GetChildren()) do  
          if v:IsA("BasePart") then  
          v.CanCollide = false  
          end end end end  
          else  
                  Stepped:Disconnect()  
          end  
  end)  
    end  
  })  
  
  Tab:AddButton({  
      Name="我要紫砂",  
      Callback=function()  
          game.Players.LocalPlayer.Character.Humanoid.Health=0  
  HumanDied = true  
      end  
  })  
  
  Tab:AddButton({  
          Name = "不死但不完全不死（点紫砂去除）",  
          Callback = function()  
  HumanDied = false  
  end  
  })  
  
  Tab:AddButton({  
          Name = "跟踪玩家",  
          Callback = function()  
                loadstring(game:HttpGet("https://pastebin.com/raw/F9PNLcXk"))()  
            end  
  })  
  
  Tab:AddButton({  
          Name = "伪名说话",  
          Callback = function()  
  loadstring(game:HttpGet(('https://pastefy.ga/zCFEwaYq/raw'),true))()  
          end   
  })  
  
  Tab:AddButton({  
          Name = "人物无敌",  
          Callback = function()  
       loadstring(game:HttpGet('https://pastebin.com/raw/H3RLCWWZ'))()  
          end      
  })  
  
  Tab:AddButton({  
          Name = "无敌",  
          Callback = function()  
  local lp = game:GetService "Players".LocalPlayer  
  if lp.Character:FindFirstChild "Head" then  
      local char = lp.Character  
      char.Archivable = true  
      local new = char:Clone()  
      new.Parent = workspace  
      lp.Character = new  
      wait(2)  
      local oldhum = char:FindFirstChildWhichIsA "Humanoid"  
      local newhum = oldhum:Clone()  
      newhum.Parent = char  
      newhum.RequiresNeck = false  
      oldhum.Parent = nil  
      wait(2)  
      lp.Character = char  
      new:Destroy()  
      wait(1)  
      newhum:GetPropertyChangedSignal("Health"):Connect(  
          function()  
              if newhum.Health <= 0 then  
                  oldhum.Parent = lp.Character  
                  wait(1)  
                  oldhum:Destroy()  
              end  
          end)  
      workspace.CurrentCamera.CameraSubject = char  
      if char:FindFirstChild "Animate" then  
          char.Animate.Disabled = true  
          wait(.1)  
          char.Animate.Disabled = false  
      end  
      lp.Character:FindFirstChild "Head":Destroy()  
  end  
  end  
  })  
  
  Tab:AddButton({  
          Name = "点击传送工具",  
          Callback = function()  
  mouse = game.Players.LocalPlayer:GetMouse() tool = Instance.new("Tool") tool.RequiresHandle = false tool.Name = "小凌NB" tool.Activated:connect(function() local pos = mouse.Hit+Vector3.new(0,2.5,0) pos = CFrame.new(pos.X,pos.Y,pos.Z) game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos end) tool.Parent = game.Players.LocalPlayer.Backpack  
          end  
  })  
  
  Tab:AddButton({  
          Name = "Dex",  
          Callback = function()  
  loadstring(game:HttpGet("https://cdn.wearedevs.net/scripts/Dex%20Explorer.txt"))()  
  end  
  })  
  local Section = Tab:AddSection({  
  
          Name = "自瞄"  
  
  })  
   Tab:AddButton({         
 Name = "情云同款",         
 Callback = function()         
            local fov = 100 local smoothness = 10 local crosshairDistance = 5 local RunService = game:GetService("RunService") local UserInputService = game:GetService("UserInputService") local Players = game:GetService("Players") local Cam = game.Workspace.CurrentCamera local FOVring = Drawing.new("Circle") FOVring.Visible = true FOVring.Thickness = 2 FOVring.Color = Color3.fromRGB(0, 255, 0) FOVring.Filled = false FOVring.Radius = fov FOVring.Position = Cam.ViewportSize / 2 local Player = Players.LocalPlayer local PlayerGui = Player:WaitForChild("PlayerGui") local ScreenGui = Instance.new("ScreenGui") ScreenGui.Name = "FovAdjustGui" ScreenGui.Parent = PlayerGui local Frame = Instance.new("Frame") Frame.Name = "MainFrame" Frame.BackgroundColor3 = Color3.fromRGB(30, 30, 30) Frame.BorderColor3 = Color3.fromRGB(128, 0, 128) Frame.BorderSizePixel = 2 Frame.Position = UDim2.new(0.3, 0, 0.3, 0) Frame.Size = UDim2.new(0.4, 0, 0.4, 0) Frame.Active = true Frame.Draggable = true Frame.Parent = ScreenGui local MinimizeButton = Instance.new("TextButton") MinimizeButton.Name = "MinimizeButton" MinimizeButton.Text = "-" MinimizeButton.TextColor3 = Color3.fromRGB(255, 255, 255) MinimizeButton.BackgroundColor3 = Color3.fromRGB(50, 50, 50) MinimizeButton.Position = UDim2.new(0.9, 0, 0, 0) MinimizeButton.Size = UDim2.new(0.1, 0, 0.1, 0) MinimizeButton.Parent = Frame local isMinimized = false MinimizeButton.MouseButton1Click:Connect(function() isMinimized = not isMinimized if isMinimized then Frame:TweenSize(UDim2.new(0.1, 0, 0.1, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "+" else Frame:TweenSize(UDim2.new(0.4, 0, 0.4, 0), Enum.EasingDirection.Out, Enum.EasingStyle.Quad, 0.3, true) MinimizeButton.Text = "-" end end) local FovLabel = Instance.new("TextLabel") FovLabel.Name = "FovLabel" FovLabel.Text = "自瞄范围" FovLabel.TextColor3 = Color3.fromRGB(255, 255, 255) FovLabel.BackgroundTransparency = 1 FovLabel.Position = UDim2.new(0.1, 0, 0.1, 0) FovLabel.Size = UDim2.new(0.8, 0, 0.2, 0) FovLabel.Parent = Frame local FovSlider = Instance.new("TextBox") FovSlider.Name = "FovSlider" FovSlider.Text = tostring(fov) FovSlider.TextColor3 = Color3.fromRGB(255, 255, 255) FovSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) FovSlider.Position = UDim2.new(0.1, 0, 0.3, 0) FovSlider.Size = UDim2.new(0.8, 0, 0.2, 0) FovSlider.Parent = Frame local SmoothnessLabel = Instance.new("TextLabel") SmoothnessLabel.Name = "SmoothnessLabel" SmoothnessLabel.Text = "自瞄平滑度" SmoothnessLabel.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessLabel.BackgroundTransparency = 1 SmoothnessLabel.Position = UDim2.new(0.1, 0, 0.5, 0) SmoothnessLabel.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessLabel.Parent = Frame local SmoothnessSlider = Instance.new("TextBox") SmoothnessSlider.Name = "SmoothnessSlider" SmoothnessSlider.Text = tostring(smoothness) SmoothnessSlider.TextColor3 = Color3.fromRGB(255, 255, 255) SmoothnessSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) SmoothnessSlider.Position = UDim2.new(0.1, 0, 0.7, 0) SmoothnessSlider.Size = UDim2.new(0.8, 0, 0.2, 0) SmoothnessSlider.Parent = Frame local CrosshairDistanceLabel = Instance.new("TextLabel") CrosshairDistanceLabel.Name = "CrosshairDistanceLabel" CrosshairDistanceLabel.Text = "自瞄预判距离" CrosshairDistanceLabel.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceLabel.BackgroundTransparency = 1 CrosshairDistanceLabel.Position = UDim2.new(0.1, 0, 0.9, 0) CrosshairDistanceLabel.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceLabel.Parent = Frame local CrosshairDistanceSlider = Instance.new("TextBox") CrosshairDistanceSlider.Name = "CrosshairDistanceSlider" CrosshairDistanceSlider.Text = tostring(crosshairDistance) CrosshairDistanceSlider.TextColor3 = Color3.fromRGB(255, 255, 255) CrosshairDistanceSlider.BackgroundColor3 = Color3.fromRGB(50, 50, 50) CrosshairDistanceSlider.Position = UDim2.new(0.1, 0, 1.1, 0) CrosshairDistanceSlider.Size = UDim2.new(0.8, 0, 0.2, 0) CrosshairDistanceSlider.Parent = Frame local targetCFrame = Cam.CFrame local function updateDrawings() local camViewportSize = Cam.ViewportSize FOVring.Position = camViewportSize / 2 FOVring.Radius = fov end local function onKeyDown(input) if input.KeyCode == Enum.KeyCode.Delete then RunService:UnbindFromRenderStep("FOVUpdate") FOVring:Remove() end end UserInputService.InputBegan:Connect(onKeyDown) local function getClosestPlayerInFOV(trg_part) local nearest = nil local last = math.huge local playerMousePos = Cam.ViewportSize / 2 for _, player in ipairs(Players:GetPlayers()) do if player ~= Players.LocalPlayer then local part = player.Character and player.Character:FindFirstChild(trg_part) if part then local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude if distance < last and isVisible and distance < fov then last = distance nearest = player end end end end return nearest end RunService.RenderStepped:Connect(function() updateDrawings() local closest = getClosestPlayerInFOV("Head") if closest and closest.Character:FindFirstChild("Head") then local targetCharacter = closest.Character local targetHead = targetCharacter.Head local targetRootPart = targetCharacter:FindFirstChild("HumanoidRootPart") local isMoving = targetRootPart.Velocity.Magnitude > 0.1 local targetPosition if isMoving then targetPosition = targetHead.Position + (targetHead.CFrame.LookVector * crosshairDistance) else targetPosition = targetHead.Position end targetCFrame = CFrame.new(Cam.CFrame.Position, targetPosition) else targetCFrame = Cam.CFrame end Cam.CFrame = Cam.CFrame:Lerp(targetCFrame, 1 / smoothness) end) FovSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newFov = tonumber(FovSlider.Text) if newFov then fov = newFov else FovSlider.Text = tostring(fov) end end end) SmoothnessSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newSmoothness = tonumber(SmoothnessSlider.Text) if newSmoothness then smoothness = newSmoothness else SmoothnessSlider.Text = tostring(smoothness) end end end) CrosshairDistanceSlider.FocusLost:Connect(function(enterPressed, inputThatCausedFocusLoss) if enterPressed then local newCrosshairDistance = tonumber(CrosshairDistanceSlider.Text) if newCrosshairDistance then crosshairDistance = newCrosshairDistance else CrosshairDistanceSlider.Text = tostring(crosshairDistance) end end end)
           
      end 
 })
  Tab:AddButton({         
 Name = "林自瞄",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/odhdshhe/bu/refs/heads/main/%E6%9C%88%E4%BA%AE%E5%8A%A0%E5%AF%86%E8%BF%87%E7%9A%84%E6%9E%97%E7%9A%84%E8%87%AA%E7%9E%84.lua"))()
           
      end 
 })
 
 local Tab= Window:MakeTab({ 
         Name = "速度传奇", 
         Icon = "rbxassetid://7733956134", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "The Lgondbs-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://pastebin.com/raw/mqGPg69N"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Legends-Of-hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/SkoterScripts/Legends-Of-Speed-Script/main/Script%20For%20Legends%20Of%20Speed.txt"))()  
      end 
 }) 
 Tab:AddButton({         
 Name = "Data-Ez-Hub",         
 Callback = function()         
           loadstring(game:HttpGet(('https://raw.githubusercontent.com/debug42O/Ez-Industries-Launcher-Data/master/Launcher.lua'),true))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "NewIce-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMae17/NewIceHub/main/Brookhaven"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Tbao-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/tbao143/thaibao/main/TbaoHublegendsofspeed"))()  
      end 
 }) 
 Tab:AddButton({         
 Name = "NewIce-电脑可用",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/IceMae17/NewIceHub/main/Brookhaven"))() 
      end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "忍者传奇", 
         Icon = "rbxassetid://7733798901", 
         PremiumOnly = false 
 }) 
 local Section = Tab:AddSection({  
  
          Name = "以下不是内置"  
  
  })  
 Tab:AddButton({         
 Name = "自动收集 气、钱、宝石有bug",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/TtmScripter/-/main/AutoGetIDK(NinjaLegend)"))() 
      end 
 }) 
 Tab:AddButton({  
         Name = "RoLLu-Hub超强", 
         Callback = function() 
       loadstring(game:HttpGet("https://raw.githubusercontent.com/XRoLLu/Rolly_Hub/main/open-source-trash-loader.exe.yeah"))() 
           end 
 }) 
  
 Tab:AddButton({ 
         Name = "AliCodeV4", 
         Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/AliCode14/scripts/main/ScriptHub.lua"))() 
           end 
 }) 
 Tab:AddButton({         
 Name = "ALLHACK-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/NukeVsCity/TheALLHACKLoader/main/NukeLoader"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Proxima-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/TrixAde/Proxima-Hub/main/Main.lua"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Space-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/spacvehubloader"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "ExtremeAntonis-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/ExtremeAntonis/loader/main/loader.lua"))() 
      end 
 }) 
 local Section = Tab:AddSection({  
  
          Name = "内置脚本[自动系列]"  
  
  })  
  
  
 Tab:AddToggle( 
     { 
         Name = "自动挥舞", 
         Default = false, 
         Callback = function(x) 
             autoswing = x 
             if autoswing then 
                 swinging() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "自动售卖", 
         Default = false, 
         Callback = function(x) 
             autosell = x 
             if autosell then 
                 selling() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "存满了自动售卖", 
         Default = false, 
         Callback = function(x) 
             autosellmax = x 
             if autosellmax then 
                 maxsell() 
             end 
         end 
     } 
 ) 
  
 local Section = Tab:AddSection({ 
         Name = "自动购买功能" 
 }) 
  
 Tab:AddToggle( 
     { 
         Name = "自动购买剑", 
         Default = false, 
         Callback = function(x) 
             autobuyswords = x 
             if autobuyswords then 
                 buyswords() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "自动购买腰带", 
         Default = false, 
         Callback = function(x) 
             autobuybelts = x 
             if autobuybelts then 
                 buybelts() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "自动购买称号（等级）", 
         Default = false, 
         Callback = function(x) 
             autobuyranks = x 
             if autobuyranks then 
                 buyranks() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "自动购买忍术", 
         Default = false, 
         Callback = function(x) 
             autobuyskill = x 
             if autobuyskill then 
                 buyskill() 
             end 
         end 
     } 
 ) 
  
 Tab:AddToggle( 
     { 
         Name = "自动购买（全部打开）", 
         Default = false, 
         Callback = function(x) 
             autobuyshurikens = x 
             if autobuyshurikens then 
                 buyshurikens() 
             end 
         end 
     } 
 ) 
  
 Tab:AddButton( 
     { 
         Name = "解锁所有岛", 
         Callback = function() 
             for _, v in next, game.workspace.islandUnlockParts:GetChildren() do 
                 if v then 
                     game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = v.islandSignPart.CFrame 
                     wait(.5) 
                 end 
             end 
         end 
     } 
 ) 
 local Section = Tab:AddSection({  
  
          Name = "内置脚本[/TP 各种岛屿]"  
  
  })  
 Tab:AddButton ({ 
         Name = "附魔岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(83.028564453125, 766.3915405273438, -128.62686157226562) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "星界岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(144.43006896972656, 2014.091064453125, 247.5571746826172) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "神秘岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(162.7420654296875, 4047.7841796875, 13.378257751464844) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "太空岛", 
         Callback = function () 
         game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.0364227294922, 5657.091796875, 161.54000854492188) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "冻土岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.7508544921875, 9285.08984375, 158.16287231445312) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "沙暴", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.7511749267578, 17686.236328125, 147.5008087158203) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "雷暴", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(186.87640380859375, 24069.9296875, 158.25582885742188) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "远古炼狱岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166.48052978515625, 28256.201171875, 160.25828552246094) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "午夜暗影岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182.76388549804688, 33206.88671875, 136.66305541992188) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "神秘灵魂岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(157.39967346191406, 39317.4765625, 146.05630493164062) 
         end 
  
 }) 
         Tab:AddButton ({ 
         Name = "冬季奇迹岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(168.73797607421875, 46010.4609375, 158.589599609375) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "黄金大师岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(184.56202697753906, 52607.671875, 166.47279357910156) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "龙传奇岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(166.83065795898438, 59594.58984375, 150.16586303710938) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "赛博传奇岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(167.66766357421875, 66669.0703125, 142.27223205566406) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "天岚超能岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(182.09237670898438, 70271.0625, 157.14857482910156) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "混沌传奇岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(177.88784790039062, 74442.7578125, 143.346435546875) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "灵魂融合岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(183.39129638671875, 79746.890625, 163.01148986816406) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "黑暗元素岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(169.4972381591797, 83198.890625, 170.53890991210938) 
         end 
 }) 
         Tab:AddButton ({ 
         Name = "禅心岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(173.4744873046875, 87050.9765625, 141.89602661132812) 
         end 
 }) 
 Tab:AddButton ({ 
         Name = "炽热漩涡之岛", 
         Callback = function () 
          game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(178.33023071289062, 91245.96875, 152.53775024414062) 
         end 
 }) 
  
   local Tab= Window:MakeTab({  
          Name = "刀刃球",  
          Icon = "rbxassetid://7733675107",  
          PremiumOnly = false  
  })  
 local Section = Tab:AddSection({  
  
          Name = "以下脚本目前可用"  
  
  })  
  Tab:AddButton({  
    Name = "BDOLL-HUB",  
    Callback = function ()  
      _G.UI_Size = 200 -- config ui size  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/-beta-/main/AutoParry.lua"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "红圈格挡V3",  
    Callback = function ()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/RedCircleBlock"))()  
    end  
  })  
 Tab:AddButton({         
 Name = "ScouT-Hub",         
 Callback = function()         
           loadstring(game:HttpGet(("https://raw.githubusercontent.com/Kozukiremboukk/Aqui-mesml/main/blades")))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Pitbull-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/SoyAdriYT/PitbullHub/main/Scripting", true))()  
      end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "死亡球", 
         Icon = "rbxassetid://7733779668", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "Op脚本_已绕过反作弊",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/sirapobsriumang/Death-Bal/main/Op-Script-by-me"))()  
      end 
 }) 
 Tab:AddButton({         
 Name = "LOLking-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Death/main/Ball"))() 
      end 
 }) 
 Tab:AddButton({ 
  
         Name = "LOLking-hub卡密如果没用就删了感叹号", 
  
         Callback = function() 
  
      setclipboard("RobloxNewBestBall!!") 
  
           end 
  
 }) 
  
 local Tab= Window:MakeTab({ 
         Name = "枪球", 
         Icon = "rbxassetid://7734068495", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "自动打击",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Secure/Gun-Ball/main/.lua"))() 
      end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "压力", 
         Icon = "rbxassetid://7733674820", 
         PremiumOnly = false 
 }) 
  
  Tab:AddButton({          
  Name = "GOA-HUB",          
  Callback = function()          
  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/Nevcit/Pressure/main/GOA_HUB"))()  
       end  
  })  
  Tab:AddButton({          
  Name = "Persona_Hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/LordEyes2/Script/main/PersonalHub"))()  
  
       end  
  })  
  Tab:AddButton({          
  Name = "DocYongurt",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/DocYogurt/Main/main/Scripts/Pressure"))()  
       end  
  }) 
 Tab:AddButton({         
 Name = "CryeepyEye-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://github.com/Drop56796/CreepyEyeHub/blob/main/obfuscate.lua?raw=true"))() 
      end 
 }) 
 Tab:AddButton({         
     Name = "BDOLL-Hub_优质By:c-a-t-s-u-s",         
     Callback = function()         
  loadstring(game:HttpGet("https://raw.githubusercontent.com/3345-c-a-t-s-u-s/New-C4-Remote.lua/main/pressure_kuy.lua"))() 
    end 
 }) 
  
 Tab:AddButton({         
     Name = "Pressure???",         
     Callback = function()         
 loadstring(game:HttpGet(('https://raw.githubusercontent.com/zuohongjian/bjb/main/Pressure')))() 
    end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "Doors", 
         Icon = "rbxassetid://7734022041", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({  
          Name = "Ohio doors",  
          Callback = function()  
   loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))()  
      end  
  })  
  
 Tab:AddButton({  
    Name = "MSDOORS",  
    Callback = function ()  
      loadstring(game:HttpGet(("https://raw.githubusercontent.com/mstudio45/MSDOORS/main/MSHUB_Loader.lua"),true))()  
  
    end  
  })  
 Tab:AddButton({         
 Name = "KeoneGit-hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/KeoneGithub/KeoneGithub/main/Doors",true))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Utilities-Hub",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/plamen6789/UtilitiesHub/main/UtilitiesGUI'))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Folder-Hub",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/VaniaPerets/FolderGui-FolderHub/main/loader.lua", true))() 
      end 
 }) 
 Tab:AddButton({  
    Name = "微山doors1.0.4(可用)要白名单",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/weishanteam/Script/main/doors/WeiShan_Loader.lua"))()  
    end  
  })  
 Tab:AddButton({  
    Name = "DOORS 后门 ",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/notpoiu/Scripts/main/mspaint/backdoor.lua"))()  
    end  
  })   
 Tab:AddButton({  
    Name = "doors中转站卡密：114514xhxh",  
    Callback = function ()  
      loadstring(game:HttpGet("https://shz.al/ySeKWSdaes8TiJbZTc2XzDiS"))()  
  
    end  
  })  
  Tab:AddButton({  
    Name = "小云doors",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/EntitySpawner/main/doors(orionlib).lua"))()  
    end  
  })  
 Tab:AddButton({  
    Name = "doors最强脚本汉化",  
    Callback = function ()  
      loadstring(game:HttpGet("\104\116\116\112\115\58\47\47\112\97\115\116\101\98\105\110\46\99\111\109\47\114\97\119\47\54\53\84\119\84\56\106\97"))()  
  
    end  
  }) 
 Tab:AddButton({         
 Name = "doors最强无汉化",         
 Callback = function()         
               loadstring(game:HttpGet('https://pastebin.com/raw/R8QMbhzv'))() 
      end 
 })   
 Tab:AddButton({  
          Name = "十字架",  
          Callback = function()  
  
  loadstring(game:HttpGet('https://pastebin.com/raw/ibbWwU6q'))()  
            end  
  })  
  Tab:AddButton({  
          Name = "能量罐",  
          Callback = function()    
    loadstring(game:HttpGet("https://raw.githubusercontent.com/cbhlyy/lyycbh/main/nengliangtiao"))()  
      end  
  })     
  
  Tab:AddButton({  
          Name = "紫色手电筒（在电梯购买东西的时候使用）",  
          Callback = function()  
  
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Purple%20Flashlight"))()  
      end  
  })    
 Tab:AddButton({  
          Name = "吸铁石",  
          Callback = function()  
       loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/MagnetByNerd.lua"))()  
      end  
  })  
  Tab:AddButton({  
          Name = "剪刀",  
          Callback = function()  
  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/MrNeRD0/Doors-Hack/main/shears_done.lua"))()  
      end  
  })      
  Tab:AddButton({  
          Name = "激光枪",  
          Callback = function()  
    loadstring(game:HttpGet("https://raw.githubusercontent.com/K0t1n/Public/main/Laser%20Gun"))()  
      end  
  })  
  Tab:AddButton({  
          Name = "夜视仪",  
          Callback = function()  
  
    _G.OnShop = trueloadstring(game:HttpGet('https://raw.githubusercontent.com/DeividComSono/Scripts/main/Scanner.lua'))()  
      end  
  })      
 local Tab= Window:MakeTab({ 
         Name = "伐木大亨2", 
         Icon = "rbxassetid://7733799901", 
         PremiumOnly = false 
 }) 
  
 Tab:AddButton({         
 Name = "最强Lua_WareLoader",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/frencaliber/LuaWareLoader.lw/main/luawareloader.wtf",true))() 
      end 
 }) 
 Tab:AddButton({  
        Name = "小云bark2.0",  
        Callback = function()  
        loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/bark2.0.lua"))()  
        end  
  })  
  
 Tab:AddButton({         
     Name = "无汉化-Burrer-Hub",         
     Callback = function()         
 loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))() 
    end 
 }) 
  
 Tab:AddButton({         
     Name = "汉化Butter-hub",         
     Callback = function()         
 loadstring(game:HttpGet('https://raw.githubusercontent.com/Butterisgood/butter-hub/main/Butterhub.txt'))() 
    end 
 }) 
  
 Tab:AddButton({         
     Name = "白-伐木脚本",         
     Callback = function()         
 loadstring(game:HttpGet("https://raw.githubusercontent.com/CloudX-ScriptsWane/ScriptsDache/main/%E4%BC%90%E6%9C%A8%E5%A4%A7%E4%BA%A822.lua", true))() 
    end 
 }) 
 Tab:AddButton({         
 Name = "idk😱",         
 Callback = function()         
           loadstring(game:HttpGet"https://raw.githubusercontent.com/darkxwin/darkxsourcethinkyoutousedarkx/main/darkx")() 
      end 
 }) 
  
 Tab:AddButton({         
 Name = "NOOBARMY-hub",         
 Callback = function()         
           loadstring(game:HttpGet(("https://raw.githubusercontent.com/NOOBARMYSCRIPTER/NOOBARMYSCRIPTER/main/AXE%20LOOP%20SCRIPT"), true))() 
      end 
 }) 
 local Tab= Window:MakeTab({  
          Name = "The Rake",  
          Icon = "rbxassetid://7733779610",  
          PremiumOnly = false  
  })  
  Tab:AddButton({          
  Name = "Zeerox-Hub",          
  Callback = function()                loadstring(game:HttpGet'https://raw.githubusercontent.com/RunDTM/ZeeroxHub/main/Loader.lua')()  
       end  
  })  
  Tab:AddButton({          
  Name = "CE-hub",          
  Callback = function()          
            loadstring(game:HttpGet('https://raw.githubusercontent.com/scriptemt/CE-Technologies/main/script', true))()  
       end  
  })  
  Tab:AddButton({  
    Name = "The Rake小云☁",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/The%20Rake.lua"))()  
    end  
  })  
  Tab:AddButton({          
  Name = "Tiger_Admin",          
  Callback = function()          
            loadstring(game:HttpGet('https://raw.githubusercontent.com/H17S32/Tiger_Admin/main/MAIN'))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Sussy-Tech",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Sussy-Tech/Scripts/main/RakeScript.lua"))()  
       end  
  })  
  Tab:AddButton({          
  Name = "REMASTERED",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/CHEATERFUN/The-Rake-REMASTERED-Script/main/Source.lua"))()  
       end  
  })  
  Tab:AddButton({          
  Name = "filesV3",          
  Callback = function()          
  
  loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/c2c886534e662c614423ee5748353fe4.lua"))()  
  
       end  
  })  
  Tab:AddButton({          
  Name = "Devva...",          
  Callback = function()          
            loadstring(game:HttpGet("https://gist.githubusercontent.com/OtarDevv/49186047e758b9b263ec5a6583a99b4b/raw/d98e767de166fa6361066e9d43ec13ab05fdad89/Rake"))();  
       end  
  }) 
      local Tab = Window:MakeTab({  
          Name = "CW(战斗勇士)",  
          Icon = "rbxassetid://7733779610",  
          PremiumOnly = false  
  })  
 Tab:AddButton({  
          Name = "无名",  
          Callback = function()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))()  
          end  
  })  
  Tab:AddButton({  
    Name = "Warriors-Hub",  
    Callback = function ()  
     loadstring(game:HttpGet("https://raw.githubusercontent.com/leakediz/top-g/main/combat%20warriors"))()   
    end  
  })  
  
  Tab:AddButton({  
    Name = "电脑端Combat-Hub",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/frkfx/Combat-Warriors/main/Script"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "无限体力和跳跃+",  
    Callback = function ()  
      for i,v in pairs(getgc(true)) do  
     if typeof(v) == "table" and rawget(v, "getIsMaxed") then  
         v.getIsMaxed = function()  
             return false  
         end  
         v.getFlags = function()  
             return 1  
         end  
         v.addFlags = function(a,b)  
             a:setFlags(0)  
             return  
         end  
     end  
     -- "There was another script here but it caused the user to crash (lag out), so it had to be removed" -KiwisASkid --  
     if typeof(v) == "table" and rawget(v, "spawnCharacter") then  
         local oldfunc = v.spawnCharacter  
         v.SpawnCharacter = function(a)  
             for _,f in pairs(getgc(true)) do  
                 if typeof(f) == "table" and rawget(f, "getIsMaxed") then  
                     f.getIsMaxed = function()  
                         return false  
                     end  
                     f.getFlags = function()  
                         return 1  
                     end  
                     f.addFlags = function(aa,b)  
                         aa:setFlags(0)  
                         return  
                     end  
                 end  
             end  
         end  
     end  
     if typeof(v) == "table" and rawget(v, "getCanJump") then  
         v.getCanJump = function()  
             return true  
         end  
     end  
     if typeof(v) == "table" and rawget(v, "JUMP_DELAY_ADD") then  
         v.JUMP_DELAY_ADD = 0.5  
     end  
     if typeof(v) == "table" and rawget(v, "_setStamina") then  
         v._setStamina = function(a, b)  
             a._stamina = math.huge  
             a._staminaChangedSignal:Fire(99)  
         end  
     end  
  end  
  game.StarterGui:SetCore("SendNotification", {Title = "开启成功", Text = "Script loaded, "..game.Players.LocalPlayer.DisplayName..".", Duration = 4,})  
    end  
  })  
  Tab:AddButton({  
    Name = "Zab-HUB",  
    Callback = function ()  
      loadstring(game:HttpGet('https://itots.tk/zaphub/ZapHubFreeVersion'))()  
    end  
  })  
  Tab:AddButton({  
    Name = "Vcsk-HUB",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/Vcsk/AstralHub/main/Main.lua", true))()  
    end  
  })  
  Tab:AddButton({  
    Name = "自动盾反菜",  
    Callback = function ()  
      local lp = game.Players.LocalPlayer  
  
  local animationInfo = {}  
  
  function getInfo(id)  
    local success, info = pcall(function()  
        return game:GetService("MarketplaceService"):GetProductInfo(id)  
    end)  
    if success then  
        return info  
    end  
    return {Name=''}  
  end  
  function block(player)  
    keypress(0x46)  
    wait()  
    keyrelease(0x46)  
  end  
  
  local AnimNames = {  
    'Slash',  
    'Swing',  
    'Sword'  
  }  
  
  function playerAdded(v)  
      local function charadded(char)  
        local humanoid = char:WaitForChild("Humanoid", 5)  
        if humanoid then  
            humanoid.AnimationPlayed:Connect(function(track)  
                local info = animationInfo[track.Animation.AnimationId]  
                if not info then  
                    info = getInfo(tonumber(track.Animation.AnimationId:match("%d+")))  
                    animationInfo[track.Animation.AnimationId] = info  
                end  
  
                if (lp.Character and lp.Character:FindFirstChild("Head") and v.Character:FindFirstChild("Head")) then  
                    local mag = (v.Character.Head.Position - lp.Character.Head.Position).Magnitude  
                    if mag < 15  then  
  
                        for _, animName in pairs(AnimNames) do  
                            if info.Name:match(animName) then  
                                pcall(block, v)  
                            end  
                        end  
  
                    end  
                end  
            end)  
        end  
    end  
  
    if v.Character then  
        charadded(v.Character)  
    end  
    v.CharacterAdded:Connect(charadded)  
  end  
  
  for i,v in pairs(game.Players:GetPlayers()) do  
     if v ~= lp then  
         playerAdded(v)  
     end  
  end  
  
  game.Players.PlayerAdded:Connect(playerAdded)  
    end  
  })  
  Tab:AddButton({  
    Name = "KEYYSYSYSTEM-Hub",  
    Callback = function ()  
  loadstring(game:HttpGet(('https://raw.githubusercontent.com/funhaji/FunHubScriptLoader/main/RBL/KEYSYSTEM'),true))()  
    end  
  })  
  Tab:AddButton({  
    Name = "无敌",  
    Callback = function ()  
      local HRP = game.Players.LocalPlayer.Character.HumanoidRootPart  
  local spawnbox = workspace.SpawnBox  
  
  HRP.CFrame = spawnbox.SpawnPart.CFrame  
    end  
  })  
  Tab:AddButton({  
    Name = "Tickware-Hub",  
    Callback = function ()  
     loadstring(game:HttpGet("https://raw.githubusercontent.com/tickwares/tickware/main/Tickware"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "SWeatDestrigon-HUB",  
    Callback = function ()  
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Tropxzz/SweatDestroyer/main/MainOperator.lua", true))()   
    end  
  })  
  Tab:AddButton({  
    Name = "Tickware-Hub",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/tickwares/tickware/main/Tickware"))()  
    end  
  })  
  
  Tab:AddButton({  
    Name = "lsaaaKK-Hub",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/IsaaaKK/cwhb/main/cw.txt"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "打死光环",  
    Callback = function ()  
     loadstring(game:HttpGet("https://projecthook.xyz/scripts/free.lua"))()   
    end  
  })  
  Tab:AddButton({  
    Name = "Nova-Hub",  
    Callback = function ()  
      loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/novahub"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "NOVA-Hub_Source2.0",  
    Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NOVA_HUB_SOURCE"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "Wen-NOVA1.15",  
    Callback = function ()  
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SussyImposterRed/Scripts/main/NEW_NOVA"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "Top-G_Hub",  
    Callback = function ()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/leakediz/top-g/main/combat%20warriors"))()  
    end  
  })  
  Tab:AddButton({  
    Name = "1foyt-HUB",  
    Callback = function ()  
  loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/master/novahub"))()  
    end  
  })  
  local Tab= Window:MakeTab({  
          Name = "BF",  
          Icon = "rbxassetid://7733779610",  
          PremiumOnly = false  
  })  
  
  Tab:AddButton({          
  Name = "Matssune-Hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Yatsuraa/Matsune/main/matssunehub.lua"))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Spec-X",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/xZPUHigh/Project-Spectrum/main/SpectrumX.lua"))()   
       end  
  })  
  Tab:AddButton({          
  Name = "FREE-hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/FreeeScripts/FREEHub/main/Loader", true))()  
       end  
  })  
  Tab:AddButton({          
  Name = "BLCK-Ez",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/1f0yt/community/main/BLCK"))()  
       end  
  })  
  Tab:AddButton({          
  Name = "Valk_Hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Scriptssz/Folder_Script/main/Valk_Hub"))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Mingane-Hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/Basicallyybeta/mingane/main/MinGamingNew.lua"))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Vector-Hub",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/AAwful/VectorHub/main/Loader.lua"))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Hajibeza???",          
  Callback = function()          
            loadstring(game:HttpGet('https://raw.githubusercontent.com/hajibeza/Module/main/Mobile_Script.lua'))()   
       end  
  })  
  Tab:AddButton({          
  Name = "Speed-Hub-X",          
  Callback = function()          
            loadstring(game:HttpGet("https://raw.githubusercontent.com/ahmadsgamer2/Speed-Hub-X/main/SpeedHubX"))()   
       end  
  })  
 local Tab= Window:MakeTab({ 
         Name = "吃掉世界", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "Rid20.Mk",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Kenniel123/Eat-the-World-script/main/Eat%20the%20world%20Script"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Main MenuV1.2",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/R1nn1/MainMenu1/main/MainMenuV1.2"))()  
      end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "彩虹盆友", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "主要的/Ture2",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/OfficialOasisScript/OasisGameScripts/main/MainScripts/RainbowFriends.lua', true))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "Ez hub",         
 Callback = function()         
   loadstring(game:HttpGet("https://pastebin.com/raw/0fRs279k"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "CH-HUB",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/RobloxHackingProject/CHHub/main/CHHub.lua"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "ZREALKING",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/zReal-King/Rainbow-Friends/main/Main.lua'))() 
  
      end 
 }) 
 Tab:AddButton({         
 Name = "Block-hub",         
 Callback = function()         
           loadstring(game:HttpGet('https://raw.githubusercontent.com/Ihaveash0rtnamefordiscord/BorkWare/main/Scripts/' .. game.GameId .. ".lua"))(' Watermelon ? ') 
      end 
 }) 
 Tab:AddButton({         
 Name = "Launcher.Exe",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Launcher-Exe/Launcher-Exe/main/rainbow.lua"))();   
  
      end 
 })
 local Tab= Window:MakeTab({ 
         Name = "鱼(Fish)", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
   local Section = Tab:AddSection({  
  
          Name = "自动摇摆1 2不能一起用"  
  
  })  
  Tab:AddButton({         
 Name = "自动摇摆 1",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitler69/InfiniteWare/refs/heads/main/Launcher",true))()
      end 
 }) 
 Tab:AddToggle({  
          Name = "自动摇摆 2",  
          Default = false,  
          Callback = function()  
          loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitler69/InfiniteWare/refs/heads/main/Launcher",true))()
          end  
  })  
  
   local Section = Tab:AddSection({  
  
          Name = "下面是脚本中心"  
  
  })  
   Tab:AddButton({         
 Name = "Speed_HUB",         
 Callback = function()         
           
loadstring(game:HttpGet("https://raw.githubusercontent.com/AhmadV99/Speed-Hub-X/main/Speed%20Hub%20X.lua", true))()
           
      end 
 })
  Tab:AddButton({         
 Name = "noname_HUB",         
 Callback = function()         
           loadstring(game:HttpGet("https://noname-hub.fun/loader.lua"))()
           
      end 
 })
   Tab:AddButton({         
 Name = "Nidev_HUB",         
 Callback = function()         
           
           loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/main/refs/heads/main/Loader.lua"))()
      end 
 })
 
  local Tab= Window:MakeTab({ 
         Name = "元素力量大亨", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  Tab:AddButton({         
 Name = "Elmental.HUB",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraScript/Script/main/Elemental"))()
           
      end 
 })
  local Tab= Window:MakeTab({ 
         Name = "战壕", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  Tab:AddButton({         
 Name = "头范围",         
 Callback = function()         
                      loadstring(game:HttpGet("https://raw.githubusercontent.com/Kitler69/InfiniteWare/refs/heads/main/Launcher",true))()
           
      end 
 })
  local Tab= Window:MakeTab({ 
         Name = "武器太多了", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  Tab:AddButton({         
 Name = "汉化版",         
 Callback = function()         
           print("执行脚本")
        loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Orion-Library.UI/refs/heads/main/%E5%B0%8F%E5%87%8C%E4%B8%AD%E5%BF%83%E7%9A%84%F0%9F%98%B0%F0%9F%A4%94%F0%9F%A4%A3%F0%9F%91%8D%F0%9F%A4%93%F0%9F%98%8E%F0%9F%98%92%F0%9F%A4%AE%F0%9F%98%82%F0%9F%98%A1%F0%9F%98%A8%F0%9F%98%AD%F0%9F%A5%B0%F0%9F%99%82%F0%9F%92%80%F0%9F%98%93%F0%9F%92%94%F0%9F%A5%B5%F0%9F%A7%90Orion%20Library.Lua"))()
           
      end 
 })
 
  local Tab= Window:MakeTab({ 
         Name = "单词炸弹", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  Tab:AddButton({         
 Name = "自动填单词",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/wordbomb/refs/heads/main/feinfeinfeinfeinfeinfien", true))()
           
      end 
 })
  local Tab= Window:MakeTab({ 
         Name = "slap battles", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
   local Section = Tab:AddSection({  
  
          Name = "可以自己搭配脚本"  
  
  })  
 Tab:AddButton({         
 Name = "Royele-HUB",         
 Callback = function()         
           loadstring(game:HttpGet("https://raw.githubusercontent.com/cheesynob39/Roblox-Scripts/main/Slap_Royale.lua"))()
      end 
 })
  Tab:AddToggle({  
          Name = "范围",  
          Default = false,  
          Callback = function(state)  
          _G.HeadSize = 20_G.Disabled = truegame:GetService('RunService').RenderStepped:connect(function()if _G.Disabled thenfor i,v in next, game:GetService('Players'):GetPlayers() doif v.Name ~= game:GetService('Players').LocalPlayer.Name thenpcall(function()v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize)v.Character.HumanoidRootPart.Transparency = 0.7v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really white")v.Character.HumanoidRootPart.Material = "Neon"v.Character.HumanoidRootPart.CanCollide = falseend)endendendend)
          end  
  })  
local Tab= Window:MakeTab({ 
         Name = "后悔电梯", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "秒完成关卡",         
 Callback = function()   
local args = "EZLOL"    
game:GetService("ReplicatedStorage").RE.HDAdminBackdoor:FireServer(args) ​
      end 
 }) 
  Tab:AddButton({         
 Name = "无限血量[多点几次]",         
 Callback = function()         
local args ={
  [1] = "pvp"
}
      end 
 }) 
  Tab:AddButton({         
 Name = "管理员闪电[菜单]",         
 Callback = function()         
local args = "kill"
      end 
 }) 
 Tab:AddButton({         
 Name = "Justaveg-Hub",         
 Callback = function()         
  
 loadstring(game:HttpGet(("https://raw.githubusercontent.com/Justaverageguym/Hub/main/Scripts/Regretevator.lua")))() 
      end 
 }) 
  local Tab= Window:MakeTab({ 
         Name = "竞争对手", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({         
 Name = "Jonny-Hub",         
 Callback = function()         
  
 loadstring(game:HttpGet("https://raw.githubusercontent.com/JonnyCheeser/jonnycheesehub/main/jonnycheeser"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "SilentR-Hub",         
 Callback = function()         
  
 loadstring(game:HttpGet("https://raw.githubusercontent.com/KxGOATESQUE/SilentRivals/main/SilentRivals"))() 
      end 
 }) 
 Tab:AddButton({         
 Name = "速度、跳跃",         
 Callback = function()         
  
 local Players = game:GetService("Players") 
 local rs = game:GetService("RunService") 
 local lp = Players.LocalPlayer 
  
 local settings = { 
     WalkSpeed = { 
         default = 16, 
         boosted = 100,  
     }, 
     JumpPower = { 
         default = 50, 
         boosted = 100, 
     } 
 } 
  
 function apply(humanoid, walkSpeed, jumpPower) 
     humanoid.WalkSpeed = walkSpeed 
     humanoid.JumpPower = jumpPower 
 end 
  
 function add(character) 
     local humanoid = character:WaitForChild("Humanoid") 
     apply(humanoid, settings.WalkSpeed.boosted, settings.JumpPower.boosted) 
  
     humanoid:GetPropertyChangedSignal("WalkSpeed"):Connect(function() 
         if humanoid.WalkSpeed ~= settings.WalkSpeed.boosted then 
             humanoid.WalkSpeed = settings.WalkSpeed.boosted 
         end 
     end) 
  
     humanoid:GetPropertyChangedSignal("JumpPower"):Connect(function() 
         if humanoid.JumpPower ~= settings.JumpPower.boosted then 
             humanoid.JumpPower = settings.JumpPower.boosted 
         end 
     end) 
 end 
  
 lp.CharacterAdded:Connect(add) 
  
 if lp.Character then 
     add(lp.Character) 
 end 
  
 rs.RenderStepped:Connect(function() 
     if lp.Character and lp.Character:FindFirstChild("Humanoid") then 
         apply(lp.Character.Humanoid, settings.WalkSpeed.boosted, settings.JumpPower.boosted) 
     end 
 end) 
  
      end 
 }) 
 Tab:AddButton({         
 Name = "ESP",         
 Callback = function()         
  
 local settings = { 
     enabled = true, 
     teamCheck = false, 
 } 
  
 local Players = game:GetService("Players") 
 local RunService = game:GetService("RunService") 
 local wtf = {} 
  
 function esp(player) 
     if not settings.enabled then return end 
     if settings.teamCheck and player.Team == Players.LocalPlayer.Team then return end 
     if player == Players.LocalPlayer then return end 
  
     local character = player.Character or player.CharacterAdded:Wait() 
     local humanoidRootPart = character:WaitForChild("HumanoidRootPart") 
  
     local Box = Drawing.new("Square") 
     Box.Color = Color3.new(1, 0, 0) 
     Box.Thickness = 2 
     Box.Transparency = 1 
     Box.Filled = false 
  
     local tracer = Drawing.new("Line") 
     tracer.Color = Color3.new(1, 0, 0) 
     tracer.Thickness = 1 
     tracer.Transparency = 1 
  
     local name = Drawing.new("Text") 
     name.Text = player.Name 
     name.Color = Color3.new(1, 1, 1) 
     name.Size = 20 
     name.Center = true 
     name.Outline = true 
     name.Transparency = 1 
  
     wtf[player] = {box = Box, tracer = tracer, name = name} 
  
     local function loop() 
         if not player.Character or not player.Character:FindFirstChild("HumanoidRootPart") then 
             Box.Visible = false 
             tracer.Visible = false 
             name.Visible = false 
             return 
         end 
  
         local hrpPosition, onScreen = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position) 
         if onScreen then 
             local top = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position + Vector3.new(0, 3, 0)) 
             local bottom = workspace.CurrentCamera:WorldToViewportPoint(humanoidRootPart.Position - Vector3.new(0, 3, 0)) 
             local size = Vector2.new(math.abs(top.X - bottom.X) * 1.5, math.abs(top.Y - bottom.Y) * 1.5) 
             Box.Size = size 
             Box.Position = Vector2.new(hrpPosition.X - size.X / 2, hrpPosition.Y - size.Y / 2) 
             Box.Visible = true 
  
             tracer.From = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y) 
             tracer.To = Vector2.new(hrpPosition.X, hrpPosition.Y) 
             tracer.Visible = true 
  
             name.Position = Vector2.new(hrpPosition.X, hrpPosition.Y - size.Y / 2 - 20) 
             name.Visible = true 
         else 
             Box.Visible = false 
             tracer.Visible = false 
             name.Visible = false 
         end 
     end 
  
     RunService.RenderStepped:Connect(loop) 
 end 
  
 function remove(player) 
     if wtf[player] then 
         wtf[player].box:Remove() 
         wtf[player].tracer:Remove() 
         wtf[player].name:Remove() 
         wtf[player] = nil 
     end 
 end 
  
 function add(player) 
     player.CharacterAdded:Connect(function(character) 
         esp(player) 
     end) 
     player.CharacterRemoving:Connect(function(character) 
         remove(player) 
     end) 
     if player.Character then 
         esp(player) 
     end 
 end 
  
 Players.PlayerAdded:Connect(add) 
  
 for _, player in pairs(Players:GetPlayers()) do 
     add(player) 
 end 
  
 function toggle(state) 
     settings.enabled = state 
     if not state then 
         for _, player in pairs(Players:GetPlayers()) do 
             remove(player) 
         end 
     else 
         for _, player in pairs(Players:GetPlayers()) do 
             if player.Character then 
                 esp(player) 
             end 
         end 
     end 
 end 
  
 function this_is_stupid(state) 
     settings.teamCheck = state 
 end 
  
      end 
 }) 
 Tab:AddButton({         
 Name = "自动胜利",         
 Callback = function()         
  
 loadstring(game:HttpGet("https://raw.githubusercontent.com/SkibidiCen/RivalsAutoFarmNice/main/Code"))() 
  
      end 
 }) 
  local Tab= Window:MakeTab({ 
         Name = "💮SCP角色演扮", 
         Icon = "rbxassetid://7733920644", 
         PremiumOnly = false 
 }) 
 Tab:AddParagraph("C屎人提供.还不快快感谢C屎人!🤓👍") 
 Tab:AddButton({ 
   Name = "FreeLean-Hub", 
   Callback = function ()   
 loadstring(game:HttpGet("https://raw.githubusercontent.com/KeoneGithub/KeoneGithub/main/FreeLeanSCP",true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "发疯Bot", 
   Callback = function () loadstring(game:HttpGet("https://gist.githubusercontent.com/cerealwithmilk/83c17f6e383b2fa0d70a887e14523593/raw/d0bee380c2e3ec3f72dc34d1b8ca345c4efc19d8/scp-roleplay.lua"))() 
  
   end 
 }) 
 Tab:AddButton({ 
   Name = "快速开门、广播+++", 
   Callback = function () 
     local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Rayfield/main/source'))() 
 local Window = Rayfield:CreateWindow({ 
    Name = "Sirius Hub | SCP: Site Roleplay", 
    LoadingTitle = "Rayfield Interface Suite", 
    LoadingSubtitle = "by wifi#1000", 
    ConfigurationSaving = { 
       Enabled = true, 
       FolderName = nil, -- Create a custom folder for your hub/game 
       FileName = "SiriusHub" 
    }, 
    Discord = { 
       Enabled = false, 
       Invite = "ABCD", -- The Discord invite code, do not include discord.gg/ 
       RememberJoins = true -- Set this to false to make them join the discord every time they load it up 
    }, 
    KeySystem = true, -- Set this to true to use our key system 
    KeySettings = { 
       Title = "Sirius Hub", 
       Subtitle = "Key System", 
       Note = "Join the discord!", 
       FileName = "SiriusKey", 
       SaveKey = true, 
       GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from 
       Key = "Hello" 
    } 
 }) 
  
 game:GetService("ReplicatedStorage").DefaultChatSystemChatEvents.SayMessageRequest:FireServer("Sirius W","All") 
  
 local MainTab = Window:CreateTab("Main", 4483362458) -- Title, Image 
  
  
 local Button = MainTab:CreateButton({ 
    Name = "Click to TP tool", 
    Callback = function() 
    mouse = game.Players.LocalPlayer:GetMouse() 
 tool = Instance.new("Tool") 
 tool.RequiresHandle = false 
 tool.Name = "Equip to Click TP" 
 tool.Activated:connect(function() 
 local pos = mouse.Hit+Vector3.new(0,2.5,0) 
 pos = CFrame.new(pos.X,pos.Y,pos.Z) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos 
 end) 
 tool.Parent = game.Players.LocalPlayer.Backpack 
    end, 
 }) 
  
  
 local Button = MainTab:CreateButton({ 
    Name = "Instant reset", 
    Callback = function() 
 local A_1 = 2 
 local Event = game:GetService("ReplicatedStorage").Died 
 Event:FireServer(A_1) 
  
    end, 
 }) 
  
  
 local Button = MainTab:CreateButton({ 
    Name = "Invisible", 
    Callback = function() 
    for i,v in pairs(game:GetService("Players").LocalPlayer.Character:GetChildren()) do 
         if v:IsA("Shirt") or v:IsA("Pants") or v:IsA("Hat") then 
                 v:Destroy() 
         end 
         if v:IsA("Part") or v:IsA("MeshPart") then 
                 v.Transparency = 1 
                 if v.Name == "Head" then 
                         if v:FindFirstChild("face") then 
                                 v.face:Destroy() 
                         end 
                 end 
         end 
 end 
    end, 
 }) 
  
 local Label = MainTab:CreateLabel("For invisible, they will stil be able to see ur head and name.") 
  
 local Tab = Window:CreateTab("Spam", 4483362458) -- Title, Image 
 local Button = Tab:CreateButton({ 
    Name = "SCPF COMMUNICATIONS RADIO", 
    Callback = function() 
 game:GetService("ReplicatedStorage").Team.Radio:FireServer("msg","hi guys!","SCPF COMMUNICATIONS") 
    end, 
 }) 
  
 local Button1 = Tab:CreateButton({ 
    Name = "CLASS-D COMMUNICATIONS RADIO", 
    Callback = function() 
 game:GetService("ReplicatedStorage").Team.Radio:FireServer("msg","hi guys!","CLASS-D COMMUNICATIONS") 
    end, 
 }) 
  
 local Button2 = Tab:CreateButton({ 
    Name = "Normal Chat", 
    Callback = function() 
 game:GetService("ReplicatedStorage").Team.Radio:FireServer("msg","hi guys!","CLASS-D COMMUNICATIONS") 
    end, 
 }) 
  
  
  
  
  
   end 
 }) 
 Tab:AddButton({ 
   Name = "SCP可用范围", 
   Callback = function () 
     _G.HeadSize = 15 
 _G.Disabled = true 
  
 game:GetService('RunService').RenderStepped:connect(function() 
 if _G.Disabled then 
 for i,v in next, game:GetService('Players'):GetPlayers() do 
 if v.Name ~= game:GetService('Players').LocalPlayer.Name then 
 pcall(function() 
 v.Character.HumanoidRootPart.Size = Vector3.new(_G.HeadSize,_G.HeadSize,_G.HeadSize) 
 v.Character.HumanoidRootPart.Transparency = 0.7 
 v.Character.HumanoidRootPart.BrickColor = BrickColor.new("Really blue") 
 v.Character.HumanoidRootPart.Material = "Neon" 
 v.Character.HumanoidRootPart.CanCollide = false 
 end) 
 end 
 end 
 end 
 end) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "快速射击", 
   Callback = function () 
 local g = getgc(true) 
 local t = {} 
 local p = game:GetService("Players").LocalPlayer 
 local function editCurrentGuns() 
     for _, v in pairs(g) do 
         if typeof(v) == "table" then 
             if rawget(v, "Ammo") and rawget(v, "CurrentAmmo") then 
                 table.insert(t,v) 
             end 
         end 
     end 
  
     for _,v in pairs(t) do 
         v.TBS = 0 
     end 
 end 
 task.spawn(editCurrentGuns) 
  
 p.Character:FindFirstChildOfClass("Humanoid"):UnequipTools() 
 for _,v in pairs(p.Backpack:GetChildren()) do 
     if v:IsA("Tool") and v:FindFirstChild("identifier") then 
         v:FindFirstChild("identifier"):Destroy() 
     end 
 end; for _, v in pairs(game:GetService("ReplicatedStorage").GunSettings:GetChildren()) do 
     if v:IsA("ModuleScript") then 
         local m = require(v) 
         if m.TBS then 
             m.TBS = 0 
         end 
     end 
 end; p.Backpack.ChildAdded:Connect(function(v) 
     p.Character:FindFirstChildOfClass("Humanoid"):UnequipTools() 
     if v:IsA("Tool") and v:FindFirstChild("identifier") then 
         v:FindFirstChild("identifier"):Destroy() 
     end 
 end) 
  
   end 
 }) 
 Tab:AddButton({ 
   Name = "打身体改爆头", 
   Callback = function () 
     local nchook  
 nchook = hookmetamethod(game, "__namecall", newcclosure(function(self, ...) 
     local args = {...}  
     if (not checkcaller()) and tostring(self.Name) == "ShotRemote" and args[2] then  
         local x = args[2].Parent:FindFirstChild("Head")  
         local z = args[2].Parent.Parent:FindFirstChild("Head")  
         local y = args[2].Parent.Parent.Parent:FindFirstChild("Head")  
         local q = {x, y, z}  
         for i,v in pairs(q) do  
             if v == nil then  
                 table.remove(q, i) 
             end  
         end  
         args[1] = { 
             q[1].Position.X,  
             q[1].Position.Y, 
             q[1].Position.Z, 
         } 
         args[2] = q[1]  
         return self.FireServer(self, unpack(args)) 
     end  
     return nchook(self, ...) 
 end)) 
  
   end 
 }) 
 Tab:AddButton({ 
   Name = "自动换蛋+++", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SCPRoleplay.lua", true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "传送到怪物点位", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/sinret/rbxscript.com-scripts-reuploads-/main/scp%20rp2", true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "SCP最强脚本😋👍", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/AnomalyRBLX/Database/main/Scripts/SCP%3A%20Roleplay"))() 
   end 
 }) 
 Tab:AddParagraph("有一些是电脑用的脚本😋") 
  
 local Tab= Window:MakeTab({ 
         Name = "老大出租车", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "Raw.Mani", 
   Callback = function () 
     loadstring(game:HttpGet("https://pastebin.com/raw/5ScA4pR9"))() 
   end 
 }) 
 Tab:AddParagraph("C屎人提供，谢谢") 
local Tab= Window:MakeTab({ 
         Name = "💮武器库💮", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "自瞄(区分团队)", 
   Callback = function () 
     local fov = 100 
 local maxTransparency = 0.1 -- TransparÃªncia mÃ¡xima dentro do cÃ­rculo (0.1 = 10% de transparÃªncia) 
 local RunService = game:GetService("RunService") 
 local UserInputService = game:GetService("UserInputService") 
 local Players = game:GetService("Players") 
 local Teams = game:GetService("Teams") -- Adicione esta linha para acessar os times 
 local Cam = game.Workspace.CurrentCamera 
  
 local FOVring = Drawing.new("Circle") 
 FOVring.Visible = true 
 FOVring.Thickness = 2 
 FOVring.Color = Color3.fromRGB(128, 0, 128) -- Cor roxa 
 FOVring.Filled = false 
 FOVring.Radius = fov 
 FOVring.Position = Cam.ViewportSize / 2 
 FOVring.Transparency = 0.1 -- TransparÃªncia inicial igual ao segundo script 
  
 local function updateDrawings() 
     local camViewportSize = Cam.ViewportSize 
     FOVring.Position = camViewportSize / 2 
 end 
  
 local function onKeyDown(input) 
     if input.KeyCode == Enum.KeyCode.Delete then 
         RunService:UnbindFromRenderStep("FOVUpdate") 
         FOVring:Remove() 
     end 
 end 
  
 UserInputService.InputBegan:Connect(onKeyDown) 
  
 local function lookAt(target) 
     local lookVector = (target - Cam.CFrame.Position).unit 
     local newCFrame = CFrame.new(Cam.CFrame.Position, Cam.CFrame.Position + lookVector) 
     Cam.CFrame = newCFrame 
 end 
  
 local function calculateTransparency(distance) 
     -- Ajuste a transparÃªncia com base na distÃ¢ncia do centro do cÃ­rculo 
     local maxDistance = fov -- A distÃ¢ncia mÃ¡xima do centro do cÃ­rculo 
     local transparency = (1 - (distance / maxDistance)) * maxTransparency 
     return transparency 
 end 
  
 local function getClosestPlayerInFOV(trg_part) 
     local nearest = nil 
     local last = math.huge 
     local playerMousePos = Cam.ViewportSize / 2 
     local localPlayer = Players.LocalPlayer 
     local localPlayerTeam = localPlayer.Team 
  
     for _, player in ipairs(Players:GetPlayers()) do 
         if player ~= localPlayer then 
             local part = player.Character and player.Character:FindFirstChild(trg_part) 
             if part then 
                 local ePos, isVisible = Cam:WorldToViewportPoint(part.Position) 
                 local distance = (Vector2.new(ePos.x, ePos.y) - playerMousePos).Magnitude 
  
                 -- Adicione uma verificaÃ§Ã£o de equipe aqui 
                 if isVisible and distance < fov and player.Team ~= localPlayerTeam then 
                     if distance < last then 
                         last = distance 
                         nearest = player 
                     end 
                 end 
             end 
         end 
     end 
  
     return nearest 
 end 
  
 RunService.RenderStepped:Connect(function() 
     updateDrawings() 
     local closest = getClosestPlayerInFOV("Head") 
     if closest and closest.Character:FindFirstChild("Head") then 
         lookAt(closest.Character.Head.Position) 
  
         if closest then 
             local ePos, isVisible = Cam:WorldToViewportPoint(closest.Character.Head.Position) 
             local distance = (Vector2.new(ePos.x, ePos.y) - (Cam.ViewportSize / 2)).Magnitude 
             FOVring.Transparency = calculateTransparency(distance) 
         else 
             FOVring.Transparency = 0.1 -- Mantenha completamente visÃ­vel quando nenhum jogador estiver no FOV 
         end 
     else 
         FOVring.Transparency = 0.1 -- Mantenha completamente visÃ­vel quando nenhum jogador estiver no FOV 
     end 
 end) 
  
   end 
 }) 
 Tab:AddButton({ 
   Name = "自瞄、区分墙壁、团队(卡密↓)", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Dustin21335/Universal-aimbot-Roblox/main/Aimbot.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
         Name = "复制卡密↑", 
         Callback = function() 
         setclipboard("Aim2143") 
 end 
 }) 
 Tab:AddParagraph("C屎人提供👍") 
 Tab:AddButton({ 
   Name = "Index-Hub", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/TheEmptynessProject/EmptynessProject/main/index.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Air-Hub", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Exunys/AirHub/main/AirHub.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "NEXUS-HUB", 
   Callback = function () 
     loadstring(game:HttpGet('https://raw.githubusercontent.com/13B8B/NEXUS/main/loadstring'))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "无声瞄准", 
   Callback = function () 
     loadstring(game:HttpGet('https://raw.githubusercontent.com/yeerma/fff/main/weaponry'))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "AlphaZero-Hub", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Sw1ndlerScripts/AlphaZero/main/Loader.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "射速、聚点、无后、秒换蛋", 
   Callback = function () 
   -- // Variables 
  
 getgenv().fireRate = 0.01 
 getgenv().reloadTime = 0 
  
 -- // Code 
  
 local a; 
 a = hookmetamethod(game, "__namecall", function(self, ...) 
    local method = getnamecallmethod() 
    if method == "Play" and tostring(self):lower():find("reload") and reloadTime == 0 then 
        return true 
    end 
  
    return a(self, ...) 
 end) 
  
 local localPlayer = game:GetService("Players").LocalPlayer 
 local playerScripts = localPlayer.PlayerScripts 
 local weaponFramework = playerScripts.WeaponryFramework 
  
 local currentWeapons; 
 for i, v in pairs(getsenv(weaponFramework)) do 
    if typeof(v) == "function" and i == "OpenInventoryManager" then 
        currentWeapons = getupvalues(v)[5] 
    end 
 end 
  
 task.spawn(function() 
    while task.wait(1) do 
        for i, v1 in pairs(currentWeapons) do 
            local v = v1.WeaponStats 
            if not v1.CurrentAmmo then continue end 
  
            v.BloomResetTime = 0 
            v.MaxBloom = 0 
            v.Reload_Start = 0 
            v.Reload_Insert = 0 
            v.Reload_EndTime = 0 
            v.Reload_PerAmmo = 0 
            if v.Spread then 
                for i1, v2 in pairs(v.Spread) do 
                    v.Spread[i1] = Vector3.new(0,0,0) 
                end 
            end 
  
            rawset(v, "FireRate", fireRate) 
            rawset(v, "Reload_TotalTime", reloadTime) 
            rawset(v, "Reload_AmmoFull", reloadTime) 
            rawset(v, "EquipTime", 0) 
            rawset(v, "Range", math.huge) 
            rawset(v, "RecoilData", { 
                ["y"] = { 
                    ["Damper"] = 0, 
                    ["Speed"] = 0, 
                    ["MaxAngle"] = 0, 
                    ["ADSreduction"] = 0, 
                    ["MinAngle"] = 0 
                }, 
                ["x"] = { 
                    ["Damper"] = 0, 
                    ["Speed"] = 0, 
                    ["MaxAngle"] = 0, 
                    ["ADSreduction"] = 0, 
                    ["MinAngle"] = 0 
                }, 
                ["z"] = { 
                    ["Damper"] = 0, 
                    ["Speed"] = 0, 
                    ["MaxAngle"] = 0, 
                    ["ADSreduction"] = 0, 
                    ["MinAngle"] = 0 
                } 
            }) 
  
            if v.Animations and v.Animations.reload then 
                for i, v in pairs(v.Animations.reload.SoundTimeStamps) do 
                    rawset(v, "Time", 0) 
                end 
            end 
        end 
    end 
 end) 
   end 
 }) 
 Tab:AddParagraph("有些是电脑端手机用不了") 
 local Tab= Window:MakeTab({ 
         Name = "犯罪率", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "FemWare 电脑端", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/JackHiggly/FemWare/main/FemWare%20Alternative", true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "FemWare 手机端", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Moonlight/main/Criminality.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Moonlight-Hub", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/GlobeReverse/Moonlight/main/Criminality.lua"))() 
   end 
 }) 
 Tab:AddParagraph("感谢QQ群里的《家里》提供!!!!") 
 Tab:AddParagraph("赞!!!") 
 local Tab = Window:MakeTab({ 
         Name = "驾驶帝国", 
         Icon = "rbxassetid://7734068321", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "Lightu-X(NEO)", 
   Callback = function () 
    loadstring(game:HttpGet(('https://raw.githubusercontent.com/cool83birdcarfly02six/Lightux/main/README.md'),true))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "Scienco HUB", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Marco8642/science/main/drivingempire", true))() 
   end 
 }) 
 Tab:AddParagraph("群友提供") 
  
 local Tab= Window:MakeTab({ 
         Name = "小凌-执行器", 
         Icon = "rbxassetid://8997388548", 
         PremiumOnly = false 
 }) 
  Tab:AddButton({         
 Name = "Flooded V",         
 Callback = function()         
loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Flooded-V/refs/heads/main/Flooded%20V%20%E6%B1%89%E5%8C%96.Lua"))()
      end 
 }) 
 Tab:AddButton({ 
   Name = "Kato-UI", 
   Callback = function ()  loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao-Ling-Kato-Executer/main/Kato%E6%BA%90%E7%A0%81%E6%9C%80%E6%96%B0%EF%BC%88%E7%9C%9F%E7%9A%84%E6%B3%A8%E5%85%A5%E5%99%A8%EF%BC%89.txt"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Vega X-UI", 
   Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/vegax.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Code X-UI", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/codex.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Evon-UI", 
   Callback = function () 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/evon.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Code X-ios", 
   Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/SPDM-Team/Arceus-X-NEO-public/main/Costumers/codex_ios.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Tx3Xploit-UI", 
   Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/Cloud-script/main/%E6%B3%A8%E5%85%A5%E5%99%A8"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "Arceus X-UI", 
   Callback = function () loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Xiao_Ling-Arceus.Executer/main/Arceus%20X%E6%BA%90%E7%A0%81.lua"))("小凌改Arceus X")  
   end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "空脚本特供!(推荐)", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "空脚本最新(推荐)", 
   Callback = function () 
    getgenv().LS="空脚本最新" loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/obf_8AT8q36zDJ1F59bRSuHJi8dH4kHcd8uJQaj7r5eKYwt0JjMt1MWdwdvdA26AG85U.lua"))()  
   end 
 }) 
  
 Tab:AddButton({ 
   Name = "空脚本", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%AC1.0.3.txt"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "XSC 脚本", 
   Callback = function () 
     getgenv().XC="作者XC"loadstring(game:HttpGet("https://pastebin.com/raw/PAFzYx0F"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "空脚本3", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/BINjiaobzx6/BINjiao/main/%E7%A9%BA%E8%84%9A%E6%9C%AC666.txt"))() 
   end 
 }) 
  
 local Tab= Window:MakeTab({ 
         Name = "林脚本破解版", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "林脚本AL团队破解", 
   Callback = function () 
     AL = "Advanced Logic团队破解" 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/longshu886/longscript/main/linpojie"))() 
   end 
 }) 
 local Tab= Window:MakeTab({ 
         Name = "战争大亨全是改版", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "Tycoon-HUB", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/Nivex123456/War-Tycoon/main/Script"))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "WarTycoon-HUB", 
   Callback = function () 
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "GN-HUB", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/nici002018/GNHub/master/GNHub.lua", true))()   
   end 
 }) 
 Tab:AddButton({ 
   Name = "WaeSTycoon-Home", 
   Callback = function () 
      loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/WarTycoon", true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "WateedTucoon-HUB", 
   Callback = function () 
      loadstring(game:HttpGet('https://raw.githubusercontent.com/ToraScript/Script/main/WarTycoon'))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "自动偷油桶?", 
   Callback = function () 
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1007, 46, -32.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-986, 44, -29.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-932, 44, -26.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-908, 44, -26.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-909, 46, -5.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1006, 46, -5.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-987, 44, -2.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-908, 45, -6.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-935, 46, -6.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1028, 46, -49.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1051, 46, -49.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1050, 42, -69.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1022, 43, -71.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-998, 43, -68.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-973, 43, -69.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-969, 44, -91.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-994, 45, -88.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1025, 47, -10.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1083, 47, -118.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1080, 45, -138.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1053, 43, -140.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1057, 47, -118.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-996, 44, -150.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-972, 47, -150.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-976, 49, -127.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-915, 44, -125.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-887, 43, -126.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-890, 45, -105.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-916, 46, -104.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1001, 49, -129.) 
 wait(0) 
 game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-1026, 47, -10.) 
 wait(0) 
   end 
 }) 
 Tab:AddButton({ 
   Name = "改版Tycoon", 
   Callback = function () 
    loadstring(gameHttpGet("httpsraw.githubusercontent.comNivex123456War-TycoonmainScript"))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "Oilwarfare-HUB", 
   Callback = function () 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/Vortex194/main/main/oilwarfare", true))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "Owartycoon-HUB", 
   Callback = function () 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/ToraIsMe/ToraIsMe/main/0wartycoon", true))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "EngineV2-HUB", 
   Callback = function () 
   loadstring(game:HttpGet("https://raw.githubusercontent.com/megamoeus/UI-Engine-V2/main/OWTPublic"))() 
   end 
 }) 
 Tab:AddParagraph("由Krx提供") 
  
 local Tab= Window:MakeTab({ 
         Name = "汽车破坏机", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "T7ERd3e8脚本", 
   Callback = function () 
    loadstring(game:HttpGet('https://pastebin.com/raw/T7ERd3e8'))()  
   end 
 }) 
 Tab:AddButton({ 
   Name = "Saucekid(Plus)", 
   Callback = function () 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/CarCrushers.lua"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "电脑OP通用", 
   Callback = function () 
    loadstring(game:HttpGet("https://raw.githubusercontent.com/saucekid/scripts/main/CarCrushers.lua"))() 
   end 
 }) 
 Tab:AddParagraph("👌") 
 local Tab= Window:MakeTab({ 
         Name = "俄亥俄州", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "Rxn.xyz-HUB", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/rxn-xyz/Ohio./main/Ohio.lua",true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "神奇的指令", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/longshulol/long/main/longshu/Ohio"))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "HkvHeHed-HUB", 
   Callback = function () 
     loadstring(game:HttpGet("https://pastebin.com/raw/hkvHeHed",true))() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "剑客工作室", 
   Callback = function () 
     loadstring(game:HttpGet("https://raw.githubusercontent.com/jiankeQWQ/jiankeV3/main/ehaiezhou"))() 
   end 
 }) 
 Tab:AddParagraph("功能自己猜") 
  
 local Tab= Window:MakeTab({ 
         Name = "勇气与黑火药G＆B", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
 Tab:AddButton({ 
   Name = "清风-劳大版", 
   Callback = function () loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\40\34\104\116\116\112\115\58\47\47\102\114\101\101\110\111\116\101\46\98\105\122\47\114\97\119\47\109\117\122\110\104\101\114\104\114\117\34\41\44\116\114\117\101\41\41\40\41\10")() 
   end 
 }) 
 Tab:AddButton({ 
   Name = "清风原版", 
   Callback = function () loadstring(game:HttpGet(("\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\115\120\99\115\114\49\49\52\53\49\52\47\115\120\99\115\114\49\49\52\53\49\52\49\47\109\97\105\110\47\115\120\99\115\114\49\51\52\56\52\56\52\56\56\46\108\117\97"),true))() 
   end 
 }) 
  
 local Tab = Window:MakeTab({ 
         Name = "起床战争", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  
 Tab:AddButton({ 
   Name = "Demonic-HUB-V2", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Alan0947383/Demonic-HUB-V2/main/S-C-R-I-P-T.lua",true))() 
   end 
 }) 
  
 Tab:AddButton({ 
   Name = "VAPE4.0", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/7GrandDadPGN/VapeV4ForRoblox/main/NewMainScript.lua", true))() 
   end 
 }) 
  
 local Tab = Window:MakeTab({ 
         Name = "活过杀手", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  
 Tab:AddButton({ 
   Name = "CHaiRWre-HUB", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Milan08Studio/ChairWare/main/main.lua"))() 
   end 
 }) 
  
 local Tab = Window:MakeTab({ 
         Name = "基本都是混音FNF", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  
 Tab:AddButton({ 
   Name = "Library-HUB", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/MariyaFurmanova/Library/main/BasicallyFNF", true))() 
   end 
 }) 
 local Tab = Window:MakeTab({ 
         Name = "最强的战场", 
         Icon = "rbxassetid://7733779610", 
         PremiumOnly = false 
 }) 
  
 Tab:AddButton({ 
   Name = "REPoaFWC", 
   Callback = function() 
 loadstring(game:HttpGet("https://pastefy.app/REPoaFWC/raw",true))(); 
   end 
 }) 
  
 Tab:AddButton({ 
   Name = "Nicuse(需卡密)", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/Nicuse/RobloxScripts/main/SaitamaBattlegrounds.lua"))() 
   end 
 }) 
  
     Tab:AddButton({ 
   Name = "BadWare-Hub", 
   Callback = function() 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/sandwichk/RobloxScripts/main/Scripts/BadWare/Hub/Load.lua", true))() 
   end 
 }) 
  
 Tab:AddButton({ 
   Name = "Battlegrounuds77", 
   Callback = function () 
 loadstring(game:HttpGet("https://raw.githubusercontent.com/LOLking123456/Strongest/main/Battlegrounds77"))() 
   end 
 }) 
  
 Tab:AddButton({ 
         Name = "↑点击复制卡密↑", 
         Callback = function() 
      setclipboard("BestTheStrongest5412Roblox") 
   end 
 }) 
  