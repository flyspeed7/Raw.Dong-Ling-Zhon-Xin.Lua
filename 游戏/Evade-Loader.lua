local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()

local OpenUI = Instance.new("ScreenGui") 
local ImageButton = Instance.new("ImageButton") 
local UICorner = Instance.new("UICorner") 
OpenUI.Name = "OpenUI" 
OpenUI.Parent = game.CoreGui 
OpenUI.ZIndexBehavior = Enum.ZIndexBehavior.Sibling 
ImageButton.Parent = OpenUI 
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 67, 175) 
ImageButton.BackgroundTransparency = 0.500 
ImageButton.Position = UDim2.new(0.0235790554, 0, 0.466334164, 0) 
ImageButton.Size = UDim2.new(0, 50, 0, 50) 
ImageButton.Image = "rbxassetid://16060333448" 
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

local win = lib:Window("Linux N 破坏者谜团",Color3.fromRGB(255, 154, 0), Enum.KeyCode.RightControl) 

 local Tab21 = creds:section("信息",true)
Tab21:Label("服务器ID：" .. game.GameId .. ".")
Tab21:Label("你的名称："..game.Players.LocalPlayer.DisplayName.."")
Tab21:Label("你的用户名："..game.Players.LocalPlayer.Name.."")
Tab21:Label("你的注入器："..identifyexecutor().."")

local esp = win:Tab("ESP")
-- 声明一个函数来自动重生玩家
local function autoRespawn(state)
    while true do
        -- 检查玩家是否死亡
        if game.Players.LocalPlayer.Character == nil then
            -- 等待玩家重生
            game.Players.LocalPlayer:WaitForChild("Character")
        end
        wait(0.1) -- 减少循环频率以避免过度占用资源
    end
end

-- 声明一个函数来高亮地图
local function brightenMap(state)
    -- 假设我们有一个可以控制地图亮度的设置
    local lighting = game.Lighting
    lighting.Brightness = 100 -- 设置亮度为2，可以根据需要调整
end

-- 声明一个函数来显示Nextbot ESP
local function nextbotESP(state)
    for _, player in pairs(game.Players:GetPlayers()) do
        if player ~= game.Players.LocalPlayer then
            -- 创建一个透明的球体来表示其他玩家的位置
            local espPart = Instance.new("Part")
            espPart.Name = "ESP"
            espPart.Size = Vector3.new(2, 2, 2)
            espPart.Transparency = 0.5 -- 设置透明度
            espPart.BrickColor = BrickColor.new("Bright red") -- 设置颜色
            espPart.CanCollide = false
            espPart.Anchored = true
            espPart.Position = player.Character.HumanoidRootPart.Position
            espPart.Parent = workspace
        end
    end
end
esp:Toggle("ESP 玩家", false, function(state)
loadstring(game:HttpGet('https://raw.githubusercontent.com/Lucasfin000/SpaceHub/main/UESP'))() 
end)

esp:Toggle("ESP 怪物", false, function(state)
nextbotESP(state)
end)

local tab = win:Tab("其他")

tab:Toggle("自动重生", false, function(state)
autoRespawn(state)
end)
tab:Toggle("高亮", false, function(state)
brightenMap(state)
end)


