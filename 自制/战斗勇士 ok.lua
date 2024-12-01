_G.Settings = {
    enabled = false,
    antistuck = true,
    esp = false,
    autoequip = false,
    autospawn = false,
    antiparry = false,
    followclosest = false,
    autohit = false,
    antiradgoll = false,
}

function addEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if not n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                local u = Instance.new("BillboardGui", n:WaitForChild("Head"))
                u.LightInfluence = 0
                u.Size = UDim2.new(40, 40, 1, 1)
                u.StudsOffset = Vector3.new(0, 3, 0)
                u.ZIndexBehavior = "Global"
                u.ClipsDescendants = false
                u.AlwaysOnTop = true
                u.Name = "Head"
                local v = Instance.new("BillboardGui", n:WaitForChild("HumanoidRootPart"))
                v.LightInfluence = 0
                v.Size = UDim2.new(3, 3, 5, 5)
                v.StudsOffset = Vector3.new(0, 0, 0)
                v.ZIndexBehavior = "Global"
                v.ClipsDescendants = false
                v.AlwaysOnTop = true
                v.Name = "eyeesspee"
                local w = Instance.new("TextBox", u)
                w.BackgroundTransparency = 1
                w.ClearTextOnFocus = false
                w.MultiLine = true
                w.Size = UDim2.new(1, 1, 1, 1)
                w.Font = "GothamBold"
                w.Text = n.Name
                w.TextScaled = true
                w.TextYAlignment = "Top"
                w.TextColor3 = Color3.fromRGB(255, 55, 55)
                local x = Instance.new("TextBox", v)
                x.BackgroundTransparency = 1
                x.ClearTextOnFocus = false
                x.MultiLine = true
                x.Size = UDim2.new(1, 1, 1, 1)
                x.Font = "GothamBold"
                x.Text = " "
                x.BackgroundTransparency = 0.85
                x.TextScaled = true
                x.TextYAlignment = "Top"
                x.BackgroundColor3 = Color3.fromRGB(126, 0, 0)
            end
        end
    end
