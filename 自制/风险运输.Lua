-- source code fixed ok 👍

local rs = game:GetService("RunService")
local uis = game:GetService("UserInputService")
local http = game:GetService("HttpService")
local ts = game:GetService("TweenService")
local starter = game:GetService("StarterGui")
local lp = game:GetService("Players").LocalPlayer

local studio = rs:IsStudio()

local function yznotify(text)
	if studio then return end
	starter:SetCore("SendNotification", {Text = text, Title = "", Duration = 5})
end
yznotify("加载中...")
local gdata = {}
local sdata = {
	tc = 0;
	lastselt = nil;
}
local librsettings = {
	Ripple = true;
	CloseButton = true;
	ThemeColor = Color3.fromRGB(255, 25, 29);
	Theme2 = Color3.fromRGB(255, 0, 4)
}
local presetthemes = {
	["blood"] = {
		ThemeColor = Color3.fromRGB(255, 25, 29);
		Theme2 = Color3.fromRGB(255, 0, 4);
	},
	["water"] = {
		ThemeColor = Color3.fromRGB(21, 119, 203);
		Theme2 = Color3.fromRGB(28, 149, 255);
	},
	["grape"] = {
		ThemeColor = Color3.fromRGB(141, 77, 250);
		Theme2 = Color3.fromRGB(142, 95, 222);
	}
}
function gdata:LoadPresetTheme(name)
	local theme = presetthemes[name:lower()]
	if theme then
		librsettings.ThemeColor = theme.ThemeColor
		librsettings.Theme2 = theme.Theme2
	else
		warn("Oioioi")
	end
end
if isfile and readfile and writefile then
	if isfile("komaruthemeuwu") then
		gdata:LoadPresetTheme(readfile("komaruthemeuwu"))
	else
		writefile("komaruthemeuwu", "blood")
	end
