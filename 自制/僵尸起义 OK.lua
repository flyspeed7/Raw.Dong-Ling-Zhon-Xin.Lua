kVars = {}
kVars.WindowName = "Zombie Uprising GUI"
kVars.placeID = 4972091010
kVars.lp = game:GetService('Players').LocalPlayer
kVars.vu = game:GetService('VirtualUser')
kVars.uis = game:GetService('UserInputService')
kVars.rs = game:GetService('ReplicatedStorage')
kVars.humanoid = kVars.lp.Character:WaitForChild('Humanoid')
kVars.hrp = kVars.lp.Character:WaitForChild('HumanoidRootPart')

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

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()

local win = lib:Window("Y&F | 僵尸起义",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E) -- your own keybind 

local tab = win:Tab("主要")



function obscured(part)
    local castPoints = {game:GetService("Workspace").CurrentCamera.CFrame.Position, part.CFrame.Position}
    local ignoreList = {}
    local obscure = workspace.CurrentCamera:GetPartsObscuringTarget(castPoints, ignoreList)
    return next(obscure) ~= nil
end

----========== page main ==========----
---- section aimbot ----
game.Players.LocalPlayer.CameraMode = "Classic"
kVars.boolAimBot = false

tab:Toggle("子弹范围", false, function(bool)
    kVars.boolAimBot = bool
end,{default = kVars.boolAimBot})

kVars.closestZombie = nil
function fGetClosest()
    spawn(function()
        while task.wait() do
            local last = math.huge
            local ZombiesList = game:GetService("Workspace").Zombies:GetChildren()
            if next(ZombiesList) ~= nil then
                for i,v in pairs(ZombiesList) do
                    if v:FindFirstChild("HumanoidRootPart") and v:FindFirstChild("Humanoid") then
                        if v.Humanoid.Health ~= 0 then
                            if obscured(v.Head) == false then
                                local distance = (kVars.lp.Character.HumanoidRootPart.Position - v.Head.Position).magnitude
                                if distance < last then
                                    last = distance
                                    kVars.closestZombie = v
                                end 
                            elseif obscured(v.HumanoidRootPart) == false then
                                local distance = (kVars.lp.Character.HumanoidRootPart.Position - v.HumanoidRootPart.Position).magnitude
                                if distance < last then
                                    last = distance
                                    kVars.closestZombie = v
                                end
                            end
                        end
                    end
                end
            else
                kVars.closestZombie = nil
            end
        end
    end)
end
fGetClosest()


kVars.mouseButton1Down = false
function fAimBot()
    spawn(function()
        local ignoreList = {}
        while task.wait()  do -- aimbot toggle is on   
            if kVars.boolLeftControl and kVars.closestZombie ~= nil and kVars.boolAimBot then -- pressing left control
                local closest = kVars.closestZombie
                game.Players.LocalPlayer.CameraMode = "LockFirstPerson"
                if closest ~= nil then
                    repeat
                        wait()
                        local part = nil
                        if closest:FindFirstChild("Head") then
                            game:GetService("Workspace").CurrentCamera.CFrame = CFrame.lookAt(game:GetService("Workspace").CurrentCamera.CFrame.Position, closest.Head.CFrame.Position)
                            part = closest.Head
                            
                        elseif closest:FindFirstChild("HumanoidRootPart") then
                            game:GetService("Workspace").CurrentCamera.CFrame = CFrame.lookAt(game:GetService("Workspace").CurrentCamera.CFrame.Position, closest.HumanoidRootPart.CFrame.Position)
                            part = closest.HumanoidRootPart
                        end
                        if kVars.boolTriggerBot then
                            mouse1press()
                        end
                    until not closest:FindFirstChild("Humanoid") or closest == nil or closest.Humanoid.Health == 0 or kVars.boolAimBot == false or kVars.boolLeftControl == false or obscured(part) or part == nil
                    --kVars.closestZombie = nil
                    mouse1release()
                end
            end
        end
    end)
end
fAimBot()

kVars.UIS = game:GetService("UserInputService").InputBegan:Connect(function(input)
    --[[if game:GetService("Workspace").Ignore:FindFirstChild("Map") then 
        for i,v in pairs(game:GetService("Workspace").Ignore.Map:GetChildren()) do
            v:Destroy()
        end
        game:GetService("Workspace").Ignore.Map:Destroy()
    end]]--
    --[[if game:GetService("Workspace").Map:FindFirstChild("Boundaries") then
        for i,v in pairs(game:GetService("Workspace").Map.Boundaries:GetChildren()) do
            v:Destroy()
        end
    end]]--
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        
            kVars.boolLeftControl = true
            kVars.lp.CameraMode = "LockFirstPerson"
        
    end
end)

kVars.UISEnd = game:GetService("UserInputService").InputEnded:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton2 then
        
            kVars.boolLeftControl = false
        
    end
end)

kVars.boolTriggerBot = false
tab:Toggle("机器人模式", false, function(bool)
    kVars.boolTriggerBot = bool
    --[[if bool then
        fTriggerBot()
    end]]--
end,{default = kVars.boolTriggerBot})

function fTriggerBot()
    spawn(function()
        local mouseD = false
        while kVars.boolTriggerBot do
            task.wait()
            local mouse = kVars.lp:GetMouse()
            if mouse ~= nil then
                if mouse.Target ~= nil then
                    print(mouse.Target:GetFullName())
                    if string.find(string.lower(mouse.Target:GetFullName()), "zombie") then
                    
                        mouse1press()  
                        mouseD = true
                    else
                        mouse1release()
                        mouseD = false
                    end

                end
            end
            
        end
    end)
end

kVars.boolCollectPowerUps = false
tab:Toggle("收集能量", false, function(bool)
    kVars.boolCollectPowerUps = bool
    if bool then
        fCollectPowerUps()
    end
end,{default = kVars.boolCollectPowerUps})

function fCollectPowerUps()
    spawn(function()
        while kVars.boolCollectPowerUps do
            task.wait()
            if game:GetService("Workspace").Ignore:FindFirstChild("PowerUps") then
                for i,v in pairs(game:GetService("Workspace").Ignore.PowerUps:GetChildren()) do
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
                    task.wait()
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
        end
    end)
end