end
function removeEsp()
    for m, n in pairs(game.Workspace.PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.HumanoidRootPart:FindFirstChild("eyeesspee") then
                n.HumanoidRootPart:FindFirstChild("eyeesspee"):Destroy()
                n.Head.Head:Destroy()
            end
        end
    end
end
function randomPlayer()
    math.randomseed(os.time())
    local y = game.Players:GetPlayers()[math.random(1, #game.Players:GetPlayers())]
    return y.DisplayName
end
local z = {""}
local function A(B)
    return B[math.random(1, #B)]
end
function remLine(q)
    if q.Parent.Torso:FindFirstChild("Beam") then
        q.Parent.Torso:FindFirstChild("Beam"):Destroy()
    end
end
function walkToClosest()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                    end
                end
            end
        end
    end
    if _G.Settings.autojump == true then
    end
    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Humanoid").WalkToPoint = C.Position
end
function getClosestHrp()
    local C = nil
    local D = 999999
    local p = game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("HumanoidRootPart")
    for m, n in pairs(game:GetService("Workspace").PlayerCharacters:GetChildren()) do
        if n.Name ~= game.Players.LocalPlayer.Name then
            if n.Humanoid.Health ~= 0 then
                local q = n:FindFirstChild("HumanoidRootPart")
                if (p.Position - q.Position).Magnitude < D then
                    if (p.Position - q.Position).Magnitude <= _G.Settings.range and q.Parent.Humanoid.Health ~= 0 then
                        D = (p.Position - q.Position).Magnitude
                        C = q
                        addLine(p, q)
                    else
                        remLine(q)
                    end
                end
            end
        end
    end
    return C
end
function setAttachmentWorldCFrame(E, F)
    E.CFrame = E.Parent.CFrame:toObjectSpace(F)
end
local G = 0
local H = 0
local I = 0
local J = 0
local K = false
local L = 0
game:GetService("RunService").RenderStepped:connect(
    function()
        if game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu") and _G.Settings.autospawn == true then
            keypress(0x20)
            keyrelease(0x20)
        end
        if _G.Settings.autoequip == true then
            if
                not game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool") and
                    not game.Players.LocalPlayer.PlayerGui.RoactUI:FindFirstChild("MainMenu")
             then
                keypress(0x31)
                keyrelease(0x31)
            end
        end
        if I == 60 then
            if _G.Settings.esp == true then
                addEsp()
            else
                removeEsp()
            end
            I = 0
        end
        I = I + 1
        J = J + 1
        L = L + 1
        if H == 10 then
            if _G.Settings.followclosest == true then
                walkToClosest()
            end
            H = 0
        end
        H = H + 1
        if
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            )
         then
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes:FindFirstChild(
                "Hitbox2"
            ):Destroy()
        end
        local M =
            game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool"):FindFirstChild(
            "ClientEquipProgress"
        )
        local q = getClosestHrp()
        if _G.Settings.usemethod2 == false then
            if J == _G.Settings.loopspeed or J > _G.Settings.loopspeed then
                J = 0
                for m, n in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChildOfClass("Tool").Hitboxes.Hitbox:GetChildren(

                    )
                ) do
                    if m <= _G.Settings.usehitbox then
                        if n.Name == "DmgPoint" then
                            if _G.Settings.antiparry == true then
                                if q.Parent.SemiTransparentShield.Transparency == 1 then
                                    M.Value = 1
                                    if _G.Settings.enabled == true then
                                        setAttachmentWorldCFrame(
                                            n,
                                            CFrame.new(
                                                q.Position +
                                                    Vector3.new(
                                                        math.random(-1, 1),
                                                        math.random(-1, 1),
                                                        math.random(-1, 1)
                                                    )
                                            )
                                        )
                                    end
                                else
                                    setAttachmentWorldCFrame(n, CFrame.new(q.Position + Vector3.new(123, 123, 123)))
                                    M.Value = 0
                                end
                            else
                                if _G.Settings.enabled == true then
                                    setAttachmentWorldCFrame(
                                        n,
                                        CFrame.new(
                                            q.Position +
                                                Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                        )
                                    )
                                end
                            end
                        end
                    else
                        setAttachmentWorldCFrame(
                            n,
                            CFrame.new(
                                game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name]:FindFirstChild("Head").Position +
                                    Vector3.new(0, 10, 0)
                            )
                        )
                    end
                end
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        else
            local O =
                game:GetService("Workspace").PlayerCharacters:FindFirstChild(
                game:GetService("Players").LocalPlayer.Name
            )
            local P = O:FindFirstChildOfClass("Tool").Hitboxes.Hitbox
            local Q = O:FindFirstChildOfClass("Tool").Hitboxes
            local R = O:FindFirstChildOfClass("Tool")
            local M = R:FindFirstChild("ClientEquipProgress")
            if Q:FindFirstChild("Hitbox2") then
                Q:FindFirstChild("Hitbox2"):Destroy()
            end
            if _G.Settings.stompaura == true then
                for m, N in pairs(
                    game.Workspace.PlayerCharacters[game.Players.LocalPlayer.Name].Stomp.Hitboxes.RightLegHitbox:GetChildren(

                    )
                ) do
                    if N.Name == "DmgPoint" then
                        N.Visible = true
                        if m <= _G.Settings.usehitbox then
                            if q.Parent.Humanoid.Health <= 15 then
                                setAttachmentWorldCFrame(
                                    N,
                                    CFrame.new(
                                        q.Position +
                                            Vector3.new(math.random(-1, 1), math.random(-1, 1), math.random(-1, 1))
                                    )
                                )
                                if L >= 30 then
                                    keypress(0x51)
                                    keyrelease(0x51)
                                    L = 0
                                end
                            end
                        end
                    end
                end
            end
        end
    end
)

local ScreenGui = Instance.new("ScreenGui")
local Frame = Instance.new("Frame")
local TextButton = Instance.new("TextButton")
local UITextSizeConstraint = Instance.new("UITextSizeConstraint")
local UICorner = Instance.new("UICorner")


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
end)

UITextSizeConstraint.Parent = TextButton
UITextSizeConstraint.MaxTextSize = 30

local lib = loadstring(game:HttpGet"https://raw.githubusercontent.com/flyspeed7/Only/main/UI%20%E9%80%8F%E6%98%8E%20Libe.Lua")()
local win = lib:Window("Y&F | 战斗勇士",Color3.fromRGB(0, 255, 0), Enum.KeyCode.E)

local tab = win:Tab("主要")
local tab2 = win:Tab("其他")

tab:Toggle("自动行走", false, function(Y)
    _G.Settings.followclosest = Y
         saveSettings()
end)

tab:Toggle("自动重生", false, function(Y)
    _G.Settings.autospawn = Y
         saveSettings()
end)

tab:Toggle("自动装备", false, function(Y)
    _G.Settings.autoequip = Y
         saveSettings()
end)

tab:Toggle("自动攻击", false, function(Y)
    _G.Settings.autohit = Y
            saveSettings()
            task.spawn(
                function()
                    while task.wait(1) do
                        if not _G.Settings.autohit then
                            break
                        end
                        mouse1click()
                    end
                end
            )
end)

tab2:Toggle("反招架", false, function(Y)
    _G.Settings.antiparry = Y
         saveSettings()
end)

tab2:Toggle("反辐射", false, function(Y)
    _G.Settings.antiradgoll = Y
            saveSettings()
            task.spawn(
                function()
                    while task.wait() do
                        if not _G.Settings.antiradgoll then
                            break
                        end
                        game:GetService("Players").LocalPlayer.Character.Humanoid.RagdollRemoteEvent:FireServer(false)
                    end
                end
            )
end)

tab2:Toggle("玩家绘制", false, function(Y)
    _G.Settings.esp = Y
         saveSettings()
end)