end
local configfile
function gdata:Window(options)
	local window_data = {}
	configfile = options.ConfigFile
	if isfile and writefile and configfile and configfile then
		if not isfile(configfile) then
			writefile(configfile, "{}")
		end
	end
	local yzenium = Instance.new("ScreenGui")
	local YZTopBar = Instance.new("Frame")
	local Shadow = Instance.new("Frame")
	local DropShadowHolder = Instance.new("Frame")
	local DropShadow = Instance.new("ImageLabel")
	local SideBar = Instance.new("Frame")
	local SideTabsHolder = Instance.new("Frame")
	local ScrollableTabHolder = Instance.new("ScrollingFrame")
	local tablayout = Instance.new("UIListLayout")
	local TitleImages = Instance.new("Frame")
	local Icon = Instance.new("Frame")
	local IconCorner = Instance.new("UICorner")
	local TextLabel = Instance.new("TextLabel")
	local GenTitle = Instance.new("TextLabel")
	local GameName = Instance.new("TextLabel")
	local YZContents = Instance.new("Frame")
	local funnycat = Instance.new("ImageLabel")
	local UserProfile = Instance.new("Frame")
	local ProfilePicture = Instance.new("ImageLabel")
	local piccorner = Instance.new("UICorner")
	local UserName = Instance.new("TextLabel")

	UserProfile.Name = "UserProfile"
	UserProfile.Parent = SideBar
	UserProfile.AnchorPoint = Vector2.new(0, 1)
	UserProfile.BackgroundColor3 = Color3.fromRGB(19, 22, 19)
	UserProfile.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserProfile.BorderSizePixel = 0
	UserProfile.Position = UDim2.new(0, 0, 1, 0)
	UserProfile.Size = UDim2.new(0, 157, 0, 55)

	ProfilePicture.Name = "ProfilePicture"
	ProfilePicture.Parent = UserProfile
	ProfilePicture.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ProfilePicture.BackgroundTransparency = 1
	ProfilePicture.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ProfilePicture.BorderSizePixel = 0
	ProfilePicture.Position = UDim2.new(0.0509554148, 0, 0.181818187, 0)
	ProfilePicture.Size = UDim2.new(0, 35, 0, 35)
	ProfilePicture.Image = "rbxasset://textures/ui/GuiImagePlaceholder.png"

	piccorner.CornerRadius = UDim.new(1, 0)
	piccorner.Name = "piccorner"
	piccorner.Parent = ProfilePicture

	UserName.Name = "UserName"
	UserName.Parent = UserProfile
	UserName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	UserName.BackgroundTransparency = 1.000
	UserName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	UserName.BorderSizePixel = 0
	UserName.ClipsDescendants = true
	UserName.Position = UDim2.new(0.318471342, 0, 0.25454545, 0)
	UserName.Size = UDim2.new(0, 98, 0, 27)
	UserName.Font = Enum.Font.Arial
	UserName.RichText = true
	UserName.Text = "Unknown<font color=\"rgb(177,177,177)\">#0000</font>"
	UserName.TextColor3 = Color3.fromRGB(255, 255, 255)
	UserName.TextSize = 15.000
	UserName.TextXAlignment = Enum.TextXAlignment.Left

	if isfile and readfile and writefile then
		if isfile("yzuserdata.json") then
			local dec = http:JSONDecode(readfile("yzuserdata.json"))
			tag, username = dec.Tag, dec.User
			UserName.Text = username.."<font color=\"rgb(177,177,177)\">#"..tag.."</font>"
			ProfilePicture.Image = (getcustomasset and getcustomasset("profilepictures/1.png") or "https://www.roblox.com/headshot-thumbnail/image?userId=".. lp.UserId .."&width=420&height=420&format=png")
		else
			local newtag = tostring(math.random(0, 9)..math.random(0,9)..math.random(0,9)..math.random(0,9))
			local enc = {
				User = "YZenium",
				Tag = newtag
			}
			UserName.Text = "YZenium<font color=\"rgb(177,177,177)\">#"..newtag.."</font>"
			writefile("yzuserdata.json", http:JSONEncode(enc))
		end
		if not isfolder("profilepictures") then
			makefolder("profilepictures")
			writefile("profilepictures/1.png", game:HttpGet("https://raw.githubusercontent.com/railme37509124/YZeniumLibrary/main/profilepictures/1.png"))
			task.wait(3)
			ProfilePicture.Image = (getcustomasset and getcustomasset("profilepictures/1.png") or "https://www.roblox.com/headshot-thumbnail/image?userId=".. lp.UserId .."&width=420&height=420&format=png")
		end
	end

	yzenium.Name = http:GenerateGUID(true)
	yzenium.Parent = studio and game.Players.LocalPlayer:WaitForChild("PlayerGui") or (gethui and gethui() or game:GetService("CoreGui"))

	YZTopBar.Name = http:GenerateGUID(true)
	YZTopBar.Parent = yzenium
	YZTopBar.AnchorPoint = Vector2.new(0.5, 0.5)
	YZTopBar.BackgroundColor3 = Color3.fromRGB(18, 21, 18)
	YZTopBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	YZTopBar.BorderSizePixel = 0
	YZTopBar.Position = UDim2.new(0.5, 0, 0.344782025, 0)
	YZTopBar.Size = UDim2.new(0, 600, 0, 55)

	Shadow.Name = http:GenerateGUID(true)
	Shadow.Parent = YZTopBar
	Shadow.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	Shadow.BackgroundTransparency = 1.000
	Shadow.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Shadow.BorderSizePixel = 0
	Shadow.Size = UDim2.new(1, 0, 0, 375)

	DropShadowHolder.Name = http:GenerateGUID(true)
	DropShadowHolder.Parent = Shadow
	DropShadowHolder.BackgroundTransparency = 1.000
	DropShadowHolder.BorderSizePixel = 0
	DropShadowHolder.Size = UDim2.new(1, 0, 1, 0)
	DropShadowHolder.ZIndex = 0

	DropShadow.Name = http:GenerateGUID(true)
	DropShadow.Parent = DropShadowHolder
	DropShadow.AnchorPoint = Vector2.new(0.5, 0.5)
	DropShadow.BackgroundTransparency = 1.000
	DropShadow.BorderSizePixel = 0
	DropShadow.Position = UDim2.new(0.498, 0, 0.507, 0)
	DropShadow.Size = UDim2.new(1.005, 43, 1.005, 43)
	DropShadow.ZIndex = 0
	DropShadow.Image = "rbxassetid://6015897843"
	DropShadow.ImageColor3 = Color3.fromRGB(0, 0, 0)
	DropShadow.ImageTransparency = 0.500
	DropShadow.ScaleType = Enum.ScaleType.Slice
	DropShadow.SliceCenter = Rect.new(49, 49, 450, 450)

	SideBar.Name = http:GenerateGUID(true)
	SideBar.Parent = YZTopBar
	SideBar.BackgroundColor3 = Color3.fromRGB(18, 21, 18)
	SideBar.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideBar.BorderSizePixel = 0
	SideBar.Position = UDim2.new(0, 0, 1, 0)
	SideBar.Size = UDim2.new(0, 157, 0, 320)

	SideTabsHolder.Name = http:GenerateGUID(true)
	SideTabsHolder.Parent = SideBar
	SideTabsHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	SideTabsHolder.BackgroundTransparency = 1.000
	SideTabsHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	SideTabsHolder.BorderSizePixel = 0
	SideTabsHolder.ClipsDescendants = true
	SideTabsHolder.Size = UDim2.new(0, 157, 0, 261)

	ScrollableTabHolder.Name = http:GenerateGUID(true)
	ScrollableTabHolder.Parent = SideTabsHolder
	ScrollableTabHolder.Active = false
	ScrollableTabHolder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	ScrollableTabHolder.BackgroundTransparency = 1.000
	ScrollableTabHolder.BorderColor3 = Color3.fromRGB(0, 0, 0)
	ScrollableTabHolder.BorderSizePixel = 0
	ScrollableTabHolder.ClipsDescendants = false
	ScrollableTabHolder.Position = UDim2.new(0, 0, 0.00937500037, 0)
	ScrollableTabHolder.Size = UDim2.new(1, 0, 0.968124986, 0)
	ScrollableTabHolder.BottomImage = "rbxassetid://96871650232252"
	ScrollableTabHolder.CanvasSize = UDim2.new(0, 0, 0, 0)
	ScrollableTabHolder.ScrollBarThickness = 3
	ScrollableTabHolder.TopImage = "rbxassetid://139269508434571"
	ScrollableTabHolder.AutomaticCanvasSize = Enum.AutomaticSize.Y

	tablayout.Name = http:GenerateGUID(true)
	tablayout.Parent = ScrollableTabHolder
	tablayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
	tablayout.SortOrder = Enum.SortOrder.LayoutOrder
	tablayout.Padding = UDim.new(0, 6)

	TitleImages.Name = http:GenerateGUID(true)
	TitleImages.Parent = YZTopBar
	TitleImages.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TitleImages.BackgroundTransparency = 1.000
	TitleImages.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TitleImages.BorderSizePixel = 0
	TitleImages.Size = UDim2.new(0, 157, 0, 55)

	Icon.Name = http:GenerateGUID(true)
	Icon.Parent = TitleImages
	Icon.BackgroundColor3 = librsettings.ThemeColor
	Icon.BorderColor3 = Color3.fromRGB(0, 0, 0)
	Icon.BorderSizePixel = 0
	Icon.Position = UDim2.new(0.0573248416, 0, 0.181818187, 0)
	Icon.Size = UDim2.new(0, 35, 0, 35)

	IconCorner.CornerRadius = UDim.new(1, 0)
	IconCorner.Name = http:GenerateGUID(true)
	IconCorner.Parent = Icon

	TextLabel.Parent = Icon
	TextLabel.AnchorPoint = Vector2.new(0.5, 0.5)
	TextLabel.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	TextLabel.BackgroundTransparency = 1.000
	TextLabel.BorderColor3 = Color3.fromRGB(0, 0, 0)
	TextLabel.BorderSizePixel = 0
	TextLabel.Position = UDim2.new(0.5, 0, 0.5, 0)
	TextLabel.Size = UDim2.new(0.800000012, 0, 0.800000012, 0)
	TextLabel.Font = Enum.Font.Arial
	TextLabel.Text = options.Title:sub(1, 1)
	TextLabel.TextColor3 = Color3.fromRGB(220, 220, 220)
	TextLabel.TextScaled = true
	TextLabel.TextSize = 14.000
	TextLabel.TextWrapped = true

	GenTitle.Name = http:GenerateGUID(true)
	GenTitle.Parent = TitleImages
	GenTitle.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GenTitle.BackgroundTransparency = 1.000
	GenTitle.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GenTitle.BorderSizePixel = 0
	GenTitle.Position = UDim2.new(0.318471342, 0, 0.181818187, 0)
	GenTitle.Size = UDim2.new(0, 200, 0, 20)
	GenTitle.Font = Enum.Font.Arial
	GenTitle.Text = options.Title
	GenTitle.TextColor3 = librsettings.ThemeColor
	GenTitle.TextScaled = true
	GenTitle.TextSize = 14.000
	GenTitle.TextWrapped = true
	GenTitle.TextXAlignment = Enum.TextXAlignment.Left

	GameName.Name = http:GenerateGUID(true)
	GameName.Parent = TitleImages
	GameName.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	GameName.BackgroundTransparency = 1.000
	GameName.BorderColor3 = Color3.fromRGB(0, 0, 0)
	GameName.BorderSizePixel = 0
	GameName.Position = UDim2.new(0.318471342, 0, 0.545454562, 0)
	GameName.Size = UDim2.new(0, 200, 0, 11)
	GameName.Font = Enum.Font.Arial
	GameName.Text = options.GameName
	GameName.TextColor3 = Color3.fromRGB(189, 189, 189)
	GameName.TextScaled = true
	GameName.TextSize = 14.000
	GameName.TextWrapped = true
	GameName.TextXAlignment = Enum.TextXAlignment.Left

	YZContents.Name = http:GenerateGUID(true)
	YZContents.Parent = YZTopBar
	YZContents.BackgroundColor3 = Color3.fromRGB(16, 19, 16)
	YZContents.BorderColor3 = Color3.fromRGB(0, 0, 0)
	YZContents.BorderSizePixel = 0
	YZContents.Position = UDim2.new(0.261666656, 0, 1, 0)
	YZContents.Size = UDim2.new(0, 443, 0, 320)
	YZContents.ClipsDescendants = true

	funnycat.Name = http:GenerateGUID(true)
	funnycat.Parent = YZContents
	funnycat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
	funnycat.BackgroundTransparency = 1.000
	funnycat.BorderColor3 = Color3.fromRGB(0, 0, 0)
	funnycat.BorderSizePixel = 0
	funnycat.Size = UDim2.new(1, 0, 1, 0)
	funnycat.Image = "rbxassetid://90674775059124"
	funnycat.ImageTransparency = 0.970

	task.spawn(function()
		repeat
			GenTitle.TextColor3 = librsettings.ThemeColor
			Icon.BackgroundColor3 = librsettings.ThemeColor
			task.wait()
		until nil
	end)

	-- // ty to whoever made these functions
	local dragging
	local dragInput
	local dragStart
	local startPos
	local dragSpeed = 0.1

	local function update(input)
		local delta = input.Position - dragStart
		ts:Create(YZTopBar, TweenInfo.new(dragSpeed, Enum.EasingStyle.Sine), {Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X, startPos.Y.Scale, startPos.Y.Offset + delta.Y)}):Play()
	end

	YZTopBar.InputBegan:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseButton1 or input.UserInputType == Enum.UserInputType.Touch then
			dragging = true
			dragStart = input.Position
			startPos = YZTopBar.Position

			input.Changed:Connect(function()
				if input.UserInputState == Enum.UserInputState.End then
					dragging = false
				end
			end)
		end
	end)

	YZTopBar.InputChanged:Connect(function(input)
		if input.UserInputType == Enum.UserInputType.MouseMovement or input.UserInputType == Enum.UserInputType.Touch then
			dragInput = input
		end
	end)

	uis.InputChanged:Connect(function(input)
		if input == dragInput and dragging then
			update(input)
		end
	end)

	local function Resize(part, new, _delay)
		_delay = _delay or 0.5
		local tweenInfo = TweenInfo.new(_delay, Enum.EasingStyle.Quad, Enum.EasingDirection.Out)
		local tween = ts:Create(part, tweenInfo, new)
		tween:Play()
	end

	local function ripple(button, x, y)
		spawn(function()
			button.ClipsDescendants = true
			local circle = Instance.new("ImageLabel")
			circle.Name = "Circle"
			circle.Parent = button
			circle.BackgroundColor3 = Color3.new(1, 1, 1)
			circle.BackgroundTransparency = 1
			circle.Image = "rbxassetid://266543268"
			circle.ImageTransparency = 0.5

			circle.Parent = button
			circle.ZIndex = 1000

			local new_x = x - circle.AbsolutePosition.X
			local new_y = y - circle.AbsolutePosition.Y
			circle.Position = UDim2.new(0, new_x, 0, new_y)

			local size = 0
			if button.AbsoluteSize.X > button.AbsoluteSize.Y then
				size = button.AbsoluteSize.X * 1.5
			elseif button.AbsoluteSize.X < button.AbsoluteSize.Y then
				size = button.AbsoluteSize.Y * 1.5
			elseif button.AbsoluteSize.X == button.AbsoluteSize.Y then
				size = button.AbsoluteSize.X * 1.5
			end

			circle:TweenSizeAndPosition(UDim2.new(0, size, 0, size), UDim2.new(0.5, -size / 2, 0.5, -size / 2), "Out", "Quad", 0.5, false, nil)
			Resize(circle, {ImageTransparency = 1}, 0.5)

			wait(0.5)
			circle:Destroy()
		end)
	end

	function window_data:Tab(options)
		local tab_data = {}
		sdata.tc += 1

		local PageData = Instance.new("ScrollingFrame")
		local tabholder = Instance.new("Frame")
		local tabcorner = Instance.new("UICorner")
		local clickabletabmat = Instance.new("TextButton")
		local builtimage = Instance.new("ImageLabel")
		local tabstroke = Instance.new("UIStroke")
		local pagelist = Instance.new("UIListLayout")

		PageData.Name = http:GenerateGUID(true)
		PageData.Parent = YZContents
		PageData.Active = false
		PageData.AnchorPoint = Vector2.new(0.5, 0.5)
		PageData.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		PageData.BackgroundTransparency = 1.000
		PageData.BorderColor3 = Color3.fromRGB(0, 0, 0)
		PageData.BorderSizePixel = 0
		PageData.Position = UDim2.new(0.5, 0, -0.515625, 0)
		PageData.Size = UDim2.new(0, 410, 0, 300)
		PageData.BottomImage = "rbxassetid://96871650232252"
		PageData.CanvasSize = UDim2.new(0, 0, 0, 0)
		PageData.ScrollBarThickness = 5
		PageData.TopImage = "rbxassetid://139269508434571"
		PageData.AutomaticCanvasSize = Enum.AutomaticSize.Y
		PageData.ScrollBarImageColor3 = Color3.fromRGB(0, 0, 0)

		tabholder.Name = http:GenerateGUID(true)
		tabholder.Parent = ScrollableTabHolder
		tabholder.BackgroundColor3 = Color3.fromRGB(18, 19, 18)
		tabholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
		tabholder.BorderSizePixel = 0
		tabholder.Position = UDim2.new(0.0541401282, 0, 0, 0)
		tabholder.Size = UDim2.new(0, 140, 0, 34)

		tabcorner.Name = http:GenerateGUID(true)
		tabcorner.Parent = tabholder

		clickabletabmat.Name = http:GenerateGUID(true)
		clickabletabmat.Parent = tabholder
		clickabletabmat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		clickabletabmat.BackgroundTransparency = 1.000
		clickabletabmat.BorderColor3 = Color3.fromRGB(0, 0, 0)
		clickabletabmat.BorderSizePixel = 0
		clickabletabmat.Position = UDim2.new(0.253571421, 0, 0, 0)
		clickabletabmat.Size = UDim2.new(0.746428549, 0, 1, 0)
		clickabletabmat.AutoButtonColor = false
		clickabletabmat.Font = Enum.Font.Arial
		clickabletabmat.Text = options.Title or "Untitled"
		clickabletabmat.TextColor3 = Color3.fromRGB(255, 255, 255)
		clickabletabmat.TextSize = 16.000
		clickabletabmat.TextXAlignment = Enum.TextXAlignment.Left

		builtimage.Name = http:GenerateGUID(true)
		builtimage.Parent = tabholder
		builtimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
		builtimage.BackgroundTransparency = 1.000
		builtimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
		builtimage.BorderSizePixel = 0
		builtimage.Position = UDim2.new(0.0642857179, 0, 0.235294119, 0)
		builtimage.Size = UDim2.new(0, 18, 0, 18)
		builtimage.Image = options.Image or "rbxassetid://70371576362667"

		tabstroke.Parent = tabholder
		tabstroke.Color = Color3.fromRGB(29, 29, 29)

		pagelist.Name = http:GenerateGUID(true)
		pagelist.Parent = PageData
		pagelist.SortOrder = Enum.SortOrder.LayoutOrder
		pagelist.HorizontalAlignment = Enum.HorizontalAlignment.Center
		pagelist.Padding = UDim.new(0, 4)

		local function tabdata_onclick()
			if sdata.lastselt then
				ts:Create(sdata.lastselt, TweenInfo.new(0.5, Enum.EasingStyle.Sine), {Position = UDim2.new(0.5, 0, 1.516, 0)}):Play()
				for i, v in ScrollableTabHolder:GetChildren() do
					if v:IsA("Frame") and v:FindFirstChildWhichIsA("UIStroke") then
						ts:Create(v:FindFirstChildWhichIsA("UIStroke"), TweenInfo.new(0.8, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(29, 29, 29)}):Play()
					end
				end

			end
			sdata.lastselt = PageData
			PageData.Position =  UDim2.new(0.5, 0, -0.516, 0)
			ts:Create(PageData, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {Position = UDim2.new(0.5, 0, 0.516, 0)}):Play()
			ts:Create(tabstroke, TweenInfo.new(0.8, Enum.EasingStyle.Quad), {Color = Color3.fromRGB(65, 66, 65)}):Play()
		end

		clickabletabmat.MouseButton1Click:Connect(tabdata_onclick)
		if sdata.tc == 1 then tabdata_onclick() end

		function tab_data:Toggle(options)
			local toggleframe = Instance.new("Frame")
			local togglecorner = Instance.new("UICorner")
			local togglename = Instance.new("TextLabel")
			local togglestroke = Instance.new("UIStroke")
			local toggler = Instance.new("Frame")
			local T_innercorner = Instance.new("UICorner")
			local T_clickablemat = Instance.new("TextButton")
			local T_innerstroke = Instance.new("UIStroke")

			toggleframe.Name = http:GenerateGUID(true)
			toggleframe.Parent = PageData
			toggleframe.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			toggleframe.BackgroundTransparency = 0.650
			toggleframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggleframe.BorderSizePixel = 0
			toggleframe.Position = UDim2.new(0.00609756075, 0, 0, 0)
			toggleframe.Size = UDim2.new(0, 399, 0, 40)

			togglecorner.CornerRadius = UDim.new(0, 6)
			togglecorner.Name = http:GenerateGUID(true)
			togglecorner.Parent = toggleframe

			togglename.Name = http:GenerateGUID(true)
			togglename.Parent = toggleframe
			togglename.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			togglename.BackgroundTransparency = 1.000
			togglename.BorderColor3 = Color3.fromRGB(0, 0, 0)
			togglename.BorderSizePixel = 0
			togglename.Position = UDim2.new(0.0271604937, 0, 0, 0)
			togglename.Size = UDim2.new(0, 200, 0, 40)
			togglename.Font = Enum.Font.Arial
			togglename.Text = options.Name
			togglename.TextColor3 = Color3.fromRGB(207, 207, 207)
			togglename.TextSize = 16.000
			togglename.TextXAlignment = Enum.TextXAlignment.Left

			togglestroke.Name = http:GenerateGUID(true)
			togglestroke.Parent = toggleframe
			togglestroke.Color = Color3.fromRGB(25, 25, 25)

			toggler.Name = http:GenerateGUID(true)
			toggler.Parent = toggleframe
			toggler.BackgroundColor3 = librsettings.ThemeColor
			toggler.BackgroundTransparency = 1
			toggler.BorderColor3 = Color3.fromRGB(0, 0, 0)
			toggler.BorderSizePixel = 0
			toggler.Position = UDim2.new(0.93580246, 0, 0.25, 0)
			toggler.Size = UDim2.new(0, 20, 0, 20)

			T_innercorner.CornerRadius = UDim.new(0, 4)
			T_innercorner.Name = http:GenerateGUID(true)
			T_innercorner.Parent = toggler

			T_innerstroke.Name = http:GenerateGUID(true)
			T_innerstroke.Parent = toggler
			T_innerstroke.Color = librsettings.Theme2
			T_innerstroke.Thickness = 1.3

			T_clickablemat.Name = http:GenerateGUID(true)
			T_clickablemat.Parent = toggler
			T_clickablemat.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			T_clickablemat.BackgroundTransparency = 1.000
			T_clickablemat.BorderColor3 = Color3.fromRGB(0, 0, 0)
			T_clickablemat.BorderSizePixel = 0
			T_clickablemat.Position = UDim2.new(-0.449999988, 0, -0.5, 0)
			T_clickablemat.Size = UDim2.new(0, 35, 0, 34)
			T_clickablemat.Font = Enum.Font.SourceSans
			T_clickablemat.Text = ""
			T_clickablemat.TextColor3 = Color3.fromRGB(0, 0, 0)
			T_clickablemat.TextSize = 14.000

			task.spawn(function()
				repeat
					T_innerstroke.Color = librsettings.Theme2
					toggler.BackgroundColor3 = librsettings.ThemeColor
					task.wait()
				until nil
			end)

			local Ltoggled = false

			function ontoggleclicked()
				Ltoggled = not Ltoggled
				ts:Create(toggler, TweenInfo.new(0.4, Enum.EasingStyle.Quint), {BackgroundTransparency = Ltoggled and 0 or 1}):Play()
				local suc, res = pcall(options.Callback, Ltoggled)
				if not suc and res then
					warn("[YZenium] ".. tostring(res))
				end
				if configfile then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					decodedsettings[options.Name.."Toggle"] = Ltoggled
					local encodedsettings = http:JSONEncode(decodedsettings)
					writefile(configfile, encodedsettings)
				end
			end

			T_clickablemat.MouseButton1Click:Connect(ontoggleclicked)
			if options.TrueByDefault then ontoggleclicked() end
			if readfile and isfile and configfile then
				if isfile(configfile) then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					if decodedsettings[options.Name.."Toggle"] then
						if not options.TrueByDefault then
							ontoggleclicked()
						end
					end
				end
			end
		end

		function tab_data:Button(options)
			local buttonframe = Instance.new("Frame")
			local buttoncorner = Instance.new("UICorner")
			local buttonname = Instance.new("TextLabel")
			local buttonimage = Instance.new("ImageLabel")
			local buttonclick = Instance.new("TextButton")
			local buttonstroke = Instance.new("UIStroke")

			buttonframe.Name = http:GenerateGUID(true)
			buttonframe.Parent = PageData
			buttonframe.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			buttonframe.BackgroundTransparency = 0.650
			buttonframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			buttonframe.BorderSizePixel = 0
			buttonframe.Position = UDim2.new(0.00609756075, 0, 0, 0)
			buttonframe.Size = UDim2.new(0, 399, 0, 40)

			buttoncorner.CornerRadius = UDim.new(0, 6)
			buttoncorner.Name = http:GenerateGUID(true)
			buttoncorner.Parent = buttonframe

			buttonname.Name = http:GenerateGUID(true)
			buttonname.Parent = buttonframe
			buttonname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			buttonname.BackgroundTransparency = 1.000
			buttonname.BorderColor3 = Color3.fromRGB(0, 0, 0)
			buttonname.BorderSizePixel = 0
			buttonname.Position = UDim2.new(0.0271604937, 0, 0, 0)
			buttonname.Size = UDim2.new(0, 200, 0, 40)
			buttonname.Font = Enum.Font.Arial
			buttonname.Text = options.Name
			buttonname.TextColor3 = Color3.fromRGB(207, 207, 207)
			buttonname.TextSize = 16.000
			buttonname.TextXAlignment = Enum.TextXAlignment.Left

			buttonimage.Name = http:GenerateGUID(true)
			buttonimage.Parent = buttonframe
			buttonimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			buttonimage.BackgroundTransparency = 1.000
			buttonimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			buttonimage.BorderSizePixel = 0
			buttonimage.Position = UDim2.new(0.930864215, 0, 0.224999994, 0)
			buttonimage.Size = UDim2.new(0, 22, 0, 22)
			buttonimage.Image = "rbxassetid://137310305826073"
			buttonimage.ImageColor3 = librsettings.ThemeColor

			buttonclick.Name = http:GenerateGUID(true)
			buttonclick.Parent = buttonframe
			buttonclick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			buttonclick.BackgroundTransparency = 1.000
			buttonclick.BorderColor3 = Color3.fromRGB(0, 0, 0)
			buttonclick.BorderSizePixel = 0
			buttonclick.Size = UDim2.new(1, 0, 1, 0)
			buttonclick.AutoButtonColor = false
			buttonclick.Font = Enum.Font.SourceSans
			buttonclick.Text = ""
			buttonclick.TextColor3 = Color3.fromRGB(0, 0, 0)
			buttonclick.TextSize = 14.000

			buttonstroke.Name = http:GenerateGUID(true)
			buttonstroke.Parent = buttonframe
			buttonstroke.Color = Color3.fromRGB(25, 25, 25)

			task.spawn(function()
				repeat
					buttonimage.ImageColor3 = librsettings.ThemeColor
					task.wait()
				until nil
			end)

			buttonclick.MouseButton1Click:Connect(function()
				local x, y = lp:GetMouse().X, lp:GetMouse().Y
				ripple(buttonframe, x, y)
				task.spawn(options.Callback)
			end)
		end

		function tab_data:Keybind(options)
			local keybindframe = Instance.new("Frame")
			local keybindcorner = Instance.new("UICorner")
			local keybindname = Instance.new("TextLabel")
			local keybindkeyholder = Instance.new("Frame")
			local waitforkey = Instance.new("TextButton")
			local kUICorner = Instance.new("UICorner")
			local keybindstroke = Instance.new("UIStroke")

			keybindframe.Name = http:GenerateGUID(true)
			keybindframe.Parent = PageData
			keybindframe.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			keybindframe.BackgroundTransparency = 0.650
			keybindframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			keybindframe.BorderSizePixel = 0
			keybindframe.Position = UDim2.new(0.00609756075, 0, 0, 0)
			keybindframe.Size = UDim2.new(0, 399, 0, 40)

			keybindcorner.CornerRadius = UDim.new(0, 6)
			keybindcorner.Name = http:GenerateGUID(true)
			keybindcorner.Parent = keybindframe

			keybindname.Name = http:GenerateGUID(true)
			keybindname.Parent = keybindframe
			keybindname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			keybindname.BackgroundTransparency = 1.000
			keybindname.BorderColor3 = Color3.fromRGB(0, 0, 0)
			keybindname.BorderSizePixel = 0
			keybindname.Position = UDim2.new(0.0271604937, 0, 0, 0)
			keybindname.Size = UDim2.new(0, 200, 0, 40)
			keybindname.Font = Enum.Font.Arial
			keybindname.Text = options.Name
			keybindname.TextColor3 = Color3.fromRGB(207, 207, 207)
			keybindname.TextSize = 16.000
			keybindname.TextXAlignment = Enum.TextXAlignment.Left

			keybindkeyholder.Name = http:GenerateGUID(true)
			keybindkeyholder.Parent = keybindframe
			keybindkeyholder.BackgroundColor3 = Color3.fromRGB(26, 26, 26)
			keybindkeyholder.BackgroundTransparency = 0.500
			keybindkeyholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			keybindkeyholder.BorderSizePixel = 0
			keybindkeyholder.Position = UDim2.new(0.693827152, 0, 0.200000003, 0)
			keybindkeyholder.Size = UDim2.new(0, 111, 0, 23)

			waitforkey.Name = http:GenerateGUID(true)
			waitforkey.Parent = keybindkeyholder
			waitforkey.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			waitforkey.BackgroundTransparency = 1.000
			waitforkey.BorderColor3 = Color3.fromRGB(0, 0, 0)
			waitforkey.BorderSizePixel = 0
			waitforkey.Size = UDim2.new(1, 0, 1, 0)
			waitforkey.Font = Enum.Font.SourceSans
			waitforkey.Text = "None"
			waitforkey.TextColor3 = librsettings.ThemeColor
			waitforkey.TextSize = 19.000
			waitforkey.TextWrapped = true

			kUICorner.CornerRadius = UDim.new(0, 4)
			kUICorner.Parent = keybindkeyholder

			keybindstroke.Name = http:GenerateGUID(true)
			keybindstroke.Parent = keybindframe
			keybindstroke.Color = Color3.fromRGB(25, 25, 25)

			task.spawn(function()
				repeat
					waitforkey.TextColor3 = librsettings.ThemeColor
					task.wait()
				until nil
			end)

			local keykeyuwu = nil
			local cumconnection = nil
			local function setkeybind(keycode)
				if keycode ~= "Unknown" then
					if cumconnection then
						cumconnection:Disconnect()
					end
					cumconnection = uis.InputBegan:Connect(function(keycode, gpe)
						if uis:GetFocusedTextBox() then return end
						if not keykeyuwu then return end
						if keycode.KeyCode == Enum.KeyCode[keykeyuwu] then
							options.Callback()
						end
					end)
					keykeyuwu = Enum.KeyCode[keycode].Name
					waitforkey.Text = keycode
					if configfile then
						local decodedsettings = http:JSONDecode(readfile(configfile))
						decodedsettings[options.Name.."Keybind"] = keycode
						local encodedsettings = http:JSONEncode(decodedsettings)
						writefile(configfile, encodedsettings)
					end
				end
			end
			waitforkey.MouseButton1Click:Connect(function()
				waitforkey.Text = "..."
				local keycode, gpe = uis.InputBegan:Wait()
				setkeybind(keycode.KeyCode.Name)
			end)

			if readfile and isfile and configfile then
				if isfile(configfile) then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					if decodedsettings[options.Name.."Keybind"] then
						setkeybind(decodedsettings[options.Name.."Keybind"])
					end
				end
			end
		end

		function tab_data:Slider(options)
			local sliderframe = Instance.new("Frame")
			local slidercorner = Instance.new("UICorner")
			local slidername = Instance.new("TextLabel")
			local sliderinputholder = Instance.new("Frame")
			local Amount = Instance.new("TextBox")
			local indic = Instance.new("Frame")
			local indiccorner = Instance.new("UICorner")
			local indiccorner2 = Instance.new("UICorner")
			local samnt = Instance.new("Frame")
			local sliderstroke = Instance.new("UIStroke")
			local holdtoinput = Instance.new("TextButton")

			sliderframe.Name = http:GenerateGUID(true)
			sliderframe.Parent = PageData
			sliderframe.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			sliderframe.BackgroundTransparency = 0.650
			sliderframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			sliderframe.BorderSizePixel = 0
			sliderframe.Position = UDim2.new(0.00609756075, 0, 0, 0)
			sliderframe.Size = UDim2.new(0, 399, 0, 40)

			slidercorner.CornerRadius = UDim.new(0, 6)
			slidercorner.Name = http:GenerateGUID(true)
			slidercorner.Parent = sliderframe

			slidername.Name = http:GenerateGUID(true)
			slidername.Parent = sliderframe
			slidername.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			slidername.BackgroundTransparency = 1.000
			slidername.BorderColor3 = Color3.fromRGB(0, 0, 0)
			slidername.BorderSizePixel = 0
			slidername.Position = UDim2.new(0.0271604937, 0, 0, 0)
			slidername.Size = UDim2.new(0, 200, 0, 40)
			slidername.Font = Enum.Font.Arial
			slidername.Text = options.Name
			slidername.TextColor3 = Color3.fromRGB(207, 207, 207)
			slidername.TextSize = 16.000
			slidername.TextXAlignment = Enum.TextXAlignment.Left

			sliderinputholder.Name = http:GenerateGUID(true)
			sliderinputholder.Parent = sliderframe
			sliderinputholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			sliderinputholder.BackgroundTransparency = 1.000
			sliderinputholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			sliderinputholder.BorderSizePixel = 0
			sliderinputholder.Position = UDim2.new(0.52098763, 0, 0.175000757, 0)
			sliderinputholder.Size = UDim2.new(0, 180, 0, 25)

			Amount.Name = http:GenerateGUID(true)
			Amount.Parent = sliderinputholder
			Amount.AnchorPoint = Vector2.new(1, 0)
			Amount.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			Amount.BackgroundTransparency = 1.000
			Amount.BorderColor3 = Color3.fromRGB(0, 0, 0)
			Amount.BorderSizePixel = 0
			Amount.Position = UDim2.new(0, 0, 0.16, 0)
			Amount.Size = UDim2.new(0, 66, 0, 17)
			Amount.Font = Enum.Font.Arial
			Amount.Text = options.min
			Amount.TextColor3 = librsettings.ThemeColor
			Amount.TextSize = 14.000
			Amount.TextXAlignment = Enum.TextXAlignment.Right
			Amount.ClearTextOnFocus = false

			indic.Name = http:GenerateGUID(true)
			indic.Parent = sliderinputholder
			indic.AnchorPoint = Vector2.new(0.5, 0.5)
			indic.BackgroundColor3 = Color3.fromRGB(31, 31, 31)
			indic.BackgroundTransparency = 0.500
			indic.BorderColor3 = Color3.fromRGB(0, 0, 0)
			indic.BorderSizePixel = 0
			indic.ClipsDescendants = true
			indic.Position = UDim2.new(0.524999976, 0, 0.5, 0)
			indic.Size = UDim2.new(0, 173, 0, 7)

			indiccorner.CornerRadius = UDim.new(1, 0)
			indiccorner.Name = http:GenerateGUID(true)
			indiccorner.Parent = indic

			indiccorner2.CornerRadius = UDim.new(1, 0)
			indiccorner2.Name = http:GenerateGUID(true)
			indiccorner2.Parent = samnt

			samnt.Name = http:GenerateGUID(true)
			samnt.Parent = indic
			samnt.BackgroundColor3 = librsettings.ThemeColor
			samnt.BorderColor3 = Color3.fromRGB(0, 0, 0)
			samnt.BorderSizePixel = 0
			samnt.Size = UDim2.new(0, 0, 1, 0)

			sliderstroke.Name = http:GenerateGUID(true)
			sliderstroke.Parent = sliderframe
			sliderstroke.Color = Color3.fromRGB(25, 25, 25)

			holdtoinput.Name = http:GenerateGUID(true)
			holdtoinput.Parent = indic
			holdtoinput.Size = UDim2.new(1, 0, 1, 0)
			holdtoinput.ZIndex = 2
			holdtoinput.Text = ""
			holdtoinput.BackgroundTransparency = 1

			local lastvalue = 0
			local dragging = false

			local function setslider(newv)
				local per = math.clamp((newv - options.min) / (options.max - options.min), 0, 1)
				Amount.Size = UDim2.new(0, Amount.TextBounds.X, 0, 17)
				Amount.Text = tostring(math.round(newv))
				ts:Create(samnt, TweenInfo.new(0.17, Enum.EasingStyle.Sine), {Size = UDim2.new(per, 0, 1, 0)}):Play()
				if configfile then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					decodedsettings[options.Name.."Slider"] = newv
					local encodedsettings = http:JSONEncode(decodedsettings)
					writefile(configfile, encodedsettings) -- it will be laggy, but whatever, if you know a better way (i already do but i dont wanna do it) then TELL ME
				end
				options.Callback(math.round(newv))
			end

			holdtoinput.MouseButton1Down:Connect(function()
				dragging = true
				task.spawn(function()
					while dragging do
						local newsize = math.clamp((lp:GetMouse().X-indic.AbsolutePosition.X)/indic.AbsoluteSize.X,0,1)
						local value = options.min + (newsize * (options.max - options.min))
						if value ~= lastvalue then -- prevent callbacking same value for no reason
							lastvalue = value
							setslider(lastvalue)
						end
						ts:Create(samnt, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = UDim2.new(newsize, 0, 1, 0)}):Play()
						task.wait()
					end
				end)
			end)

			Amount.FocusLost:Connect(function()
				if tonumber(Amount.Text) then
					setslider(tonumber(Amount.Text))
				end
			end)

			holdtoinput.MouseButton1Up:Connect(function() -- mobile users
				dragging = false
			end)

			uis.InputEnded:Connect(function(state, gpe)
				if state.UserInputType == Enum.UserInputType.MouseButton1 then
					dragging = false
				end
			end)

			if readfile and isfile and configfile then
				if isfile(configfile) then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					if decodedsettings[options.Name.."Slider"] then
						setslider(decodedsettings[options.Name.."Slider"])
					end
				end
			end

			task.spawn(function()
				repeat
					Amount.TextColor3 = librsettings.ThemeColor
					samnt.BackgroundColor3 = librsettings.ThemeColor
					task.wait()
				until nil
			end)
		end

		function tab_data:Dropdown(options)
			local dropdown_data = {}

			local dropdownframe = Instance.new("Frame")
			local dropdowncorner = Instance.new("UICorner")
			local dropdownname = Instance.new("TextLabel")
			local dropdownimage = Instance.new("ImageLabel")
			local dropdownclick = Instance.new("TextButton")
			local dropdownscrollholder = Instance.new("Frame")
			local dropdownholder = Instance.new("ScrollingFrame")
			local dropdownlayout = Instance.new("UIListLayout")
			local dropdownstroke = Instance.new("UIStroke")
			local clickabledropdownmat = Instance.new("TextButton")

			dropdownframe.Name = http:GenerateGUID(true)
			dropdownframe.Parent = PageData
			dropdownframe.BackgroundColor3 = Color3.fromRGB(22, 22, 22)
			dropdownframe.BackgroundTransparency = 0.650
			dropdownframe.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownframe.BorderSizePixel = 0
			dropdownframe.Position = UDim2.new(0.00609756075, 0, 0.586666644, 0)
			dropdownframe.Size = UDim2.new(0, 399, 0, 40)

			dropdowncorner.CornerRadius = UDim.new(0, 6)
			dropdowncorner.Name = http:GenerateGUID(true)
			dropdowncorner.Parent = dropdownframe

			dropdownname.Name = http:GenerateGUID(true)
			dropdownname.Parent = dropdownframe
			dropdownname.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownname.BackgroundTransparency = 1.000
			dropdownname.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownname.BorderSizePixel = 0
			dropdownname.Position = UDim2.new(0.0271604937, 0, 0, 0)
			dropdownname.Size = UDim2.new(0, 200, 0, 40)
			dropdownname.Font = Enum.Font.Arial
			dropdownname.Text = options.Name
			dropdownname.TextColor3 = Color3.fromRGB(207, 207, 207)
			dropdownname.TextSize = 16.000
			dropdownname.TextXAlignment = Enum.TextXAlignment.Left

			dropdownimage.Name = http:GenerateGUID(true)
			dropdownimage.Parent = dropdownframe
			dropdownimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownimage.BackgroundTransparency = 1.000
			dropdownimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownimage.BorderSizePixel = 0
			dropdownimage.Position = UDim2.new(0, 377, 0, 8)
			dropdownimage.Size = UDim2.new(0, 22, 0, 22)
			dropdownimage.Image = "rbxassetid://100109631403827"
			dropdownimage.ImageColor3 = librsettings.ThemeColor

			dropdownclick.Name = http:GenerateGUID(true)
			dropdownclick.Parent = dropdownframe
			dropdownclick.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownclick.BackgroundTransparency = 1.000
			dropdownclick.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownclick.BorderSizePixel = 0
			dropdownclick.Size = UDim2.new(1, 0, 1, 0)
			dropdownclick.AutoButtonColor = false
			dropdownclick.Font = Enum.Font.SourceSans
			dropdownclick.Text = ""
			dropdownclick.TextColor3 = Color3.fromRGB(0, 0, 0)
			dropdownclick.TextSize = 14.000

			dropdownscrollholder.Name = http:GenerateGUID(true)
			dropdownscrollholder.Parent = dropdownframe
			dropdownscrollholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownscrollholder.BackgroundTransparency = 1.000
			dropdownscrollholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownscrollholder.BorderSizePixel = 0
			dropdownscrollholder.ClipsDescendants = true
			dropdownscrollholder.Position = UDim2.new(0.0270000007, 0, 0.246999994, 0)
			dropdownscrollholder.Size = UDim2.new(0, 381, 0, 100)
			dropdownscrollholder.Visible = false

			dropdownholder.Name = http:GenerateGUID(true)
			dropdownholder.Parent = dropdownscrollholder
			dropdownholder.Active = true
			dropdownholder.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			dropdownholder.BackgroundTransparency = 1.000
			dropdownholder.BorderColor3 = Color3.fromRGB(0, 0, 0)
			dropdownholder.BorderSizePixel = 0
			dropdownholder.ClipsDescendants = false
			dropdownholder.Position = UDim2.new(0, 0, 0.0393798836, 0)
			dropdownholder.Size = UDim2.new(1, 0, 0.900620103, 0)
			dropdownholder.BottomImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			dropdownholder.CanvasSize = UDim2.new(0, 0, 0, 0)
			dropdownholder.ScrollBarThickness = 4
			dropdownholder.TopImage = "rbxasset://textures/ui/Scroll/scroll-middle.png"
			dropdownholder.AutomaticCanvasSize = Enum.AutomaticSize.Y

			dropdownlayout.Name = http:GenerateGUID(true)
			dropdownlayout.Parent = dropdownholder
			dropdownlayout.HorizontalAlignment = Enum.HorizontalAlignment.Center
			dropdownlayout.SortOrder = Enum.SortOrder.LayoutOrder
			dropdownlayout.Padding = UDim.new(0, 5)

			dropdownstroke.Name = http:GenerateGUID(true)
			dropdownstroke.Parent = dropdownframe
			dropdownstroke.Color = Color3.fromRGB(25, 25, 25)

			clickabledropdownmat.Parent = dropdownframe
			clickabledropdownmat.Name = http:GenerateGUID(true)
			clickabledropdownmat.Text = ""
			clickabledropdownmat.BackgroundTransparency = 1
			clickabledropdownmat.ZIndex = 2
			clickabledropdownmat.Size = UDim2.new(1, 0, 0, 40)

			local dropdownisopenuwu = false

			local function fuckthedropdown()
				for i, v in dropdownholder:GetChildren() do
					if v:IsA("TextButton") and v:FindFirstChildWhichIsA("UIStroke") then
						v.UIStroke.Color = librsettings.ThemeColor
					end
				end
				dropdownisopenuwu = not dropdownisopenuwu
				ts:Create(dropdownframe, TweenInfo.new(0.3, Enum.EasingStyle.Sine), {Size = dropdownisopenuwu and UDim2.new(0, 399, 0, 147) or UDim2.new(0, 399, 0, 40)}):Play()
				task.spawn(function()
					task.wait(0.28)
					dropdownscrollholder.Visible = dropdownisopenuwu
				end)
			end

			task.spawn(function()
				repeat
					dropdownimage.ImageColor3 = librsettings.ThemeColor
					task.wait()
				until nil
			end)

			clickabledropdownmat.MouseButton1Click:Connect(fuckthedropdown)

			function dropdown_data:Refresh(list)
				local susvar = 0
				for i, v in dropdownholder:GetChildren() do
					if v:IsA("TextButton") then
						v:Destroy()
					end
				end
				for i, v in list do
					susvar += 1
					local dropdownitem = Instance.new("TextButton")
					local itemcorner = Instance.new("UICorner")
					local numberiam = Instance.new("TextLabel")
					local itemstroke = Instance.new("UIStroke")

					dropdownitem.Name = http:GenerateGUID(true)
					dropdownitem.Parent = dropdownholder
					dropdownitem.BackgroundColor3 = Color3.fromRGB(226, 226, 226)
					dropdownitem.BackgroundTransparency = 1.000
					dropdownitem.BorderColor3 = Color3.fromRGB(0, 0, 0)
					dropdownitem.BorderSizePixel = 0
					dropdownitem.Position = UDim2.new(0.0183727033, 0, 0, 0)
					dropdownitem.Size = UDim2.new(0, 367, 0, 28)
					dropdownitem.Font = Enum.Font.Arial
					dropdownitem.Text = tostring(v).."  "
					dropdownitem.TextColor3 = Color3.fromRGB(207, 207, 207)
					dropdownitem.TextSize = 14.000

					itemcorner.Name = http:GenerateGUID(true)
					itemcorner.Parent = dropdownitem

					numberiam.Name = http:GenerateGUID(true)
					numberiam.Parent = dropdownitem
					numberiam.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
					numberiam.BackgroundTransparency = 1.000
					numberiam.BorderColor3 = Color3.fromRGB(0, 0, 0)
					numberiam.BorderSizePixel = 0
					numberiam.Position = UDim2.new(0.0299727526, 0, 0, 0)
					numberiam.Size = UDim2.new(0, 73, 0, 28)
					numberiam.Font = Enum.Font.Arial
					numberiam.Text = tostring(susvar)
					numberiam.TextColor3 = Color3.fromRGB(156, 156, 156)
					numberiam.TextSize = 14.000
					numberiam.TextXAlignment = Enum.TextXAlignment.Left

					itemstroke.Parent = dropdownitem
					itemstroke.ApplyStrokeMode = Enum.ApplyStrokeMode.Border
					itemstroke.Color = librsettings.Theme2

					dropdownitem.MouseButton1Click:Connect(function()
						dropdownname.Text = options.Name .. " - " .. tostring(v)
						task.spawn(fuckthedropdown)
						task.spawn(options.Callback, v)
						if configfile and (type(v) == "string" or type(v) == "number") then
							local decodedsettings = http:JSONDecode(readfile(configfile))
							decodedsettings[options.Name.."DropdownValue"] = v
							local encodedsettings = http:JSONEncode(decodedsettings)
							writefile(configfile, encodedsettings)
						end
					end)
				end
			end

			if readfile and isfile and configfile then
				if isfile(configfile) then
					local decodedsettings = http:JSONDecode(readfile(configfile))
					if decodedsettings[options.Name.."DropdownValue"] then
						if not options.dontsave then
							if type(options.Name.."DropdownValue") == "string" or type(options.Name.."DropdownValue") == "number" then
								options.Callback(options.Name.."DropdownValue")
							end
						end
					end
				end
			end

			dropdown_data:Refresh(options.List)

			return dropdown_data
		end

		function tab_data:Divider(name)
			local divider = Instance.new("Frame")
			local folderimage = Instance.new("ImageLabel")
			local foldername = Instance.new("TextLabel")

			divider.Name = http:GenerateGUID(true)
			divider.Parent = PageData
			divider.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			divider.BackgroundTransparency = 1.000
			divider.BorderColor3 = Color3.fromRGB(0, 0, 0)
			divider.BorderSizePixel = 0
			divider.Position = UDim2.new(-0.0109756095, 0, 0.733333349, 0)
			divider.Size = UDim2.new(0, 412, 0, 22)

			folderimage.Name = http:GenerateGUID(true)
			folderimage.Parent = divider
			folderimage.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			folderimage.BackgroundTransparency = 1.000
			folderimage.BorderColor3 = Color3.fromRGB(0, 0, 0)
			folderimage.BorderSizePixel = 0
			folderimage.Size = UDim2.new(0, 21, 0, 21)
			folderimage.Image = "rbxassetid://115701292550332"

			foldername.Name = http:GenerateGUID(true)
			foldername.Parent = divider
			foldername.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
			foldername.BackgroundTransparency = 1.000
			foldername.BorderColor3 = Color3.fromRGB(0, 0, 0)
			foldername.BorderSizePixel = 0
			foldername.Position = UDim2.new(0.0739856809, 0, 0.181818187, 0)
			foldername.Size = UDim2.new(0, 200, 0, 17)
			foldername.Font = Enum.Font.Arial
			foldername.Text = name
			foldername.TextColor3 = Color3.fromRGB(255, 255, 255)
			foldername.TextScaled = true
			foldername.TextSize = 14.000
			foldername.TextWrapped = true
			foldername.TextXAlignment = Enum.TextXAlignment.Left
		end

		return tab_data
	end

	return window_data
