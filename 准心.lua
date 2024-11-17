local Players = game:GetService("Players")
local LocalPlayer = Players.LocalPlayer
local PlayerGui = LocalPlayer:WaitForChild("PlayerGui")
local RunService = game:GetService("RunService")

local screenGui = Instance.new("ScreenGui")
screenGui.Parent = PlayerGui

local frame = Instance.new("Frame")
frame.Size = UDim2.new(0, 200, 0, 250)
frame.Position = UDim2.new(0.5, -100, 0.5, -125)
frame.BackgroundTransparency = 0.5
frame.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
frame.Draggable = true
frame.Active = true
frame.Visible = false
frame.Parent = screenGui

local function createButton(name, position, text)
    local button = Instance.new("TextButton")
    button.Size = UDim2.new(0, 75, 0, 50)
    button.Position = position
    button.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
    button.TextColor3 = Color3.new(1, 1, 1)
    button.Text = text
    button.Name = name
    button.Parent = frame

    local corner = Instance.new("UICorner")
    corner.CornerRadius = UDim.new(0, 10)
    corner.Parent = button
    
    return button
end

local redButton = createButton("RedButton", UDim2.new(0, 10, 0, 5), "红色")
local blueButton = createButton("BlueButton", UDim2.new(0, 10, 0, 60), "蓝色")
local whiteButton = createButton("WhiteButton", UDim2.new(0, 10, 0, 115), "白色")
local blackButton = createButton("BlackButton", UDim2.new(0, 10, 0, 170), "黑色")

local greenButton = createButton("GreenButton", UDim2.new(0, 10 + 75 + 5, 0, 5), "绿色")
local yellowButton = createButton("YellowButton", UDim2.new(0, 10 + 75 + 5, 0, 60), "黄色")
local pinkButton = createButton("PinkButton", UDim2.new(0, 10 + 75 + 5, 0, 115), "粉色")
local extraBlackButton = createButton("ExtraBlackButton", UDim2.new(0, 10 + 75 + 5, 0, 170), "灰色")

local toggleGuiButton = Instance.new("TextButton")
toggleGuiButton.Size = UDim2.new(0, 45, 0, 45)
toggleGuiButton.Position = UDim2.new(0, 10, 0, 10)
toggleGuiButton.BackgroundColor3 = Color3.fromRGB(128, 128, 128)
toggleGuiButton.TextColor3 = Color3.new(1, 1, 1)
toggleGuiButton.Text = "开"
toggleGuiButton.Parent = screenGui

local toggleButtonCorner = Instance.new("UICorner")
toggleButtonCorner.CornerRadius = UDim.new(0, 10)
toggleButtonCorner.Parent = toggleGuiButton

local crosshairColor = Color3.new(1, 1, 1)
local crosshairVisible = false

local Crosshair = Drawing.new("Line")
Crosshair.Color = crosshairColor
Crosshair.Thickness = 2

local Crosshair2 = Drawing.new("Line")
Crosshair2.Color = crosshairColor
Crosshair2.Thickness = 2

RunService.RenderStepped:Connect(function()
    if crosshairVisible then
        local Center = Vector2.new(workspace.CurrentCamera.ViewportSize.X / 2, workspace.CurrentCamera.ViewportSize.Y / 2)
        
        Crosshair.From = Vector2.new(Center.X - 10, Center.Y)
        Crosshair.To = Vector2.new(Center.X + 10, Center.Y)
        Crosshair.Visible = true
        
        Crosshair2.From = Vector2.new(Center.X, Center.Y - 10)
        Crosshair2.To = Vector2.new(Center.X, Center.Y + 10)
        Crosshair2.Visible = true
    else
        Crosshair.Visible = false
        Crosshair2.Visible = false
    end
end)

local function updateCrosshairColor(color)
    crosshairColor = color
    if crosshairVisible then
        Crosshair.Color = color
        Crosshair2.Color = color
    end
end

local function destroyUI()
    screenGui:Destroy()
end

local function onButtonClicked(color)
    crosshairVisible = true
    updateCrosshairColor(color)
    destroyUI()
end

redButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(1, 0, 0))
end)

blueButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(0, 0, 1))
end)

whiteButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(1, 1, 1))
end)

blackButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(0, 0, 0))
end)

greenButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(0, 1, 0))
end)

yellowButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(1, 1, 0))
end)

pinkButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(1, 0, 1))
end)

extraBlackButton.MouseButton1Click:Connect(function()
    onButtonClicked(Color3.new(0, 0, 0))
end)

toggleGuiButton.MouseButton1Click:Connect(function()
    frame.Visible = not frame.Visible
    toggleGuiButton.Text = frame.Visible and "关" or "开"
end)