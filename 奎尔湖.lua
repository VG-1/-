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
local win = UILib:Window("King Script丨奎尔湖",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为奎尔湖脚本")

local tab = win:Tab("主要功能")
tab:Toggle("无敌模式", false, function(Value)
            game.ReplicatedStorage.DamageHumanoid:FireServer(-2e9)
  end)
  tab:Button("无限金钱", function()
            local money = {
              [1] = -9999,
              [2] = "Buy"
            }

            game:GetService("ReplicatedStorage").Pay:FireServer(unpack(money))
          end)
          tab:Button("无限金币", function()
            local gold = {
              [1] = game:GetService("Players").LocalPlayer.GoldCoins,
              [2] = 99999
            }

            game:GetService("ReplicatedStorage").ChangeValue:FireServer(unpack(gold))
          end)

          tab:Button("给所有物品", function()
            game.ReplicatedStorage.GiveTool:FireServer("SeaScooter")
            game.ReplicatedStorage.GiveTool:FireServer("Lantern")
            game.ReplicatedStorage.GiveTool:FireServer("Compass")
            game.ReplicatedStorage.GiveTool:FireServer("ItemFinder")
            game.ReplicatedStorage.GiveTool:FireServer("Aquabreather")
          end)

          tab:Button("红色套装", function()
            game.ReplicatedStorage.ChangeOutfits:FireServer("FireSuit")
          end)

          tab:Button("黄色套装", function()
            game.ReplicatedStorage.ChangeOutfits:FireServer("HazmatSuit")
          end)

          tab:Button("海盗套装", function()
            game.ReplicatedStorage.ChangeOutfits:FireServer("PirateCostume")
          end)

          tab:Button("动力套装", function()
            game.ReplicatedStorage.ChangeOutfits:FireServer("SuperScuba")
          end)