end

if not studio then -- // Init
	--return gdata
end

MainWindow = gdata:Window({
	GameName = "Risky Haul",
	Title = "秋枫汉化"
})

Stuff = MainWindow:Tab({Title = "材料", Image = "rbxassetid://133515989982114"})
Crates = MainWindow:Tab({Title = "性", Image = "rbxassetid://118160654844398"})
World = MainWindow:Tab({Title = "世界", Image = "rbxassetid://86004623527145"})
Settings = MainWindow:Tab({Title = "库", Image = "rbxassetid://93373207940848"})

Stuff:Divider("普通")

local FuelValueChanged = nil
local skibidi1 = false
local cargosellpoint = loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/riskyhaulscript/refs/heads/main/somestuff/cargosellpoint"))()

local function tweenroot(time,pos)
    game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.HumanoidRootPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = pos}):Play()
end

local function tweencar(time,pos)
    game:GetService("TweenService"):Create(game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart, TweenInfo.new(time, Enum.EasingStyle.Linear), {CFrame = pos}):Play()
end

local function ischar()
    if game:GetService("Players").LocalPlayer.Character then
        if game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
            return true
        end
    end
end
local function GetFuelUwU()
	game.Players.LocalPlayer.PlayerScripts["Launch/Drive"].FuelLevel.Value = 333333333
	--game:GetService("Players").LocalPlayer.PlayerGui.Fuel.CanvasGroup.FuelText.Text = "Fuel: infinite :3"
