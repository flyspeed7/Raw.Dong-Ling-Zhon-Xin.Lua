local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/flyspeed7/Raw.Dong-Ling-Zhon-Xin.Lua/refs/heads/main/Raw.Main-Orion-UI.Lua"))()
  local Window = OrionLib:MakeWindow({Name = "Gun Ball | Y&F-HUB", HidePremium = false, SaveConfig = true, ConfigFolder = "Orion"})
  
   local Tab= Window:MakeTab({ 
         Name = "Main", 
         Icon = "rbxassetid://7734068495", 
         PremiumOnly = false 
 }) 
local Section = Tab:AddSection({
        Name = "Script;By:Q3E4"
})

Tab:AddToggle({
        Name = "Auto Parry",
        Default = false,
        Callback = function(Value)
                getgenv().auto_block = Value
        local function auto()
            while true do
                if auto_block then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
                        ["name"] = "defense",
                        ["origin"] = "balltargets"
                    },{})
                else break
                end
                wait()
            end
        end
        auto()
        end    
})

Tab:AddToggle({
        Name = "Auto Spam!",
        Default = false,
        Callback = function(Value)
getgenv().auto_spam = Value
        local function auto()
            while true do
                if auto_spamshooot then
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer({
                        ["name"] = "defense",
                        ["origin"] = "balltargets"
                    },{})
                else break
                end
                wait()
            end
        end
        auto()
        end    
})

Tab:AddToggle({
        Name = "lnf GEM",
        Default = false,
        Callback = function(Value)
                getgenv().inf_gems = Value
        local function auto()
            while true do
                if inf_gems then
                    local ohTable1 = {
                        ["name"] = "redeem",
                        ["origin"] = "quests"
                    }
                    local ohTable2 = {
                        [1] = getgenv().quest
                    }

                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                    game:GetService("ReplicatedStorage").RemoteEvent:FireServer(ohTable1, ohTable2)
                else break
                end
                wait()
            end
        end
        auto()
        end    
})