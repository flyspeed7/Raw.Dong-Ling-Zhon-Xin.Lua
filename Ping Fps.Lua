local screenGui = Instance.new("ScreenGui")
screenGui.IgnoreGuiInset = true
screenGui.Parent = game.Players.LocalPlayer.PlayerGui

local displayFrame = Instance.new("Frame")
displayFrame.Size = UDim2.new(0, 200, 0, 60)
displayFrame.Position = UDim2.new(0.5, -100, 0, 8)
displayFrame.BackgroundColor3 = Color3.fromRGB(30, 30, 30)
displayFrame.BorderSizePixel = 0
displayFrame.Visible = true
displayFrame.Parent = screenGui

local corner1 = Instance.new("UICorner")
corner1.CornerRadius = UDim.new(0, 8)
corner1.Parent = displayFrame

local pingLabel = Instance.new("TextLabel")
pingLabel.Size = UDim2.new(1, 0, 0.5, 0)
pingLabel.Position = UDim2.new(0, 0, 0, 0)
pingLabel.Font = Enum.Font.SourceSansBold
pingLabel.TextSize = 14
pingLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
pingLabel.BackgroundTransparency = 1
pingLabel.Text = "Ping: Calculating..."
pingLabel.Parent = displayFrame

local fpsLabel = Instance.new("TextLabel")
fpsLabel.Size = UDim2.new(1, 0, 0.5, 0)
fpsLabel.Position = UDim2.new(0, 0, 0.5, 0)
fpsLabel.Font = Enum.Font.SourceSansBold
fpsLabel.TextSize = 14
fpsLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
fpsLabel.BackgroundTransparency = 1
fpsLabel.Text = "FPS: Calculating..."
fpsLabel.Parent = displayFrame

local function calculateMetrics()
	local pingTimeSec = game.Players.LocalPlayer:GetNetworkPing()
	local pingTimeMs = pingTimeSec * 1000
	pingLabel.Text = "    延迟: " .. tostring(math.floor(pingTimeMs)) .. "ms"

	local realFPS = workspace:GetRealPhysicsFPS()
	fpsLabel.Text = "帧率: " .. tostring(math.floor(realFPS))
end

game:GetService("RunService").RenderStepped:Connect(function()
	calculateMetrics()
end)

local dragStart, startPos

local function isTouchDevice()
	return game:GetService("UserInputService").TouchEnabled
end

local function inputBegan(input)
	if isTouchDevice() then
		if input.UserInputType == Enum.UserInputType.Touch then
			dragStart = input.Position
			startPos = displayFrame.Position
		end
	else
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragStart = input.Position
			startPos = displayFrame.Position
		end
	end
end

local function inputChanged(input)
	if dragStart then
		local dragDelta
		if isTouchDevice() then
			dragDelta = input.Position - dragStart
		else
			dragDelta = input.Position - dragStart
		end
		local newPosX = UDim2.new(startPos.X.Scale, startPos.X.Offset + dragDelta.X, startPos.Y.Scale, startPos.Y.Offset + dragDelta.Y)
		displayFrame.Position = newPosX
	end
end

if isTouchDevice() then
	displayFrame.InputBegan:Connect(inputBegan)
	displayFrame.InputChanged:Connect(inputChanged)
	displayFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.Touch then
			dragStart = nil
		end
	end)
else
	displayFrame.InputBegan:Connect(inputBegan)
	displayFrame.InputChanged:Connect(inputChanged)
	displayFrame.InputEnded:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 then
			dragStart = nil
		end
	end)
end

local settingsFrame = Instance.new("Frame")
settingsFrame.Size = UDim2.new(0, 200, 0, 100)
settingsFrame.Position = UDim2.new(0.5, -100, 0, 80)
settingsFrame.BackgroundColor3 = Color3.fromRGB(50, 50, 50)
settingsFrame.BorderSizePixel = 0
settingsFrame.Visible = false
settingsFrame.Parent = screenGui

local corner2 = Instance.new("UICorner")
corner2.CornerRadius = UDim.new(0, 8)
corner2.Parent = settingsFrame

local transparencyLabel = Instance.new("TextLabel")
transparencyLabel.Size = UDim2.new(1, 0, 0.5, 0)
transparencyLabel.Position = UDim2.new(0, 0, 0, 0)
transparencyLabel.Font = Enum.Font.SourceSansBold
transparencyLabel.TextSize = 14
transparencyLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transparencyLabel.BackgroundTransparency = 1
transparencyLabel.Text = "UI透明度\nUI颜色"
transparencyLabel.Parent = settingsFrame

local transparencySlider = Instance.new("TextButton")
transparencySlider.Size = UDim2.new(1, -20, 0, 20)
transparencySlider.Position = UDim2.new(0, 10, 0.5, -10)
transparencySlider.AutoButtonColor = false
transparencySlider.Text = ""
transparencySlider.BackgroundColor3 = Color3.fromRGB(100, 100, 100)
transparencySlider.BorderSizePixel = 0
transparencySlider.Parent = settingsFrame