end
local function LoseFuelO_O()
	game.Players.LocalPlayer.PlayerScripts["Launch/Drive"].FuelLevel.Value = 25
	--game:GetService("Players").LocalPlayer.PlayerGui.Fuel.CanvasGroup.FuelText.Text = "Fuel: 25"
end
Stuff:Toggle({Name = "无限燃料", Callback = function(state)
	if state then
		GetFuelUwU()
		FuelValueChanged = game.Players.LocalPlayer.PlayerScripts["Launch/Drive"].FuelLevel:GetPropertyChangedSignal("Value"):Connect(GetFuelUwU)
	elseif not state and FuelValueChanged then
		LoseFuelO_O()
		FuelValueChanged:Disconnect()
	end
end})
Stuff:Divider("改车")
Stuff:Slider({Name = "起始加速度(km/H)", Callback = function (v)
	game:GetService("ReplicatedStorage").EngineConfig.Engine.AccelerationBoost.Value = v
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].AccelerationBoost.Value = v
end, min = 1, max = 1000})
Stuff:Slider({Name = "燃料量(ml)", Callback = function (v)
	game:GetService("ReplicatedStorage").EngineConfig.Engine.FuelUsage.Value = v
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].AccelerationBoost.Value = v
end, min = 1, max = 1000})
Stuff:Slider({Name = "最大速度", Callback = function (v)
	game:GetService("ReplicatedStorage").EngineConfig.Engine.MaxSpeedBoost.Value = v
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].MaxSpeedBoost.Value = v
end, min = 1, max = 7500})
Stuff:Slider({Name = "扭矩提升", Callback = function (v)
	game:GetService("ReplicatedStorage").EngineConfig.Engine.TorqueBoost.Value = v
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].TorqueBoost.Value = v
end, min = 10000, max = 250000})
Stuff:Button({Name = "重置默认值", Callback = function()
	game:GetService("ReplicatedStorage").EngineConfig.Engine.TorqueBoost.Value = 10000
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].TorqueBoost.Value = 15000

	game:GetService("ReplicatedStorage").EngineConfig.Engine.MaxSpeedBoost.Value = 2
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].MaxSpeedBoost.Value = 3

	game:GetService("ReplicatedStorage").EngineConfig.Engine.FuelUsage.Value = 1
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].AccelerationBoost.Value = 1.25

	game:GetService("ReplicatedStorage").EngineConfig.Engine.AccelerationBoost.Value = 1
	game:GetService("ReplicatedStorage").EngineConfig["Diesel Engine"].AccelerationBoost.Value = 1.25
	yznotify("Reset to defaults")
