local IMAGE = "rbxassetid://18216647696"
local Positions = UDim2.new(0.822025776, 0, 0.0401606411, 0)
local Sizes = UDim2.new(0, 76, 0, 70)

local KINGHUBMOBILE = Instance.new("ScreenGui")
local _100x100 = Instance.new("Frame")
local ImageButton = Instance.new("ImageButton")

KINGHUBMOBILE.Name = "King Script"
KINGHUBMOBILE.Parent = game:WaitForChild("CoreGui")
KINGHUBMOBILE.ZIndexBehavior = Enum.ZIndexBehavior.Sibling

_100x100.Name = "100x100"
_100x100.Parent = KINGHUBMOBILE
_100x100.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
_100x100.Position = Positions
_100x100.Size = UDim2.new(0, 76, 0, 70)

ImageButton.Parent = _100x100
ImageButton.BackgroundColor3 = Color3.fromRGB(255, 255, 255)
ImageButton.Size = Sizes
ImageButton.Image = IMAGE
ImageButton.MouseButton1Down:connect(function()
        local vim = game:service("VirtualInputManager")
        vim:SendKeyEvent(true, "RightControl", false, game)

        local vim = game:service("VirtualInputManager")
        vim:SendKeyEvent(false, "RightControl", false, game)
end)

local UILib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hunryn/VB/main/libKINGuI.lUa"))()
local win = UILib:Window("King Script丨旗帜战争",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为旗帜战争脚本")
    
    linni:Button("点击我复制QQ群链接",function()
setclipboard("霖溺QQ新主群https://qm.qq.com/q/SU0hmhIvwk")
end)

local tab = win:Tab("主要")

tab:Toggle("范围", false, function(state)
    local currPlayer = game:GetService('Players').LocalPlayer
    local servPlayer = game:GetService('Players')

    local RunService = game:GetService('RunService')
    local servTeams = game:GetService("Teams")

    local currMouse = currPlayer:GetMouse()
    local currCamera = game:GetService("Workspace").CurrentCamera


    getgenv().GameSettings = {
        SilentAim = {
            ["active"] = true,
            ["fov"] = 100,
            ["hitpart"] = "Head",
            ["circlevis"] = true,
            ["wallbang"] = false,
            ["circcolor"] = Color3.fromRGB(228, 9, 191)
        }
    }


    local CircleInline = Drawing.new("Circle")
    local CircleOutline = Drawing.new("Circle")
    CircleInline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleInline.Thickness = 2
    CircleInline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleInline.Transparency = 1
    CircleInline.Color = getgenv().GameSettings.SilentAim.circcolor
    CircleInline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleInline.ZIndex = 2
    CircleOutline.Radius = getgenv().GameSettings.SilentAim.fov
    CircleOutline.Thickness = 4
    CircleOutline.Position = Vector2.new(currCamera.ViewportSize.X / 2, currCamera.ViewportSize.Y / 2)
    CircleOutline.Transparency = 1
    CircleOutline.Color = Color3.new()
    CircleOutline.Visible = getgenv().GameSettings.SilentAim.circlevis
    CircleOutline.ZIndex = 1


    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= servTeams["Neutral"] then
            return false
        else
            return true
        end
    end

    function isDead(player)
        if
            player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                player.Character.Humanoid.Health <= 0
        then
            return true
        else
            return false
        end
    end


        local function isClosestPlayer()
            local target
            local dist = math.huge
            for _, v in next, servPlayer:GetPlayers() do
                if
                    not isDead(v) and v ~= currPlayer and not isSameTeam(v) and v.Character:FindFirstChild("Head") and
                        getgenv().GameSettings.SilentAim.active
                then
                    local pos, visible = currCamera:WorldToScreenPoint(v.Character.HumanoidRootPart.Position)
                    local magnitude = (Vector2.new(currMouse.X, currMouse.Y) - Vector2.new(pos.X, pos.Y)).magnitude
                    if magnitude < (getgenv().GameSettings.SilentAim.fov) then
                        if magnitude < dist then
                            if getgenv().GameSettings.SilentAim.wallbang then
                                target = v
                                dist = magnitude
                            else
                                if visible then
                                    target = v
                                    dist = magnitude
                            end
                        end
    
    
                        end
                    end
                end
            end
            return target
        end
    
    
        local target
        local gmt = getrawmetatable(game)
        setreadonly(gmt, false)
        local oldNamecall = gmt.__namecall
    
        gmt.__namecall =
            newcclosure(
            function(self, ...)
                local Args = {...}
                local method = getnamecallmethod()
                if tostring(self) == "WeaponHit" and tostring(method) == "FireServer" then
                    target = isClosestPlayer()
                    if target then
                        Args[2]["part"] = target.Character[getgenv().GameSettings.SilentAim.hitpart]
                        return self.FireServer(self, unpack(Args))
                    end
                end
                return oldNamecall(self, ...)
            end
        )
end)

tab:Toggle("人物透视", false, function(state)
    local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local teams = game:GetService("Teams")
    
    
    local function numberRound(n)
        return math.floor(tonumber(n) + 0.5)
    end
    
    function isSameTeam(player)
        if player.team ~= currPlayer.team and player.team ~= teams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    function isDead(player)
        if
            player == nil or player.Character == nil or player.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                player.Character.Humanoid.Health <= 0
         then
            return true
        else
            return false
        end
    end
    
    function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Holstered"
        end
    end
    
    function doESP()
        for _, v in next, servPlayer:GetPlayers() do
            if v ~= currPlayer and not isSameTeam(v) and not isDead(v) then
                for _, k in next, v.Character:GetChildren() do
                    if not isSameTeam(v) and not isDead(v) and k:IsA("BasePart") and not k:FindFirstChild("dohmESP") then
                        local dohmESP = Instance.new("BoxHandleAdornment", k)
                        dohmESP.Name = "dohmESP"
                        dohmESP.AlwaysOnTop = true
                        dohmESP.ZIndex = 10
                        dohmESP.Size = k.Size
                        dohmESP.Adornee = k
                        dohmESP.Transparency = 0.7
                        dohmESP.Color3 = Color3.new(1, 0, 0)
                    end
                    if not isDead(v) and not v.Character.Head:FindFirstChild("dohmESPTag") then
                        local dohmESPTag = Instance.new("BillboardGui", v.Character.Head)
                        dohmESPTag.Name = "dohmESPTag"
                        dohmESPTag.Size = UDim2.new(1, 200, 1, 30)
                        dohmESPTag.Adornee = v.Character.Head
                        dohmESPTag.AlwaysOnTop = true
    
                        local topTag = Instance.new("TextLabel", dohmESPTag)
                        topTag.TextWrapped = true
                        topTag.Text =
                            (v.Name ..
                            " | " ..
                                numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) ..
                                    "m" .. " | " .. getEquippedWeapon(v))
                        topTag.Size = UDim2.new(1, 0, 1, 0)
                        topTag.TextYAlignment = "Top"
                        topTag.TextColor3 = Color3.new(1, 1, 1)
                        topTag.BackgroundTransparency = 1
                    else
                        v.Character.Head.dohmESPTag.TextLabel.Text =
                            (v.Name ..
                            " | " ..
                                numberRound((currPlayer.Character.Head.Position - v.Character.Head.Position).Magnitude / 3) ..
                                    "m" .. " | " .. getEquippedWeapon(v))
                    end
                end
            end
        end
    end
    
    RunService.Stepped:Connect(function()
    doESP()
    end
    )
end)