local transparencyValueLabel = Instance.new("TextLabel")
transparencyValueLabel.Size = UDim2.new(0, 40, 0, 20)
transparencyValueLabel.Position = UDim2.new(1, -50, 0.5, -10)
transparencyValueLabel.Font = Enum.Font.SourceSansBold
transparencyValueLabel.TextSize = 14
transparencyValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
transparencyValueLabel.BackgroundTransparency = 1
transparencyValueLabel.Text = "50%"
transparencyValueLabel.Parent = settingsFrame

local function updateTransparency(value)
	local transparency = math.clamp(value, 0, 1)
	displayFrame.BackgroundTransparency = transparency
	transparencyValueLabel.Text = tostring(math.floor(transparency * 100)) .. "%"
end

local function sliderMove()
	local mouse = game.Players.LocalPlayer:GetMouse()
	local initialValue = displayFrame.BackgroundTransparency
	local dragStart = mouse.X
	local sliderSize = transparencySlider.AbsoluteSize.X

	local function updateSlider()
		local delta = mouse.X - dragStart
		local newValue = math.clamp(initialValue + (delta / sliderSize), 0, 1)
		updateTransparency(newValue)
	end

	local function endSliderMove()
		mouseMoveConnection:Disconnect()
		mouseUpConnection:Disconnect()
	end

	local mouseMoveConnection
	local mouseUpConnection

	mouseMoveConnection = transparencySlider.MouseMoved:Connect(updateSlider)
	mouseUpConnection = transparencySlider.MouseButton1Up:Connect(function()
		mouseMoveConnection:Disconnect()
		mouseUpConnection:Disconnect()
	end)
end

transparencySlider.MouseButton1Down:Connect(sliderMove)

local colorLabel = Instance.new("TextLabel")
colorLabel.Size = UDim2.new(1, 0, 0.5, 0)
colorLabel.Position = UDim2.new(0, 0, 0.5, 0)
colorLabel.Font = Enum.Font.SourceSansBold
colorLabel.TextSize = 14
colorLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
colorLabel.BackgroundTransparency = 1
colorLabel.Text = "颜色"
colorLabel.Parent = settingsFrame

local colorPicker = Instance.new("TextButton")
colorPicker.Size = UDim2.new(1, -20, 0, 20)
colorPicker.Position = UDim2.new(0, 10, 1, -30)
colorPicker.AutoButtonColor = false
colorPicker.Text = ""
colorPicker.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
colorPicker.BorderSizePixel = 0
colorPicker.Parent = settingsFrame

local colorValueLabel = Instance.new("TextLabel")
colorValueLabel.Size = UDim2.new(0, 40, 0, 20)
colorValueLabel.Position = UDim2.new(1, -50, 1, -30)
colorValueLabel.Font = Enum.Font.SourceSansBold
colorValueLabel.TextSize = 14
colorValueLabel.TextColor3 = Color3.fromRGB(255, 255, 255)
colorValueLabel.BackgroundTransparency = 1
colorValueLabel.Text = "White"
colorValueLabel.Parent = settingsFrame

local function updateColor(color)
	displayFrame.BackgroundColor3 = color
	colorValueLabel.Text = string.format("RGB: (%d, %d, %d)", color.R * 255, color.G * 255, color.B * 255)
end

colorPicker.MouseButton1Down:Connect(function()
	local color = Color3.new(math.random(), math.random(), math.random())
	updateColor(color)
end)

local settingsButton = Instance.new("TextButton")
settingsButton.Size = UDim2.new(0, 50, 0, 30)
settingsButton.Position = UDim2.new(0.3, -50, 0, 10)
settingsButton.Font = Enum.Font.SourceSansBold
settingsButton.TextSize = 14
settingsButton.TextColor3 = Color3.fromRGB(255, 255, 255)
settingsButton.BackgroundTransparency = 0.5
settingsButton.BackgroundColor3 = Color3.fromRGB(0, 120, 255)
settingsButton.BorderSizePixel = 0
settingsButton.Text = "设置"
settingsButton.Parent = displayFrame

settingsButton.MouseButton1Click:Connect(function()
	settingsFrame.Visible = not settingsFrame.Visible
end)

local settingsDragger = settingsFrame
local dragInput, dragStart, startPos

local function updateInput(input)
	local delta = input.Position - dragStart
	settingsDragger.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

settingsDragger.InputBegan:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
		dragStart = input.Position
		startPos = settingsDragger.Position
		input.Changed:Connect(function()
			if input.UserInputState == Enum.UserInputState.End then
				dragStart = nil
			end
		end)
	end
end)

settingsDragger.InputChanged:Connect(function(input)
	if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
		dragInput = input
	end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
	if input == dragInput and dragStart then
		updateInput(input)
	end
end)