end})

local winspeed = 100
Stuff:Divider("自动运行")
Stuff:Slider({Name = "胜利速度", Callback = function(v)
	winspeed = v
end, min = 100, max = 800})
Stuff:Button({Name = "传送最好的卖点", Callback = function()
	-- "its kinda bad, the auto farm doesnt work, and speed and things make me get flinged."
	if not game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart then
		return game.StarterGui:SetCore("SendNotification", {
			 Title = "您未上车",Text="请上车使用",
			 Duration = 4
		});
	end
	game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.CFrame = CFrame.new(57.267025, 44.5856285, -171.732178, -0.999935448, -1.00159582e-07, -0.0113605559, -1.01334564e-07, 1, 1.02850514e-07, 0.0113605559, 1.03995092e-07, -0.999935448)
	tweencar(100 / (winspeed / 100), cargosellpoint)
end}) -- go win
Stuff:Toggle({Name = "如果出现问题请按我", Callback = function(state)
	skibidi1 = state
end})
Stuff:Divider("Discord")
Stuff:Button({Name = "复制 ID(discord)", Callback = function() setclipboard("1215375161121833063") end})
Stuff:Button({Name = "复制discord链接和id", Callback = function() setclipboard("https://discord.gg/risky-haul-1264916236236619857") end})
Stuff:Button({Name = "复制QQ群(我的)", Callback = function() setclipboard("884776077") end})

