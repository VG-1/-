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
local win = UILib:Window("King Script丨巴掌模拟器",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("King介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为巴掌模拟器脚本")

local Player = win:Tab("主要功能")
local Main = win:Tab("娱乐功能")
local Anti = win:Tab("防技能的")
local About = win:Tab("关于作者")

Player:Button("获取计数器手套", function()
fireclickdetector(game.Workspace.CounterLever.ClickDetector)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(0,100,0)
wait(0.2)
game.Players.LocalPlayer.Character.HumanoidRootPart.Anchored = true
wait(121)
for i,v in pairs(workspace.Maze:GetDescendants()) do
if v:IsA("ClickDetector") then
fireclickdetector(v)
end
end
end)

Player:Toggle("地牢亮度", false, function(Value)
 Light = Value
    if not Light then
        game.Lighting.Ambient = Color3.new(0, 0, 0)
    end
end)

Player:Dropdown("传送",{"安全区","竞技场","埃及岛","果实岛","盘子","锦标赛","默认竞技场"},function(Value)
if Value == "安全区" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Spot.CFrame * CFrame.new(0,40,0)
elseif Value == "竞技场" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Origo.CFrame * CFrame.new(0,-5,0)
elseif Value == "埃及岛" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(215, -15.5, 0.5)
elseif Value == "果实岛" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.workspace.Arena.island5.Union.CFrame * CFrame.new(0,3.25,0)
elseif Value == "盘子" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Arena.Plate.CFrame * CFrame.new(0,2,0)
elseif Value == "锦标赛" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = workspace.Battlearena.Arena.CFrame * CFrame.new(0,10,0)
elseif Value == "默认竞技场" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(120,360,-3)
end
end)

Player:Toggle("复古技能", false, function(Value)
RetroSpam = Value
while RetroSpam do
game:GetService("ReplicatedStorage").RetroAbility:FireServer(RetroAbility)
task.wait()
end
end)

Player:Dropdown("复古技能选择",{"Rocket Launcher","Ban Hammer","Bomb"}, function(Value)
RetroAbility = Value
end)

Player:Toggle("获取炼金术师材料", false, function(Value)
AlchemistIngredients = Value
if game.Players.LocalPlayer.leaderstats.Glove.Value == "Alchemist" then
while AlchemistIngredients do
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Glowing Mushroom")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Fire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Winter Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dark Root")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Dire Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Autumn Sprout")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Elder Wood")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Hazel Lily")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Wild Vine")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Jade Stone")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Lamp Grass")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Plane Flower")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blood Rose")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Red Crystal")
game.ReplicatedStorage.AlchemistEvent:FireServer("AddItem","Blue Crystal")
task.wait()
end
end
end)

Player:Toggle("自动加入竞技场", false, function(Value)
AutoEnterArena = Value
while AutoEnterArena do
if game.Players.LocalPlayer.Character:FindFirstChild("entered") == nil and game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), workspace.Lobby.Teleport1, 1)
    end
task.wait()
end
end)

Player:Toggle("自动光波球", false, function(Value)
if Person == nil then
Person = game.Players.LocalPlayer.Name
end
_G.RojoSpam = Value
while _G.RojoSpam do
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players[Person].Character.HumanoidRootPart.CFrame})
task.wait()
end
end)

Player:Button("Rojo技能", function(Value)
_G.RojoSpam = Value
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Charge")
wait(6)
game:GetService("ReplicatedStorage"):WaitForChild("RojoAbility"):FireServer("Release", {game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame})
task.wait()
end)

Player:Toggle("音符技能", false, function(Value)
_G.RhythmSpam = Value
while _G.RhythmSpam do
game:GetService("ReplicatedStorage").rhythmevent:FireServer("AoeExplosion",0)
task.wait()
end
end)

Player:Toggle("Null技能", false, function(Value)
NullSpam = Value
while NullSpam do
game:GetService("ReplicatedStorage").NullAbility:FireServer()
task.wait()
end
end)

Main:Toggle("自动拾取黄金果实", false, function(Value)
SlappleFarm = Value
while SlappleFarm do
for i, v in ipairs(workspace.Arena.island5.Slapples:GetDescendants()) do
                if game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart") and game.Players.LocalPlayer.Character:FindFirstChild("entered") and v.Name == "Glove" and v:FindFirstChildWhichIsA("TouchTransmitter") then
                    firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 0)
        firetouchinterest(game.Players.LocalPlayer.Character.HumanoidRootPart, v, 1)
                end
            end
task.wait()
end
end)

Main:Toggle("自动捡飞行宝珠", false, function(Value)
Jetfarm = Value
while Jetfarm do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "JetOrb" and v:FindFirstChild("TouchInterest") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
task.wait()
end
end)

Main:Toggle("自动捡相位球", false, function(Value)
Phasefarm = Value
while Phasefarm do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "PhaseOrb" and v:FindFirstChild("TouchInterest") then
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 0)
firetouchinterest(game.Players.LocalPlayer.Character:WaitForChild("Head"), v, 1)
                    end
                end
task.wait()
end
end)

Main:Toggle("自动刷bob", false, function(Value)
ReplicaFarm = Value
while ReplicaFarm do
for i, v in pairs(workspace:GetChildren()) do
                if v.Name:match(game.Players.LocalPlayer.Name) and v:FindFirstChild("HumanoidRootPart") then
game.ReplicatedStorage.b:FireServer(v:WaitForChild("HumanoidRootPart"))
                end
            end
task.wait()
game:GetService("ReplicatedStorage").Duplicate:FireServer()
task.wait(7)
end
end)

