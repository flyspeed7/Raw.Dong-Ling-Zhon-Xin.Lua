local lib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Turtle-Brand/Turtle-Lib/main/source.lua"))()
local m = lib:Window("Y&F 琳 汉化")
local t = lib:Window("传送")
local players = game.Players
local plr = players.LocalPlayer
local characters = workspace:FindFirstChild("Characters")
local map = game.Workspace:FindFirstChild("Map")
getgenv().settings = {speedhack = false, props = false, players = false, crates = false}
local function openCrate(name)
    game:GetService("ReplicatedStorage"):WaitForChild("RemoteEvent"):FireServer("Crates.Buy", workspace:FindFirstChild("Crates")[name])    
end
m:Toggle("速度", false, function (bool)
    getgenv().settings.speedhack = bool
    while getgenv().settings.speedhack do
        local delta = game:GetService("RunService").Heartbeat:Wait()
        if plr.Character.Humanoid.MoveDirection.Magnitude > 0 then
            plr.Character:TranslateBy(plr.Character.Humanoid.MoveDirection * 4 * delta * 10)
        end
    end
end)
m:Toggle("道具 ESP", false, function (bool)
    getgenv().settings.props = bool
    if getgenv().settings.props then
        while getgenv().settings.props do
            if characters then
                for _, player in pairs(characters:GetChildren()) do
                    if player:GetAttribute("OriginalHipHeight") then
                        local mObject = player:FindFirstChild("MorphObject")
                        if mObject and not mObject:FindFirstChild("ESP_Props") then
                            local highlight = Instance.new("Highlight", mObject)
                            highlight.Name = "ESP_Props"
                            highlight.FillColor = Color3.new(0.35, 0.35, 1.000000)
                            highlight.FillTransparency = 0.6
                            highlight.OutlineColor = Color3.new(0.000000, 0.000000, 1.000000)
                        end
                    end
                end
            end
            wait(1)
        end
    else
        for _, e in pairs(characters:GetDescendants()) do
            if e:IsA("Highlight") and e.Name == "ESP_Props" then
                e:Destroy()
            end
        end
    end
end)
local crate
m:Dropdown("装货箱", {"普通", "稀罕", "珍贵", "史诗"}, function (name)
    if name == "Common" then
        crate = "BoxOne"
    elseif name == "Uncommon" then
        crate = "BoxTwo"
    elseif name == "Rare" then
        crate = "BoxThree"
    elseif name == "Epic" then
        crate = "BoxFour"
    end
end)
m:Button("打开装货箱", function ()
    openCrate(crate)
end)
m:Toggle("自动打开", false, function (bool)
    getgenv().settings.crates = bool
    while getgenv().settings.crates do
        openCrate(crate)
        wait(1)
    end
end)
t:Button("传送到大厅", function()
    plr.Character.HumanoidRootPart.CFrame = CFrame.new(113, 15, 359)
end)
t:Button("传送到地图", function()
    if map then
        for _, r in pairs(map:GetChildren()) do
            local spawn = r:FindFirstChild("SpawnToMap")
            if spawn then
                plr.Character.HumanoidRootPart.CFrame = spawn.CFrame + Vector3.new(0,5,0)
            end
        end
    end
end)
local function getPlayer(name)
	local lowerName = string.lower(name)
	for _, p in pairs(players:GetPlayers()) do
		local lowerPlayer = string.lower(p.Name)
		if string.find(lowerPlayer, lowerName) then
			return p
		elseif string.find(string.lower(p.DisplayName), lowerName) then
			return p
		end
	end
end
local player = nil
t:Box("玩家", function (name, focuslost)
    if focuslost then
        local player = getPlayer(name)
        if player then
            plr.Character.HumanoidRootPart.CFrame = player.Character.HumanoidRootPart.CFrame
        end
    end
end)
]]