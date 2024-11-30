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
local win = UILib:Window("King Script丨奶酪逃亡",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为奶酪逃亡脚本")

local tab = win:Tab("主要功能")
tab:Label("锁门密码: 3842")
tab:Button("获取所有奶酪", function()
            for _, v in pairs (game.Workspace.FindCheese:GetDescendants())do
              if v.Name == 'Cheese' then
                fireclickdetector(v.ClickDetector)
              end
            end
          end)

tab:Button("打开所有门", function()
            local toggle = off
            wait()
            toggle = on
            repeat wait()
              fireclickdetector(game.Workspace.Cheese.ClickDetector)
            until toggle
          end)

tab:Button("出生点", function()
            game.Players.LocalPlayer.Character:MoveTo(game.Workspace.SpawnLocation.Position)
          end)

tab:Button("安全区", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-73.6963, 4.2, -109.536))
          end)

          tab:Button("奶酪1", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-264.393, 4.19329, -56.25))
          end)

          tab:Button("奶酪2", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-275.163, 4.19329, -149.3))
          end)

          tab:Button("奶酪3", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-271.628, 4.19329, -33.53))
          end)

          tab:Button("安全区", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-272.487, 48.5, -150.641))
          end)

          tab:Button("奶酪4", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-205.069, 4.19329, -180.7))
          end)

          tab:Button("跑酷", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-25.2942, 100.5, -1037.5))
          end)

          tab:Button("离开", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-24.3932, 5, 24.3302))
          end)

          tab:Button("锁定区域", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-220.522, 4, -452.123))
          end)

          tab:Button("地下室", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(-88.9135, 4, -451.278))
          end)

          tab:Button("终点", function()
            game.Players.LocalPlayer.Character:MoveTo(Vector3.new(1758.41, 57, -137.61))
          end)