tab:Toggle("头部范围", false, function(state)
    local currPlayer = game:GetService("Players").LocalPlayer
    local servPlayer = game:GetService("Players")
    local RunService = game:GetService("RunService")
    local currTeams = game:GetService("Teams")
    
    getgenv().Hitbox = {
        Settings = {
            ['hitpart'] = 'Head',
            ['hitsize'] = 5,
            ['transparency'] = 0.60,
            ['color'] =  BrickColor.new("Really blue")
        }
    }
    
    function isSameTeam(currTarget)
        if currTarget.team ~= currPlayer.team and currTarget.team ~= currTeams["Neutral"] then
            return false
        else
            return true
        end
    end
    
    function isDead(currTarget)
        if
            currTarget == nil or currTarget.Character == nil or
                currTarget.Character:FindFirstChildWhichIsA("Humanoid") == nil or
                currTarget.Character.Humanoid.Health <= 0
         then
            return true
        else
            return false
        end
    end
    
    RunService.Stepped:Connect(function()
    for _, v in next, servPlayer:GetPlayers() do
        if v ~= currPlayer and not isSameTeam(v) and not isDead(v) then
    
    
           
                    v.Character[getgenv().Hitbox.Settings.hitpart].Size = Vector3.new(getgenv().Hitbox.Settings.hitsize, getgenv().Hitbox.Settings.hitsize, getgenv().Hitbox.Settings.hitsize)
                    v.Character[getgenv().Hitbox.Settings.hitpart].Transparency = getgenv().Hitbox.Settings.transparency
                    v.Character[getgenv().Hitbox.Settings.hitpart].BrickColor = BrickColor.new("Really blue")
                    v.Character[getgenv().Hitbox.Settings.hitpart].Material = "Neon"
                    v.Character[getgenv().Hitbox.Settings.hitpart].CanCollide = false
        end
    end
    end)
end)

tab:Toggle("杀死所有(狙击枪)", false, function(state)
    local servPlayer = game:GetService("Players")
    local currPlayer = game:GetService('Players').LocalPlayer
    
    function getEquippedWeapon(player)
        local char = player.Character
        local weapon = char and char:FindFirstChildWhichIsA("Tool")
    
        if weapon ~= nil then
            return weapon.Name
        else
            return "Holstered"
        end
    end
    
    local currWeapon = getEquippedWeapon(currPlayer)
    
    for _, v in pairs(servPlayer:GetPlayers()) do
        if v.Name ~= currPlayer.Name then
            task.wait(1)
    local args = {
        [1] = game:GetService("Players").LocalPlayer.Character[currWeapon],
        [2] = {
            ["p"] = Vector3.new(127.24491882324219, 16.624034881591797, -84.08683776855469),
            ["pid"] = 1,
            ["part"] = v.Character.Head,
            ["d"] = 80.71643829345703,
            ["maxDist"] = 80.71429443359375,
            ["h"] = v.Character.Humanoid,
            ["m"] = Enum.Material.SmoothPlastic,
            ["sid"] = 1,
            ["t"] = 0.8510603182300679,
            ["n"] = Vector3.new(-0.20354677736759186, -0.016248714178800583, 0.9789304733276367)
        }
    }
    
    if state == true then
    game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
    end
    end
    end
end)