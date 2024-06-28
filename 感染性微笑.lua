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
local win = UILib:Window("King Script丨感染力微笑",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为感染力微笑脚本")

local Tab = win:Tab("主要功能")
local infes = win:Tab("次要功能")
local LIN = win:Tab("作者信息")

Tab:Toggle("自动抓(微笑)", false, function(Value)
    getgenv().InfectAura = Value
        if getgenv().InfectAura then
            getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
                end)
            end)
        else
            if getgenv().InfectAuraConnection then
                getgenv().InfectAuraConnection:Disconnect()
                getgenv().InfectAuraConnection = nil
            end
        end
end)

Tab:Textbox("输入速度",true, function(Value)
    getgenv().SlowDownSpeed = Value
end)

Tab:Toggle("开启微笑速度", false, function(Value)
    getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
        getgenv().NoSlowDown = Value
        if getgenv().NoSlowDown then
            SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
                end)
            end)
        else
            if SteppedConnection then
                SteppedConnection:Disconnect()
                SteppedConnection = nil
            end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
end)

Tab:Toggle("自动棒球棍击打", false, function(Value)
    getgenv().HitAura = Value
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bat = character:FindFirstChildOfClass("Tool")
                        if bat and bat.Name == "Bat" and bat:FindFirstChild("SwingEvent") then
                            bat.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)


Tab:Toggle("自动玻璃瓶击打", false, function(Value)
    getgenv().HitAura = Value
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bottle = character:FindFirstChildOfClass("Tool")
                        if bottle and bottle.Name == "Bottle" and bottle:FindFirstChild("SwingEvent") then
                            bottle.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)

Tab:Toggle("玩家透视", false, function(val)
    getgenv().enabled = val
        getgenv().uselocalplayer = false
        getgenv().filluseteamcolor = false
        getgenv().outlineuseteamcolor = false
        getgenv().fillcolor = Color3.new(190, 190, 0)
        getgenv().outlinecolor = Color3.new(190, 190, 0)
        getgenv().filltrans = 0.8
        getgenv().outlinetrans = 0.8

        local holder = game.CoreGui:FindFirstChild("ESPHolder") or Instance.new("Folder")
        holder.Name = "ESPHolder"
        holder.Parent = game.CoreGui
        holder.RobloxLocked = false

        if enabled == false then
            holder:Destroy()
        end

        if uselocalplayer == false and holder:FindFirstChild(game.Players.LocalPlayer.Name) then
            holder:FindFirstChild(game.Players.LocalPlayer.Name):Destroy()
        end

        while getgenv().enabled do
            task.wait()
            for _,v in pairs(game.Players:GetChildren()) do
                local chr = v.Character
                if chr ~= nil then
                    local esp = holder:FindFirstChild(v.Name) or Instance.new("Highlight")
                    esp.Name = v.Name
                    if uselocalplayer == false and esp.Name == game.Players.LocalPlayer.Name then
                    else
                        esp.Parent = holder
                        if filluseteamcolor then
                            esp.FillColor = v.TeamColor.Color
                        else
                            esp.FillColor = fillcolor 
                        end
                        if outlineuseteamcolor then
                            esp.OutlineColor = v.TeamColor.Color
                        else
                            esp.OutlineColor = outlinecolor    
                        end
                        esp.FillTransparency = filltrans
                        esp.OutlineTransparency = outlinetrans
                        esp.Adornee = chr
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    end
                end
            end
        end
end)

Tab:Button("获取武器", function()
local previousCFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
local destinationCFrame = CFrame.new(-19, -3, -17) 
        local humanoidRootPart = game.Players.LocalPlayer.Character.HumanoidRootPart
        humanoidRootPart.CFrame = destinationCFrame 
    wait()
        firetouchinterest(humanoidRootPart, game.Workspace.Map.HumanBase.Vendor.BatCollection.HitBox, 0) 
        firetouchinterest(humanoidRootPart, game.Workspace.Map.HumanBase.Vendor.BatCollection.HitBox, 1) 
        fireclickdetector(game.Workspace.Map.HumanBase.Vendor.BatCollection.ClickDetector)
        wait(0.111111) 
        humanoidRootPart.CFrame = previousCFrame 
end)
infes:Button("防止微笑感染",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"Infector") then
v:Destroy()
end
end
end)
infes:Button("删除门",function()
for _,v in pairs(game.workspace:GetDescendants()) do

if string.find(v.Name,"AntiSmiler") then
v:Destroy()
end
end
end)
infes:Button("反外挂",function()
workspace.Map.AntiHack:Destroy() game.Players.LocalPlayer.Character.AntiFly:Destroy()
end)
infes:Toggle("速度-微笑感染","text",false,function(s)
getgenv().SlowDownSpeed = getgenv().SlowDownSpeed or 16
        getgenv().NoSlowDown = Value
        if getgenv().NoSlowDown then
            SteppedConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = getgenv().SlowDownSpeed
                end)
            end)
        else
            if SteppedConnection then
                SteppedConnection:Disconnect()
                SteppedConnection = nil
            end
            game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = 16
        end
end)
infes:Toggle("打击微笑感染","text",false,function(s)
getgenv().InfectAura = Value
        if getgenv().InfectAura then
            getgenv().InfectAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    game:GetService("Players").LocalPlayer.Character.Infected.InfectEvent:FireServer()
                end)
            end)
        else
            if getgenv().InfectAuraConnection then
                getgenv().InfectAuraConnection:Disconnect()
                getgenv().InfectAuraConnection = nil
            end
        end
end)
infes:Toggle("Bat自动打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bat = character:FindFirstChildOfClass("Tool")
                        if bat and bat.Name == "Bat" and bat:FindFirstChild("SwingEvent") then
                            bat.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)
infes:Toggle("瓶子自动打击","text",false,function(s)
getgenv().HitAura = s
        if getgenv().HitAura then
            getgenv().HitAuraConnection = game:GetService("RunService").Stepped:Connect(function()
                pcall(function()
                    local character = game:GetService("Players").LocalPlayer.Character
                    if character then
                        local bottle = character:FindFirstChildOfClass("Tool")
                        if bottle and bottle.Name == "Bottle" and bottle:FindFirstChild("SwingEvent") then
                            bottle.SwingEvent:FireServer()
                        end
                           if packedice and packedice.Name == "Packed Ice" and packedice:FindFirstChild("SwingEvent") then
                           packedice.SwingEvent:FireServer()
                        end
                    end
                end)
            end)
        else
            if getgenv().HitAuraConnection then
                getgenv().HitAuraConnection:Disconnect()
                getgenv().HitAuraConnection = nil
            end
        end
end)

LIN:Label("作者现在叫King")
LIN:Label("作者原名是霖溺")
LIN:Button("点击复制QQ群", function()
setclipboard("霖溺群http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=xQZLbJAlQUT3vAjKtJVFHHDe9LyXnRdf&authKey=3G%2B9tCOh6DW2bya84ujgbOzNFTb8QHm8EJMkp5ho%2BWSc01ZsmVzLc5VPF%2FW1AdSt&noverify=0&group_code=744830231")
end)