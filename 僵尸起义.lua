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
local win = UILib:Window("King Script丨僵尸起义",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为僵尸起义脚本")

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