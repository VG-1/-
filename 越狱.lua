local Players = game:GetService('Players');
local localplayer = Players.LocalPlayer;
-- semicolon but cool :sunglasses:

local Library = loadstring(game:HttpGet(("https://raw.githubusercontent.com/HexerMaster1929/CARMLWARE/main/UI/LIBRARY-LATEST.lua"),true))()--require(script.Parent)
local JBENGINE = loadstring(game:HttpGet('https://raw.githubusercontent.com/MrolivesGaming/HexHub/main/GAMES/JAILBREAK/JB-ENGINE.lua'))()
local JB_NOTIFICATIONS = require(game:GetService("ReplicatedStorage").Game.Notification)
Library:Notify({
	Title = "KING SCRIPT",
	Content = "客户端脚本是最新的！",
	Duration = 6.5,
	Image = 1134693820,
})

JB_NOTIFICATIONS.new({
	Text = "启动KING SCRIPT，这可能需要一段时间！",
	Duration = 2
})

local Sense = loadstring(game:HttpGet('https://raw.githubusercontent.com/shlexware/Sirius/request/library/sense/source.lua'))()
local Window = Library:CreateWindow({
	Name = "KING SCRIPT-越狱",
	ConfigurationSaving = {
		Enabled = true,
		FolderName = "CARMLWARE_SAVED_DATA", -- 为你的中枢/游戏创建一个自定义文件夹
		FileName = "JAILBREAK"
	},

})
--Window:AddSettingsTab() -- \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/ \/
--Window:SetTabOrder(1)
local Char = Window:CreateTab("主要的",13285102351,true)
local Combat = Window:CreateTab("战斗",14084907641,true)
local VisualTab = Window:CreateTab("画面",6523858394,true)
--local Configs = Window:CreateTab("Settings")

--[[local EvadeSector = Evade:("Character", "left")
local Visuals = Evade:CreateSector("Visuals", "right")
local Credits = Evade:CreateSector("Credits", "left")
local Farms = AutoFarms:CreateSector("Farms", "left")
local FarmStats = AutoFarms:CreateSector("Stats", "right")

local Gamesec = Gamee:CreateSector("Utils", "right")
local World = Gamee:CreateSector("World", "left")]]

Settings = {
	["WS"] = 16,
	["JP"] = 50,
	["FLYSPD"] = 20,
	["NoRagdoll"] = false,
	["NoPara"] = false,
	["WEAPON"] = {
		["NFD"] = false,
		["FAM"] = false,
		["NRC"] = false,
		["NSP"] = false,
		["IRL"] = false,
	},
	ESP = {
		Enabled = false,
		ShowTeam = false,
		ShowEnemy = false,
		TeamColor = Color3.fromRGB(85, 255, 0),
		EnemyColor = Color3.fromRGB(255, 0, 0),
		ShowTracers = false,
		ShowBoxes = false,
		ShowNames = false,
		ShowDistance = false,
		ShowChams = false,
		SHowHealth = false,
		TracerOrigin = "Bottom"

	}
}

wait(1)

Char:CreateSlider({
	Name = "步行速度",
	Increment = 1,
	Suffix = "Speed",
	CurrentValue = 16,
	Flag = "SPSlider",
	Range = {16,100},

	Callback = function(JP)
		Settings["WS"] = JP
	end,
})

Char:CreateSlider({
	Name = "跳跃高度",
	Increment = 1,
	Suffix = "Height",
	CurrentValue = 50,
	Flag = "JPSlider",
	Range = {50,200},

	Callback = function(JP)
		Settings["JP"] = JP
	end,
})


