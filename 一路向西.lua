local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hunryn/VB/main/OrionLib.ui.lua"))()
local Window = OrionLib:MakeWindow({Name = "KING一路向西", HidePremium = false, SaveConfig = true, ConfigFolder = "KING SCRIPT"})
local Tab = Window:MakeTab({
        Name = "基础功能",
        Icon = "rbxassetid://17345436140",
        PremiumOnly = false
})

Tab:AddTextbox({
        Name = "移动速度",
        Default = "",
        TextDisappear = true,
        Callback = function(Value)
    game:GetService("Players").LocalPlayer.Character:WaitForChild("Humanoid").WalkSpeed = Value
        end
})

Tab:AddButton({
     Name = "子弹追踪",
     Callback = function()
local Camera = game:GetService("Workspace").CurrentCamera
local Players = game:GetService("Players")
local LocalPlayer = game:GetService("Players").LocalPlayer

local function GetClosestPlayer()
   local ClosestPlayer = nil
   local FarthestDistance = math.huge

   for i, v in pairs(Players.GetPlayers(Players)) do
       if v ~= LocalPlayer and v.Character and v.Character.FindFirstChild(v.Character, "HumanoidRootPart") then
           local DistanceFromPlayer = (LocalPlayer.Character.HumanoidRootPart.Position - v.Character.HumanoidRootPart.Position).Magnitude

           if DistanceFromPlayer < FarthestDistance then
               FarthestDistance = DistanceFromPlayer
               ClosestPlayer = v
           end
       end
   end

   if ClosestPlayer then
       return ClosestPlayer
   end
end

local GameMetaTable = getrawmetatable(game)
local OldGameMetaTableNamecall = GameMetaTable.__namecall
setreadonly(GameMetaTable, false)

GameMetaTable.__namecall = newcclosure(function(object, ...)
   local NamecallMethod = getnamecallmethod()
   local Arguments = {...}

   if tostring(NamecallMethod) == "FindPartOnRayWithIgnoreList" then
       local ClosestPlayer = GetClosestPlayer()

       if ClosestPlayer and ClosestPlayer.Character then
           Arguments[1] = Ray.new(Camera.CFrame.Position, (ClosestPlayer.Character.Head.Position - Camera.CFrame.Position).Unit * (Camera.CFrame.Position - ClosestPlayer.Character.Head.Position).Magnitude)
       end
   end

   return OldGameMetaTableNamecall(object, unpack(Arguments))
end)
  end
})

Tab:AddButton({
     Name = "魔改手枪",
     Callback = function()
     local list = require(game:GetService("ReplicatedStorage").GunScripts.GunStats)
for i,v in pairs(list) do
    v.Spread = 0
    v.prepTime = 0.1
    v.equipTime = 0.1
    v.MaxShots = math.huge
    v.ReloadSpeed = 0.1
    v.BulletSpeed = 250
    v.HipFireAccuracy = 0
    v.ZoomAccuracy = 0
end
  end
})

Tab:AddButton({
     Name = "防踢/拉回",
     Callback = function()
local mt = getrawmetatable(game)

setreadonly(mt, false)

local oldmt = mt.__namecall

mt.__namecall = newcclosure(function(Self, ...)


  local method = getnamecallmethod()

  if method == 'Kick' then

    wait(9e9)
    return nil

end

return oldmt(Self, ...)

end)

setreadonly(mt, true)
  end
})

