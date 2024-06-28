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
local win = UILib:Window("King Script丨急速奔驰",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为急速奔驰脚本")

local tab = win:Tab("主要功能")
tab:Toggle("自动跳过1", false, function(bool)
            getgenv().AutoFarmMainFast = bool
            while getgenv().AutoFarmMainFast do
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }
              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)

              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.07)
              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))

              wait(0.1)

              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))

              wait(0.1)
              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))
              wait(1)

            end
          end)

          tab:Toggle("自动跳过2", false, function(bool)
            getgenv().AutoFarmMainSlow = bool

            while getgenv().AutoFarmMainSlow do

              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)
              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)

              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)

              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)



              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)


              local args = {
                [1] = 0.1,
                [2] = "Level 1",
                [3] = "Normal",
                [4] = false
              }

              game:GetService("ReplicatedStorage").BeatLevel:FireServer(unpack(args))
              wait(0.25)
              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))

              wait(0.3)

              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))

              wait(0.3)
              local args = {
                [1] = 0
              }

              game:GetService("ReplicatedStorage").SetLevel:FireServer(unpack(args))
              wait(2.5)

            end
          end)

          tab:Button("获取速度线圈", function()
            local copy = game:GetService("ReplicatedStorage")["Speed Coil"]:Clone()
            copy.Parent = game:GetService("Players").LocalPlayer.Backpack
          end)