Char:CreateToggle({
	Name = "没有布娃娃",
	CurrentValue = Settings["NoRagdoll"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoRagdoll"] = state
		if state == true then
			for _,v in pairs(getgc(true)) do
				if typeof(v) == "table" then
					if rawget(v, 'Ragdoll') then 
						v.Ragdoll = function(...) 
							return wait(9e9) 
						end 
					end
				end
			end
		else
			for _,v in pairs(getgc(true)) do
				if typeof(v) == "table" then
					if rawget(v, 'Ragdoll') then 
						v.Ragdoll = JBENGINE.Backups.Ragdoll
					end
				end
			end
		end
	end,
})

Char:CreateToggle({
	Name = "坠落时没有降落伞",
	CurrentValue = Settings["NoPara"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoPara"] = state
		function deadFunction() --Lazy solution
			return false 
		end
		if state then
			require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = deadFunction()
		else
			require(game:GetService("ReplicatedStorage").Game.Paraglide).IsFlying = engine.Backups.IsFlying()
		end
	end,
})

Char:CreateSection("交互修改")

Char:CreateToggle({
	Name = "无交互等待时间",
	CurrentValue = Settings["NoWaitTime"],
	Flag = "NRTOGGLE", 
	Callback = function(state)

		Settings["NoRagdoll"] = state
		if state then
			for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
				v.Timed = false;
			end
		else
			for i,v in pairs(require(game:GetService("ReplicatedStorage").Module.UI).CircleAction.Specs) do
				v.Timed = true;
			end
		end
	end,
})

Char:CreateSection("航班修改")

Char:CreateLabel("临时补丁！")

-- MAIN LOOP

Combat:CreateSection("枪支改装")

Combat:CreateToggle({
	Name = "无火灾延迟",
	CurrentValue = Settings["WEAPON"]["NFD"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NFD"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireFreq = math.huge
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireFreq = 1
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "全自动火灾",
	CurrentValue = Settings["WEAPON"]["FAM"],
	Flag = "FAF", 
	Callback = function(state)
		Settings["WEAPON"]["FAM"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireAuto = true
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.FireAuto = false
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "无反冲效应",
	CurrentValue = Settings["WEAPON"]["NRC"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NRC"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.CamShakeMagnitude = 0
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.CamShakeMagnitude = 1
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "没有子弹扩散",
	CurrentValue = Settings["WEAPON"]["NSP"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["NSP"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.BulletSpread = 0.06
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.BulletSpread = 0
			end
		end
	end,
})
Combat:CreateToggle({
	Name = "即时武器装填",
	CurrentValue = Settings["WEAPON"]["IRL"],
	Flag = "NFDTOGGLE", 
	Callback = function(state)
		Settings["WEAPON"]["IRL"] = state
		if state == true then
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.ReloadTime = 0
			end
		else
			for i,v in pairs(game:GetService("ReplicatedStorage").Game.ItemConfig:GetChildren()) do
				local gun = require(v)
				gun.ReloadTime = 1
			end
		end
	end,
})

Combat:CreateSection("武器库存")

Combat:CreateButton({
	Name = "获取所有默认武器【给予者方法】",
	Callback = function()
		loadstring(game:HttpGet("https://raw.githubusercontent.com/XiaoYunCN/UWU/main/Loaded_UI.lua", true))()
	end,
})

Combat:CreateButton({
	Name = "获取所有高级武器【点击所有方法】",
	Callback = function()
		for i,v in pairs(workspace:GetDescendants()) do
			if v:IsA("ClickDetector") then
				fireclickdetector(v)
			end
		end
	end,
})

-- visuals

VisualTab:CreateSection("ESP")

VisualTab:CreateToggle({
	Name = "ESP",
	CurrentValue = Settings.ESP.Enabled,
	Flag = "EspToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		--[[if EspSettings.FriendlyEnabled then
			Sense.teamSettings.friendly.enabled = Value
		end
		if EspSettings.EnemyEnabled then
			Sense.teamSettings.enemy.enabled = Value
		end]]

		Settings.ESP.Enabled = Value

		if Value then
			Sense.Load()
		elseif not Value then
			Sense.Unload()
		end
	end
})
VisualTab:CreateToggle({
	Name = "显示敌人",
	CurrentValue = Settings.ESP.ShowEnemy,
	Flag = "ShowEnemysToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowEnemy = Value

		Sense.teamSettings.enemy.enabled = Value

	end
})

VisualTab:CreateToggle({
	Name = "显示团队成员",
	CurrentValue = Settings.ESP.ShowTeam,
	Flag = "ShowTmMbrToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.ShowTeam = Value
		Sense.teamSettings.friendly.enabled = Value

	end
})

VisualTab:CreateSection("ESP 设置")

VisualTab:CreateToggle({
	Name = "盒子框",
	CurrentValue = Settings.ESP.ShowBoxes,
	Flag = "ShowBoxesToggle", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.ShowBoxes = Value
		Sense.teamSettings.friendly.box = Value
		Sense.teamSettings.enemy.box = Value

	end
})

VisualTab:CreateToggle({
	Name = "显示健康栏",
	CurrentValue = Settings.ESP.SHowHealth,
	Flag = "ShowHealthBarToggleESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)


		Settings.ESP.SHowHealth = Value
		Sense.teamSettings.friendly.healthBar = Value
		Sense.teamSettings.enemy.healthBar = Value

	end
})

VisualTab:CreateToggle({
	Name = "显示名称",
	CurrentValue = Settings.ESP.ShowNames,
	Flag = "ShowNamesESP", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowNames = Value

		Sense.teamSettings.friendly.name = Value
		Sense.teamSettings.enemy.name = Value

	end
})

VisualTab:CreateToggle({
	Name = "显示距离",
	CurrentValue = Settings.ESP.ShowDistance,
	Flag = "ShowDistance", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowDistance = Value

		Sense.teamSettings.friendly.distance = Value
		Sense.teamSettings.enemy.distance = Value

	end
})

VisualTab:CreateToggle({
	Name = "显示跟踪器",
	CurrentValue = Settings.ESP.ShowTracers,
	Flag = "ShowTracers", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)

		Settings.ESP.ShowTracers = Value

		Sense.teamSettings.friendly.tracer = Value
		Sense.teamSettings.enemy.tracer = Value

	end
})

VisualTab:CreateSlider({
	Name = "ESP范围",
	Range = {10, 700},
	Increment = 10,
	Suffix = "Range",
	CurrentValue = 10,
	Flag = "EspRangeSlider", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.sharedSettings.maxDistance = Value
	end,
})

VisualTab:CreateDropdown({
	Name = "示踪剂来源",
	Options = {"Bottom","Top"},
	CurrentOption = Sense.teamSettings.enemy.tracerOrigin or "Bottom",
	Flag = "TracerOrigin", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Option)
		Sense.teamSettings.enemy.tracerOrigin = Option
		Sense.teamSettings.enemy.tracerOrigin = Option
	end,
})

VisualTab:CreateColorPicker({
	Name = "团队颜色",
	Color = Color3.fromRGB(127, 255, 105),
	Flag = "TeamColorPicker", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.teamSettings.friendly.boxColor = Value
		Sense.teamSettings.friendly.tracerColor = Value
		Sense.teamSettings.friendly.nameColor = Value
		Sense.teamSettings.friendly.healthTextColor = Value
		Sense.teamSettings.friendly.healthyColor = Value
		Sense.teamSettings.friendly.distanceColor = Value
		Sense.teamSettings.friendly.distanceOutlineColor = Value
	end
})

VisualTab:CreateColorPicker({
	Name = "敌人的颜色",
	Color = Color3.fromRGB(255, 66, 58),
	Flag = "EnemyColorPicker", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
	Callback = function(Value)
		Sense.teamSettings.enemy.boxColor = Value
		Sense.teamSettings.enemy.tracerColor = Value
		Sense.teamSettings.enemy.nameColor = Value
		Sense.teamSettings.enemy.healthTextColor = Value
		Sense.teamSettings.enemy.healthyColor = Value
		Sense.teamSettings.enemy.distanceColor = Value
		Sense.teamSettings.enemy.distanceOutlineColor = Value
	end
})


game:GetService("RunService").RenderStepped:Connect(function()
	if localplayer.Character then
		if localplayer.Character:FindFirstChildWhichIsA("Humanoid") then
			localplayer.Character:FindFirstChildWhichIsA("Humanoid").WalkSpeed = Settings["WS"]
			localplayer.Character:FindFirstChildWhichIsA("Humanoid").JumpPower = Settings["JP"]
		end
	end
		task.wait()
end)


JB_NOTIFICATIONS.new({
	Text = "King已成功启动，尽情享受吧！",
	Duration = 2
})