local iwannabuythis = nil
local iwannabuythis2 = nil
local howfuckingmany = 1
local pwices = {
	["Functional"] = {
		["Grass"] = 250,
		["Cave"] = 900,
		["Tundra"] = 2000
	},
	["Structural"] = {
		["Grass"] = 150,
		["Cave"] = 650,
		["Tundra"] = 1350
	}
}
local function BuyAFuckingCrate(crate, biome)
	game:GetService("ReplicatedStorage").RemoteEvents.ChestEvents.PurchaseChest:FireServer(crate .. " Chest", biome .. " Biome")
end

Crates:Divider("箱子")
Crates:Dropdown({Name = "箱子种类", List = {"正常", "疯狂"}, Callback = function(v)
	iwannabuythis = v
end})
Crates:Dropdown({Name = "生物群落", List = {"Grass", "Cave", "Tundra"}, Callback = function(v)
	iwannabuythis2 = v
end})
Crates:Slider({Name = "综合", Callback = function(v)
	howfuckingmany = v
end, min = 1, max = 1000})
Crates:Button({Name = "自动买箱子", Callback = function()
	if not iwannabuythis then yznotify("您没选种类") return end
	if not iwannabuythis2 then yznotify("您没在群落") return end
	local meth = (pwices[iwannabuythis][iwannabuythis2])*howfuckingmany
	if game:GetService("Players").LocalPlayer.leaderstats["Stud Bucks"].Value < meth then
		yznotify("您没钱玩这个游戏您 需要:	" .. tostring(math.round(meth)) .. " 元才可以玩.")
		return
	end
	for i = 1, howfuckingmany do
		BuyAFuckingCrate(iwannabuythis, iwannabuythis2)
	end
	yznotify("你买了一个箱子")
end})
Crates:Divider("帮助")
Crates:Button({Name = "估算东西", Callback = function()
	if not iwannabuythis then yznotify("请选箱子") return end
	if not iwannabuythis2 then yznotify("请选生物群落") return end
	local meth = (pwices[iwannabuythis][iwannabuythis2])*howfuckingmany
	yznotify("你需要 约" .. tostring(math.round(meth)) .. " 元来买 "..howfuckingmany.." 箱子")
end})

