local library = loadstring(game:HttpGet("https://raw.githubusercontent.com/oShyyyyy/Plaguecheat.cc-Roblox-Ui-library/main/Source.lua", true))()
local RunService = game:GetService("RunService")
local Aimbot = library:AddWindow('Aimbot')
local Visual = library:AddWindow('Visual')
local Misc = library:AddWindow('Misc')
local Camera = game.Workspace.Camera
local watermark = library:AddWatermark('');
local esp = Visual:AddSection('Esp')
local smth = Misc:AddSection('Visuals')
local RunService = game:GetService("RunService")
local Players = game:GetService("Players")
local Camera2 = workspace.CurrentCamera
local LocalPlayer = Players.LocalPlayer
local Lighting = game:GetService("Lighting")
local Nametags = {}
local Weapon = {}
local CratesEsp = {}
local Nametag = false
local Chams = false
local Cratetags = false
local ChamsFolder = Instance.new("Folder")
ChamsFolder.Parent = game.CoreGui
ChamsFolder.Name = "ChamsFolder"

local function createNametag(player)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Size = 20
    text.Color = Color3.new(255, 0, 0)

    Nametags[player] = text
end

local function createWeapon(player)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Size = 20
    text.Color = Color3.new(255, 0, 0)

    Weapon[player] = text
end

local function createCrateEsp(Crate)
    local text = Drawing.new("Text")
    text.Visible = false
    text.Center = true
    text.Outline = true
    text.Size = 20
    text.Color = Color3.new(0, 255, 0)

    CratesEsp[Crate] = text
end

local function removeNametag(player)
    if Nametags[player] then
        Nametags[player]:Remove()
        Nametags[player] = nil
    end
end

local function removeWeapon(player)
    if Weapon[player] then
        Weapon[player]:Remove()
        Weapon[player] = nil
    end
end

local function removeCrateEsp(Crate)
    if CratesEsp[Crate] then
        CratesEsp[Crate]:Remove()
        CratesEsp[Crate] = nil
    end
end

for _, player in pairs(workspace:GetChildren()) do
	if player:FindFirstChild("HumanoidRootPart") then
        createNametag(player)
    end
end

game.Workspace.DescendantAdded:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		createNametag(player)
	end
end)

game.Workspace.DescendantRemoving:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		removeNametag(player)
	end
end)

for _, player in pairs(workspace:GetChildren()) do
	if player:FindFirstChild("HumanoidRootPart") then
        createWeapon(player)
    end
end

game.Workspace.DescendantAdded:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		createWeapon(player)
	end
end)

game.Workspace.DescendantRemoving:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		removeWeapon(player)
	end
end)

for _, Crate in pairs(workspace:GetChildren()) do
	if Crate:FindFirstChild("Bottom") and Crate:FindFirstChild("Handles") and Crate:FindFirstChild("Top") then
        createCrateEsp(Crate)
    end
end

game.Workspace.DescendantAdded:Connect(function(Crate)
	if Crate:FindFirstChild("Bottom") and Crate:FindFirstChild("Handles") and Crate:FindFirstChild("Top") then
		createCrateEsp(Crate)
	end
end)

game.Workspace.DescendantRemoving:Connect(function(Crate)
	if Crate:FindFirstChild("Bottom") and Crate:FindFirstChild("Handles") and Crate:FindFirstChild("Top") then
		removeCrateEsp(Crate)
	end
end)

RunService.RenderStepped:Connect(function()
    for Crate, text in pairs(CratesEsp) do
       	local character = Crate
        if character then
            local rootPart = character:FindFirstChild("Bottom") and character:FindFirstChild("Handles") and character:FindFirstChild("Top")
            if rootPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, -3.3, 0))
                local humanoidRootPart = Crate:FindFirstChild("Bottom")
                local distance2 = math.floor((Camera.CFrame.Position - humanoidRootPart.Position).magnitude)
                local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
                if onScreen then
                    text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
                    text.Text = "Green Crate [" .. distance2 .. "m]"
                    text.Size = math.clamp(30 - distance, 12, 20)
					if Cratetags == true then
						text.Visible = true
					elseif Cratetags == false then
						text.Visible = false
					end
                else
                    text.Visible = false
                end
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end)

RunService.RenderStepped:Connect(function()
    for player, text in pairs(Weapon) do
       	local character = player
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, -3.3, 0))
                local humanoidRootPart = player:FindFirstChild("HumanoidRootPart")
                local distance2 = math.floor((Camera.CFrame.Position - humanoidRootPart.Position).magnitude)
                local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
                if onScreen then
                    text.Position = Vector2.new(screenPosition.X, screenPosition.Y)
                    text.Text = "Nan"
                    text.Size = math.clamp(30 - distance, 12, 20)
					if Nametag == true then
						text.Visible = true
					elseif Nametag == false then
						text.Visible = false
					end
                else
                    text.Visible = false
                end
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end)

