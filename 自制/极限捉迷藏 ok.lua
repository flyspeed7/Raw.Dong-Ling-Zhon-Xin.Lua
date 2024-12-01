local Settings = {
    Names = false,
}
local RunService = game:GetService("RunService")
local UserInputService = game:GetService("UserInputService")
local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local Player = Players.LocalPlayer
local Mouse = Player:GetMouse()

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

local win = lib:Window("Y&F | 极限捉迷藏",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E) -- your own keybind 

local tab = win:Tab("主要功能")

tab:Toggle("自动收集硬币", false, function(Value)
    for i,v in pairs(game:GetDescendants()) do
if v.Name == 'Credit' then
v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
end
end
end)

tab:Toggle("透视玩家", false, function(Bool)
    Settings.Names = Bool
end)

function DrawText()
    local Text = Drawing.new("Text")
    Text.Color = Color3.fromRGB(190, 190, 0)
    Text.Size = 20
    Text.Outline = true
    Text.Center = true
    return Text
end

function DrawSquare()
    local Box = Drawing.new("Square")
    Box.Color = Color3.fromRGB(190, 190, 0)
    Box.Thickness = 0.5
    Box.Filled = false
    Box.Transparency = 1
    return Box
end

function IsPlayerAlive(player)
    if player.Character ~= nil and player.Character:FindFirstChild("HumanoidRootPart") then
        return true
    end
    return false
end

function GetOffset(part, pos)
    local FarPosition = Camera:WorldToViewportPoint(Vector3.new(part.Position.X, part.Position.Y + (part.Size.Y / 2), part.Position.Z))
    return FarPosition.Y - pos.Y
end

function GetCorners(player)
    local TopY = math.huge
    local BottomY = -math.huge
    local RightX = -math.huge
    local LeftX = math.huge
    local Offsets
    local Positions = {}
    for i, v in next, player.Character:GetChildren() do
        if v.ClassName == "MeshPart" or v.Name == "Head" then
            local Position, OnScreen = Camera:WorldToViewportPoint(v.Position)
            Positions[v.Name] = Position
            Offsets = GetOffset(v, Position)
            if OnScreen then
                if Position.Y < TopY then
                    TopY = Position.Y
                end
                if Position.Y > BottomY then
                    BottomY = Position.Y
                end
                if Position.X < LeftX then
                    LeftX = Position.X
                end
                if Position.X > RightX then
                    RightX = Position.X
                end
            end
        end
    end
    return {TopLeft = Vector2.new(LeftX + Offsets, TopY + Offsets), TopRight = Vector2.new(RightX - Offsets, TopY + Offsets), BottomLeft = Vector2.new(LeftX + Offsets, BottomY - Offsets), BottomRight = Vector2.new(RightX - Offsets, BottomY - Offsets), Positions = Positions}
end

function GetClosest()
    local Closest = nil
    local Magnitude = math.huge
    for i, v in next, Players:GetPlayers() do 
        if v ~= Player and IsPlayerAlive(v) then 
            if not Settings.TeamCheck or Settings.TeamCheck and v.Team ~= LocalPlayer.Team then
                local Position, Visible = Camera:WorldToScreenPoint(v.Character["HumanoidRootPart"].Position) 
                if Visible then
                    local Mouse = Player:GetMouse()
                    local Distance = (Vector2.new(Mouse.X, Mouse.Y) - Vector2.new(Position.X, Position.Y)).Magnitude 
                    if not Settings.FovUsed and Distance < Magnitude or Settings.FovUsed and Distance < Magnitude and Distance < Settings.Fov then 
                        Closest = v 
                        Magnitude = Distance
                    end
                end
            end
        end
    end
    return Closest 
end

function AddEsp(player)
    local Box = DrawSquare()
    local Name = DrawText()
    RunService.Stepped:Connect(function()
        IsAlive = IsPlayerAlive(player)
        if IsAlive and player.Character:FindFirstChild("HumanoidRootPart") then
            local Corners = GetCorners(player)
            local Positions = Corners.Positions
            local xDist = Corners.BottomRight.X - Corners.TopLeft.X
            local yDist = Corners.BottomRight.Y - Corners.TopLeft.Y
            local RootPosition, OnScreen = Camera:WorldToViewportPoint(player.Character.HumanoidRootPart.Position)
            if Settings.Boxes then
                Box.Visible = OnScreen
                Box.Size = Vector2.new(xDist, yDist)
                Box.Position = Corners.TopLeft
            else
                Box.Visible = false
            end
            if Settings.Names then
                Name.Visible = OnScreen
                Name.Position = Vector2.new(Corners.BottomRight.X - (xDist / 2), Corners.TopLeft.Y - 45)
                Name.Text = player.Name
            else
                Name.Visible = false
            end
        else
            Box.Visible = false
            Name.Visible = false
        end
    end)
end

for i, v in pairs(Players:GetPlayers()) do
    if v ~= Player then
        AddEsp(v)
    end
end

Players.PlayerAdded:Connect(function(player)
    if v ~= Player then
        AddEsp(player)
    end
end)

local isToggled = false

tab:Toggle("自动杀死(寻找者)", false, function(Value)
    isToggled = Value
end)

while true do
    if isToggled then
        for i, v in pairs(game.Players:GetChildren()) do 
            local playerBody = v.Character:FindFirstChild('HumanoidRootPart')
            local lp = game.Players.LocalPlayer.Character
            local hrp = lp:FindFirstChild('HumanoidRootPart')
            if v.Character.Humanoid.Health ~= 0 then 
                hrp.CFrame = playerBody.CFrame
            end
            task.wait(.2)
        end
    else
        task.wait(1) 
    end
end