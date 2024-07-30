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
local win = UILib:Window("King Script丨忍者传奇",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为忍者传奇脚本")

local tab = win:Tab("主要功能")
local tab2 = win:Tab("其他功能")
local tab3 = win:Tab("传送岛屿")

tab:Toggle("自动挥舞", false, function(v)
    if v or not v then
        getgenv().autoswing = v
            while true do
                if not getgenv().autoswing then return end
                for _,v in pairs(game.Players.LocalPlayer.Backpack:GetChildren()) do
                    if v:FindFirstChild("ninjitsuGain") then
                        game.Players.LocalPlayer.Character.Humanoid:EquipTool(v)
                        break
                    end
                end
                local A_1 = "swingKatana"
                local Event = game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(A_1)
                wait()
            end
        end
end)

tab:Toggle("自动售卖", false, function(v)
    getgenv().autosell = v
        while true do
            if not getgenv().autosell then return end
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
            wait(0.1)
            game:GetService("Workspace").sellAreaCircles["sellAreaCircle16"].circleInner.CFrame = CFrame.new(0,0,0)
            wait(0.1)
        end
    end)

tab:Toggle("存满自动售卖", false, function(x)
		autosellmax = x
		if autosellmax then
			maxsell()
		end
end)

tab:Toggle("自动购买排名", false, function(v)
    getgenv().autobuyranks = v
        while true do
            if not getgenv().autobuyranks then return end
            local deku1 = "buyRank"
            for i = 1, #ranks do
                game:GetService("Players").LocalPlayer.ninjaEvent:FireServer(deku1, ranks[i])
            end
            wait(0.1)
        end
end)

tab:Toggle("自动购买腰带", false, function(v)
    getgenv().autobuybelts = v
        while true do
            if not getgenv().autobuybelts then return end
            local A_1 = "buyAllBelts"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
end)

tab:Toggle("自动购买技能", false, function(v)
    getgenv().autobuyskills = v
        while true do
            if not getgenv().autobuyskills then return end
            local A_1 = "buyAllSkills"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
end)

tab:Toggle("自动购买剑", false, function(v)
    getgenv().autobuy = v
        while true do
            if not getgenv().autobuy then return end
            local A_1 = "buyAllSwords"
            local A_2 = "Inner Peace Island"
            local Event = game:GetService("Players").LocalPlayer.ninjaEvent
            Event:FireServer(A_1, A_2)
            wait(0.5)
        end
end)

tab2:Button("解锁所有岛屿", function()
    for _,v in pairs(game:GetService("Workspace").islandUnlockParts:GetChildren()) do
        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,0)
        firetouchinterest(game.Players.LocalPlayer.Character:FindFirstChild("HumanoidRootPart"),v,1)
        end
end)

local Elements = {}
    for i,v in pairs(game:GetService("ReplicatedStorage").Elements:GetChildren()) do
       table.insert(Elements,v.Name)
    end

tab2:Button("解锁所有元素", function()
    for i,v in pairs(Elements) do
        game.ReplicatedStorage.rEvents.elementMasteryEvent:FireServer(v)
        print(v)
        end
end)
tab2:Button("获取所有宝箱", function()
    game:GetService("Workspace").mythicalChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").goldenChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").enchantedChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").magmaChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").legendsChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").eternalChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").saharaChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").thunderChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").ancientChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").groupRewardsCircle["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace")["Daily Chest"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace")["wonderChest"].circleInner.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		wait(3.5)
		game:GetService("Workspace").wonderChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
		game:GetService("Workspace").ancientChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").midnightShadowChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").thunderChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").saharaChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").eternalChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").legendsChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").magmaChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").enchantedChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").goldenChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").mythicalChest["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace").groupRewardsCircle["circleInner"].CFrame = game.Workspace.Part.CFrame
		game:GetService("Workspace")["Daily Chest"].circleInner.CFrame = game.Workspace.Part.CFrame
end)

tab3:Button("出生点", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(25.665502548217773, 3.4228405952453613, 29.919952392578125)
end)

tab3:Button("附魔岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(51.17238235473633, 766.1807861328125, -138.44842529296875)
end)

tab3:Button("星界岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(207.2932891845703, 2013.88037109375, 237.36672973632812)
end)

tab3:Button("神秘岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(171.97178649902344, 4047.380859375, 42.0699577331543)
end)

tab3:Button("太空岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.83824157714844, 5657.18505859375, 73.5014877319336)
end)

tab3:Button("冻土岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(139.28330993652344, 9285.18359375, 77.36406707763672)
end)

tab3:Button("永恒岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(149.34817504882812, 13680.037109375, 73.3861312866211)
end)

tab3:Button("沙暴岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(133.37144470214844, 17686.328125, 72.00334167480469)
end)

tab3:Button("雷暴岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(143.19349670410156, 24070.021484375, 78.05432891845703)
end)

tab3:Button("远古炼狱岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.27163696289062, 28256.294921875, 69.3790283203125)
end)

tab3:Button("午夜暗影岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(132.74267578125, 33206.98046875, 57.495574951171875)
end)

tab3:Button("神秘灵魂岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.76148986816406, 39317.5703125, 61.06639862060547)
end)

tab3:Button("冬季奇迹岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.2720184326172, 46010.5546875, 55.941951751708984)
end)

tab3:Button("黄金大师岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(128.32339477539062, 52607.765625, 56.69411849975586)
end)

tab3:Button("龙传奇岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(146.35226440429688, 59594.6796875, 77.53300476074219)
end)

tab3:Button("赛博传奇岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(137.3321075439453, 66669.1640625, 72.21722412109375)
end)

tab3:Button("天岚超能岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.48077392578125, 70271.15625, 57.02311325073242)
end)

tab3:Button("混沌传奇岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(148.58590698242188, 74442.8515625, 69.3177719116211)
end)

tab3:Button("灵魂融合岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(136.9700927734375, 79746.984375, 58.54051971435547)
end)

tab3:Button("黑暗元素岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(141.697265625, 83198.984375, 72.73107147216797)
end)

tab3:Button("内心和平岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.3157501220703, 87051.0625, 66.78429412841797)
end)

tab3:Button("炽烈漩涡岛", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(135.08216857910156, 91246.0703125, 69.56692504882812)
end)

tab3:Button("35倍金币区域", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(86.2938232421875, 91245.765625, 120.54232788085938)
end)

tab3:Button("传送至死亡宠物", function()
		game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(4593.21337890625, 130.87181091308594, 1430.2239990234375)
end)