RunService.RenderStepped:Connect(function()
    for player, text in pairs(Nametags) do
       	local character = player
        if character then
            local rootPart = character:FindFirstChild("HumanoidRootPart")
            if rootPart then
                local screenPosition, onScreen = Camera:WorldToViewportPoint(rootPart.Position + Vector3.new(0, 3, 0))
                local humanoidRootPart = player:FindFirstChild("HumanoidRootPart")
                local distance2 = math.floor((Camera.CFrame.Position - humanoidRootPart.Position).magnitude)
                local distance = (Camera.CFrame.Position - rootPart.Position).Magnitude
                local username = "Player"
                if player:FindFirstChild("Head") and player.Head:FindFirstChild("Nametag") and player.Head.Nametag.tag.Text == "Shylou2644" then
                    username = "Soldier"
                end
                if onScreen then
                    local verticalOffset = math.clamp(distance / 3, 1, 14)
                    text.Position = Vector2.new(screenPosition.X, screenPosition.Y - verticalOffset)
                    text.Text = username .. " [" .. distance2 .. "m]"
                    text.Size = math.clamp(30 - distance, 12, 20)
					if Nametag == true then
						text.Visible = true
					elseif Nametag == false then
						text.Visible = false
					end
                else
                    text.Visible = false
                end
            else
                text.Visible = false
            end
        else
            text.Visible = false
        end
    end
end)

for _, v in pairs(workspace:GetChildren()) do
	if v:FindFirstChild("HumanoidRootPart") then
		local chams = Instance.new("Highlight", ChamsFolder)
		chams.Adornee = v
		chams.OutlineColor = Color3.new(0,0,0)
		chams.OutlineTransparency = 0
		chams.FillColor = Color3.new(255,0,0)
		chams.FillTransparency = 0.5
	end
end

game.Workspace.DescendantAdded:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		local chams = Instance.new("Highlight", ChamsFolder)
		chams.Adornee = player
		chams.OutlineColor = Color3.new(0,0,0)
		chams.OutlineTransparency = 0
		chams.FillColor = Color3.new(255,0,0)
		chams.FillTransparency = 0.5
	end
end)

game.Workspace.DescendantRemoving:Connect(function(player)
	if player:FindFirstChild("HumanoidRootPart") then
		if ChamsFolder:FindFirstChild("Highlight").Adornee == player then
			ChamsFolder:FindFirstChild("Highlight"):Destroy()
		end
	end
end)

esp:AddLabel('Player Esp')

esp:AddToggle('Nametags',true,nil,function(v) 
	Nametag = v
end)

esp:AddToggle('Chams',true,nil,function(v) 
	Chams = v
end)

esp:AddToggle('Green Crate',true,nil,function(v) 
	Cratetags = v
end)

local FieldOfView = 70

smth:AddToggle('No Grass',true,nil,function(v)
	sethiddenproperty(game:GetService("Workspace").Terrain, "Decoration", not v)
end)

smth:AddSlider('FieldOfView | Default is 70', 120, 1, 70,function(c) 
	FieldOfView = c
end)

local timechanger = false
local customtime = 12

smth:AddToggle('Timechanger',true,nil,function(v)
	timechanger = v
end)

smth:AddSlider('Time', 24, 0, game.Lighting.ClockTime,function(c) 
	customtime = c
end)

local crosshairSize = 10
local Crosshair = true
local crosshairThickness = 1
local crosshairColor = Color3.fromRGB(255, 0, 0)
local lines = {}

for i = 1, 4 do
    local line = Drawing.new("Line")
    line.Color = crosshairColor
    line.Thickness = crosshairThickness
    line.Transparency = 1
    line.Visible = true
    lines[i] = line
end
local function updateCrosshair()
    local centerX = Camera.ViewportSize.X / 2
    local centerY = Camera.ViewportSize.Y / 2

	lines[1].Thickness = crosshairThickness
	lines[2].Thickness = crosshairThickness
	lines[3].Thickness = crosshairThickness
	lines[4].Thickness = crosshairThickness

	lines[1].Visible = Crosshair
	lines[2].Visible = Crosshair
	lines[3].Visible = Crosshair
	lines[4].Visible = Crosshair

    lines[1].From = Vector2.new(centerX, centerY)
    lines[1].To = Vector2.new(centerX, centerY - crosshairSize)
    lines[2].From = Vector2.new(centerX, centerY)
    lines[2].To = Vector2.new(centerX, centerY + crosshairSize)
    lines[3].From = Vector2.new(centerX, centerY)
    lines[3].To = Vector2.new(centerX - crosshairSize, centerY)
    lines[4].From = Vector2.new(centerX, centerY)
    lines[4].To = Vector2.new(centerX + crosshairSize, centerY)
