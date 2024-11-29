local Tab = Window:MakeTab({
	Name = "Characters",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddLabel("Made For 4ntrax7w7v9")

Tab:AddButton({
	Name = "KJ",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "KJ"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "JK",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "JK"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Kokushibo",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Kokushibo"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Jun",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Jun"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "JunV2",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "JunV2"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Gojo",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Gojo"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Suiryu",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Suiryu"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "El Primo",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "El Primo"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Sorcerer",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Sorcerer"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Shadow Monarch",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Shadow Monarch"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Strongest of Today",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Strongest of Today"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

Tab:AddButton({
	Name = "Okarun",
	Callback = function()
      		local args = {
    [1] = "SetMoveset",
    [2] = "Okarun"
})

game:GetService("ReplicatedStorage").Remotes.Comunicator.Set:FireServer(unpack(args))
  	end    
})

local Tab = Window:MakeTab({
	Name = "Others Scripts",
	Icon = "rbxassetid://4483345998",
	PremiumOnly = false
})

Tab:AddButton({
	Name = "Dimensional Coalescene",
	Callback = function()
      		loadstring(game:HttpGet("https://rawscripts.net/raw/DIMENSIONAL-COALESCENCE-EXPERIMENTAL-coalescene-script-Characters-22701"))()
  	end    
})