Tab:AddToggle({
        Name = "名字显示",
        Default = false,
    Callback = function(name)
local function API_Check()

            if Drawing == nil then

                return "No"
            else
                return "Yes"
            end
        end

        local Find_Required = API_Check()

        if Find_Required == "No" then
            game:GetService("StarterGui"):SetCore("SendNotification",{
                Title = "An error lol";
                Text = "ESP script could not be loaded because your exploit is unsupported.";
                Duration = math.huge;
                Button1 = "OK"
            })

            return
        end

        local Players = game:GetService("Players")
        local RunService = game:GetService("RunService")
        local UserInputService = game:GetService("UserInputService")
        local Camera = workspace.CurrentCamera

        local Typing = false

        _G.SendNotifications = false 
        _G.DefaultSettings = false 

        _G.TeamCheck = true   
        _G.ESPVisible = name  
        _G.TextColor = Color3.fromRGB(0, 1, 0.749019)  -- The color that the boxes would appear as.
        _G.TextSize = 14 
        _G.Center = true   
        _G.Outline = false   
        _G.TextTransparency = 0.7   
        _G.TextFont = Drawing.Fonts.UI  

        _G.DisableKey = Enum.KeyCode.RightAlt   

        local function CreateESP()
            for _, v in next, Players:GetPlayers() do
                if v.Name ~= Players.LocalPlayer.Name then
                    local ESP = Drawing.new("Text")

                    RunService.RenderStepped:Connect(function()
                        if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                            local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)

                            ESP.Size = _G.TextSize
                            ESP.Center = _G.Center
                            ESP.Outline = _G.Outline
                            ESP.OutlineColor = _G.OutlineColor
                            ESP.Color = _G.TextColor
                            ESP.Transparency = _G.TextTransparency
                            ESP.Font = _G.TextFont

                            if OnScreen == true then
                                local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                local Dist = (Part1 - Part2).Magnitude
                                ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                if _G.TeamCheck == true then 
                                    if Players.LocalPlayer.Team ~= v.Team then
                                        ESP.Visible = _G.ESPVisible
                                    else
                                        ESP.Visible = false
                                    end
                                else
                                    ESP.Visible = _G.ESPVisible
                                end
                            else
                                ESP.Visible = false
                            end
                        else
                            ESP.Visible = false
                        end
                    end)

                    Players.PlayerRemoving:Connect(function()
                        ESP.Visible = false
                    end)
                end
            end

            Players.PlayerAdded:Connect(function(Player)
                Player.CharacterAdded:Connect(function(v)
                    if v.Name ~= Players.LocalPlayer.Name then 
                        local ESP = Drawing.new("Text")

                        RunService.RenderStepped:Connect(function()
                            if workspace:FindFirstChild(v.Name) ~= nil and workspace[v.Name]:FindFirstChild("HumanoidRootPart") ~= nil then
                                local Vector, OnScreen = Camera:WorldToViewportPoint(workspace[v.Name]:WaitForChild("Head", math.huge).Position)

                                ESP.Size = _G.TextSize
                                ESP.Center = _G.Center
                                ESP.Outline = _G.Outline
                                ESP.OutlineColor = _G.OutlineColor
                                ESP.Color = _G.TextColor
                                ESP.Transparency = _G.TextTransparency

                                if OnScreen == true then
                                    local Part1 = workspace:WaitForChild(v.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position
                                local Part2 = workspace:WaitForChild(Players.LocalPlayer.Name, math.huge):WaitForChild("HumanoidRootPart", math.huge).Position or 0
                                    local Dist = (Part1 - Part2).Magnitude
                                    ESP.Position = Vector2.new(Vector.X, Vector.Y - 25)
                                    ESP.Text = ("("..tostring(math.floor(tonumber(Dist)))..") "..v.Name.." ["..workspace[v.Name].Humanoid.Health.."]")
                                    if _G.TeamCheck == true then 
                                        if Players.LocalPlayer.Team ~= Player.Team then
                                            ESP.Visible = _G.ESPVisible
                                        else
                                            ESP.Visible = false
                                        end
                                    else
                                        ESP.Visible = _G.ESPVisible
                                    end
                                else
                                    ESP.Visible = false
                                end
                            else
                                ESP.Visible = false
                            end
                        end)

                        Players.PlayerRemoving:Connect(function()
                            ESP.Visible = false
                        end)
                    end
                end)
            end)
        end

        if _G.DefaultSettings == true then
            _G.TeamCheck = false
            _G.ESPVisible = true
            _G.TextColor = Color3.fromRGB(40, 90, 255)
            _G.TextSize = 14
            _G.Center = true
            _G.Outline = false
            _G.OutlineColor = Color3.fromRGB(0, 0, 0)
            _G.DisableKey = Enum.KeyCode.Q
            _G.TextTransparency = 0.75
        end

        UserInputService.TextBoxFocused:Connect(function()
            Typing = true
        end)

        UserInputService.TextBoxFocusReleased:Connect(function()
            Typing = false
        end)

        UserInputService.InputBegan:Connect(function(Input)
            if Input.KeyCode == _G.DisableKey and Typing == false then
                _G.ESPVisible = not _G.ESPVisible

                if _G.SendNotifications == true then
                    game:GetService("StarterGui"):SetCore("SendNotification",{
                        Title = "Exunys Developer";
                        Text = "The ESP's visibility is now set to "..tostring(_G.ESPVisible)..".";
                        Duration = 5;
                    })
                end
            end
        end)

        local Success, Errored = pcall(function()
            CreateESP()
        end)

        if Success and not Errored then
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Epic gamer esp";
                    Text = "Epic gamer esp has been successful loaded";
                    Duration = 5;
                })
            end
        elseif Errored and not Success then
            if _G.SendNotifications == true then
                game:GetService("StarterGui"):SetCore("SendNotification",{
                    Title = "Ash01 Developer";
                    Text = "ESP script has errored while loading, please check the developer console! (F9)";
                    Duration = 5;
                })
            end
            TestService:Message("The ESP script has errored, please notify Ash01 with the following information :")
            warn(Errored)
            print("!! IF THE ERROR IS A FALSE POSITIVE (says that a player cannot be found) THEN DO NOT BOTHER !!")
        end
    end
})

local PTeleport = Window:MakeTab({
        Name = "传送功能",
        Icon = "rbxassetid://17345436140",
        PremiumOnly = false
})

local Section = PTeleport:AddSection({
        Name = "↓牛仔传送点（只能牛仔传送）↓"
})

PTeleport:AddButton({
        Name = "滚筒",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Tumbleweed", false)
        end
})

PTeleport:AddButton({
        Name = "岩石溪",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("StoneCreek", false)
        end
})

PTeleport:AddButton({
        Name = "灰色山脊",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Grayridge", false)
        end
})

PTeleport:AddButton({
        Name = "大矿洞",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("Quarry", false)
        end
})

local Section = PTeleport:AddSection({
        Name = "↓不法之徒传送点（只能不法之徒传送）↓"
})

PTeleport:AddButton({
        Name = "堡垒",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("FortCassidy", true)
        end
})

PTeleport:AddButton({
        Name = "阿瑟堡",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("FortArthur", true)
        end
})

PTeleport:AddButton({
        Name = "红色岩石营地",
        Callback = function()
                game:GetService("ReplicatedStorage").GeneralEvents.Spawn:FireServer("RedRocks", true)
        end
})

OrionLib:Init()