end
RunService.RenderStepped:Connect(updateCrosshair)

smth:AddToggle('Crosshair',true,nil,function(v)
	Crosshair = v
end)

smth:AddSlider('Crosshair Thickness', 10, 1, 1,function(c)
	crosshairThickness = c
end)

smth:AddSlider('Crosshair Size', 100, 10, 1,function(c)
	crosshairSize = c
end)

smth:AddSlider('Base Walls Transperancy', 1, 0, 0,function(c) 
	for _, v in pairs(workspace:GetChildren()) do
		if v:FindFirstChild("Hitbox") then
			v.Hitbox.Transparency = c
		end
	end
end)

do
    local Sky = game:GetService("Lighting"):FindFirstChildOfClass("Sky")
    if not Sky then Sky = Instance.new("Sky", Lighting) end
    local value = "Standard"
    local SkyBoxes = {
        ["Standard"] = { ["SkyboxBk"] = Sky.SkyboxBk, ["SkyboxDn"] = Sky.SkyboxDn, ["SkyboxFt"] = Sky.SkyboxFt, ["SkyboxLf"] = Sky.SkyboxLf, ["SkyboxRt"] = Sky.SkyboxRt, ["SkyboxUp"] = Sky.SkyboxUp, },
        ["Among Us"] = { ["SkyboxBk"] = "rbxassetid://5752463190", ["SkyboxDn"] = "rbxassetid://5752463190", ["SkyboxFt"] = "rbxassetid://5752463190", ["SkyboxLf"] = "rbxassetid://5752463190", ["SkyboxRt"] = "rbxassetid://5752463190", ["SkyboxUp"] = "rbxassetid://5752463190" },
        ["Spongebob"] = { ["SkyboxBk"] = "rbxassetid://277099484", ["SkyboxDn"] = "rbxassetid://277099500", ["SkyboxFt"] = "rbxassetid://277099554", ["SkyboxLf"] = "rbxassetid://277099531", ["SkyboxRt"] = "rbxassetid://277099589", ["SkyboxUp"] = "rbxassetid://277101591" },
        ["Deep Space"] = { ["SkyboxBk"] = "rbxassetid://159248188", ["SkyboxDn"] = "rbxassetid://159248183", ["SkyboxFt"] = "rbxassetid://159248187", ["SkyboxLf"] = "rbxassetid://159248173", ["SkyboxRt"] = "rbxassetid://159248192", ["SkyboxUp"] = "rbxassetid://159248176" },
        ["Winter"] = { ["SkyboxBk"] = "rbxassetid://510645155", ["SkyboxDn"] = "rbxassetid://510645130", ["SkyboxFt"] = "rbxassetid://510645179", ["SkyboxLf"] = "rbxassetid://510645117", ["SkyboxRt"] = "rbxassetid://510645146", ["SkyboxUp"] = "rbxassetid://510645195" },
        ["Clouded Sky"] = { ["SkyboxBk"] = "rbxassetid://252760981", ["SkyboxDn"] = "rbxassetid://252763035", ["SkyboxFt"] = "rbxassetid://252761439", ["SkyboxLf"] = "rbxassetid://252760980", ["SkyboxRt"] = "rbxassetid://252760986", ["SkyboxUp"] = "rbxassetid://252762652" },
        --["test"] = {"SkyboxBk"="rbxassetid://","SkyboxDn"="rbxassetid://","SkyboxFt"="rbxassetid://","SkyboxLf"="rbxassetid://","SkyboxRt"="rbxassetid://","SkyboxUp"="rbxassetid://"},
    }
	smth:AddDropdown('Sky',{'Standard','Among Us','Spongebob','Deep Space','Winter','Clouded Sky'},'Standard',function(a)
		value = a
	end)
    RunService.Heartbeat:Connect(function()
        for i, v in pairs(SkyBoxes[value]) do
            Sky[i] = v
        end
    end);
end

RunService.RenderStepped:Connect(function()
	Camera2.FieldOfView = FieldOfView
	if Chams == true then
		for _, z in pairs(ChamsFolder:GetChildren()) do
			z.Enabled = true
		end
	elseif Chams == false then
		for _, z in pairs(ChamsFolder:GetChildren()) do
			z.Enabled = false
		end
	end
	if timechanger == true then
		game.Lighting.ClockTime = customtime
	end
end)

watermark:Visible(true)