Main:Toggle("无限反转", false, function(Value)
_G.InfReverse = Value
while _G.InfReverse do
game:GetService("ReplicatedStorage").ReverseAbility:FireServer()
wait(6)
end
end)

Main:Toggle("彩虹角色(装备黄金手套)", false, function(Value)
_G.Rainbow = Value
while _G.Rainbow do
for i = 0,1,0.001*25 do
game:GetService("ReplicatedStorage").Goldify:FireServer(false, BrickColor.new(Color3.fromHSV(i,1,1)))
task.wait()
end
end
end)

Anti:Toggle("管理员预警(反管理员)", false, function(Value)
AntiAdmins = Value
while AntiAdmins do
for i,v in pairs(game.Players:GetChildren()) do
                    if v:GetRankInGroup(9950771) >= 2 then
AntiKick = false
                        game.Players.LocalPlayer:Kick("High Rank Player Detected.".." ("..v.Name..")")
                        break
                    end
                end
task.wait()
end
end)

Anti:Toggle("防踢", false, function(Value)
AntiKick = Value
while AntiKick do
for i,v in pairs(game.CoreGui.RobloxPromptGui.promptOverlay:GetDescendants()) do
                    if v.Name == "ErrorPrompt" then
AK:Set(false)
game:GetService("TeleportService"):TeleportToPlaceInstance(game.PlaceId, game.JobId, game.Players.LocalPlayer)
                    end
                end
task.wait()
end
end)

Anti:Toggle("防击飞", false, function(Value)
AntiRagdoll = Value
if AntiRagdoll then
game.Players.LocalPlayer.Character.Humanoid.Health = 0
game.Players.LocalPlayer.CharacterAdded:Connect(function()
game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Changed:Connect(function()
if game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == true and AntiRagdoll then
repeat task.wait() game.Players.LocalPlayer.Character.Torso.Anchored = true
until game.Players.LocalPlayer.Character:WaitForChild("Ragdolled").Value == false
game.Players.LocalPlayer.Character.Torso.Anchored = false
end
end)
end)
end
end)

Anti:Toggle("反虚空(锦标赛也有效果)", false, function(Value)
game.Workspace.dedBarrier.CanCollide = Value
game.Workspace.TAntiVoid.CanCollide = Value
end)

Anti:Toggle("防死亡屏障", false, function(Value)
if Value == true then
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = false
                    end
                end
workspace.DEATHBARRIER.CanTouch = false
workspace.DEATHBARRIER2.CanTouch = false
workspace.dedBarrier.CanTouch = false
workspace.ArenaBarrier.CanTouch = false
workspace.AntiDefaultArena.CanTouch = false
else
for i,v in pairs(game.Workspace.DEATHBARRIER:GetChildren()) do
                    if v.ClassName == "Part" and v.Name == "BLOCK" then
                        v.CanTouch = true
                    end
                end
workspace.DEATHBARRIER.CanTouch = true
workspace.DEATHBARRIER2.CanTouch = true
workspace.dedBarrier.CanTouch = true
workspace.ArenaBarrier.CanTouch = true
workspace.AntiDefaultArena.CanTouch = true
end
end)

Anti:Toggle("反巴西", false, function(Value)
if Value == true then
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = false
                end
else
for i,v in pairs(game.Workspace.Lobby.brazil:GetChildren()) do
                        v.CanTouch = true
                end
end
end)

Anti:Toggle("反死亡方块", false, function(Value)
if Value == true then
        workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = false
        else
                workspace.Arena.CubeOfDeathArea["the cube of death(i heard it kills)"].CanTouch = true
        end
end)

Anti:Toggle("反上帝技能", false, function(Value)
AntiTimestop = Value
while AntiTimestop do
                for i,v in pairs(game.Players.LocalPlayer.Character:GetChildren()) do
                    if v.ClassName == "Part" then
                        v.Anchored = false
                    end
                end
task.wait()
end
end)

Anti:Toggle("反鱿鱼", false, function(Value)
AntiSquid = Value
if AntiSquid == false then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = true
        end
while AntiSquid do
if game.Players.LocalPlayer.PlayerGui:FindFirstChild("SquidInk") then
        game.Players.LocalPlayer.PlayerGui.SquidInk.Enabled = false
end
task.wait()
end
end)

Anti:Toggle("反神圣杰克", false, function(Value)
game.Players.LocalPlayer.PlayerScripts.HallowJackAbilities.Disabled = Value
end)

Anti:Toggle("反传送带", false, function(Value)
game.Players.LocalPlayer.PlayerScripts.ConveyorVictimized.Disabled = Value
end)

Anti:Toggle("反板砖", false, function(Value)
AntiBrick = Value
while AntiBrick do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Union" then
                        v.CanTouch = false
                    end
                end
task.wait()
end
end)

Anti:Toggle("反Null", false, function(Value)
AntiNull = Value
while AntiNull do
for i,v in pairs(game.Workspace:GetChildren()) do
                    if v.Name == "Imp" and v:FindFirstChild("Body") then
shared.gloveHits[game.Players.LocalPlayer.leaderstats.Glove.Value]:FireServer(v.Body,true)
end
end
task.wait()
end
end)

About:Label("作者:King")
About:Button("复制作者QQ", function()
    setclipboard("2673430159")
end)