local thetheme = nil
Settings:Divider("主题")
Settings:Dropdown({Name = "选择", List = {"红", "蓝", "青"}, Callback = function(v) thetheme = v end})
Settings:Button({Name = "设置主题", Callback = function()
	if not thetheme then yznotify("请选择一个主题") return end
	if writefile then
		writefile("komaruthemeuwu", thetheme)
	end
	gdata:LoadPresetTheme(thetheme)
end})
local CopyCharactersFolder = Instance.new("Folder", game.Lighting) -- bro is using the second arugment of instance.new 💀💀 what an npc
World:Divider("世界")
World:Toggle({Name = "隐藏ui", Callback = function(state)
	if state then
		for i, v in game.Workspace.CharactersFolder:GetChildren() do
			if v ~= game.Players.LocalPlayer.Character then
				v.Parent = CopyCharactersFolder
			end
		end
	else
		for i, v in CopyCharactersFolder:GetChildren() do
			v.Parent = game.Workspace.CharactersFolder
		end
	end
end})
World:Button({Name = "清除障碍物(半个)", Callback = function()
	for i, v in workspace.Map.Road:GetChildren() do
		if v:IsA("Model") and v.Name:find("RoadLane") then
			for ii, vv in v:FindFirstChild("Obstacles"):GetChildren() do
				vv:Destroy()
			end
		end
	end
	for n, x in workspace.Map.Nature.Flowers:GetChildren() do
		for i, v in x:GetChildren() do
			if v:IsA("Part") then
				v:Destroy()
			end
		end
	end
end})
World:Divider("玩家")
World:Slider({Name = "速度", Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = v end, min = 16, max = 300})
World:Slider({Name = "跳跃", Callback = function(v) game.Players.LocalPlayer.Character.Humanoid.JumpPower = v end, min = 50, max = 300})
World:Keybind({Name = "界面键盘", Callback = function() game.Players.LocalPlayer.Character:BreakJoints() end})

-- // loops here

task.spawn(function()
    repeat
        if skibidi1 then
            if ischar() then
                if game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart then
                    game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.Velocity = Vector3.new(game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.Velocity.X, 0, game:GetService("Players").LocalPlayer.Character.Humanoid.SeatPart.Velocity.Z)
                end
            end
        end
        if skibidi2 then
            game:GetService("ReplicatedStorage").RemoteEvents.SellCargo:FireServer()
        end
        task.wait()
    until nil
end)

-- // loops end

yznotify("Made by apnff0x on discord!")

-- This part is specifically obfuscated because i dont want my webhook getting spammed, sorry! (its the feedback section)
_G.YZSETTINGS = Settings
_G.YZNOTIFY = yznotify
loadstring(game:HttpGet("https://raw.githubusercontent.com/railme37509124/weqwdsadasdsa/refs/heads/main/feedbackmenu", true))()