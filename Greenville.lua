LocalPlayer = game:GetService("Players").LocalPlayer
          Camera = workspace.CurrentCamera
          RunService = game:GetService("RunService")
          VirtualUser = game:GetService("VirtualUser")
          MarketplaceService = game:GetService("MarketplaceService")

          function GetCurrentVehicle()
            return LocalPlayer.Character and LocalPlayer.Character:FindFirstChild("Humanoid") and LocalPlayer.Character.Humanoid.SeatPart and LocalPlayer.Character.Humanoid.SeatPart.Parent
          end
          MT = getrawmetatable(game)
          Old_Index = MT.__index
          setreadonly(MT, false)
          MT.__index = newcclosure(function(self, K)
            if self:IsA("Sound") and self:IsDescendantOf(workspace.SessionVehicles) and AntiSkidMarkSounds then
              self:Stop()
              return
            end
            return Old_Index(self, K)
          end)
          setreadonly(MT, true)
          function TP(cframe)
            GetCurrentVehicle():SetPrimaryPartCFrame(cframe)
          end
          function VelocityTP(cframe)
            TeleportSpeed = 500
            Car = GetCurrentVehicle()
            for I,V in pairs(GetCurrentVehicle():GetDescendants()) do
              if V:IsA("BodyGyro") then
                V:Destroy()
              end
            end
            local BodyGyro = Instance.new("BodyGyro", Car.PrimaryPart)
            BodyGyro.P = 5000
            BodyGyro.maxTorque = Vector3.new(9e9, 9e9, 9e9)
            BodyGyro.CFrame = Car.PrimaryPart.CFrame
            local BodyVelocity = Instance.new("BodyVelocity", Car.PrimaryPart)
            BodyVelocity.MaxForce = Vector3.new(9e9, 9e9, 9e9)
            BodyVelocity.Velocity = CFrame.new(Car.PrimaryPart.Position, cframe.p).LookVector * TeleportSpeed
            wait((Car.PrimaryPart.Position - cframe.p).Magnitude / TeleportSpeed)
            BodyVelocity.Velocity = Vector3.new()
            wait(0.1)
            BodyVelocity:Destroy()
            BodyGyro:Destroy()
          end

          --Auto Farm
          StartPosition = CFrame.new(Vector3.new(-1818, -79, -10685), Vector3.new(-880, -79, -10769))
          EndPosition = CFrame.new(Vector3.new(-965, -79, -10761), Vector3.new(-880, -79, -10769))
          AutoFarmFunc = coroutine.create(function()
            while wait() do
              if not AutoFarm then
                AutoFarmRunning = false
                coroutine.yield()
              end
              AutoFarmRunning = true
              pcall(function()
                if not GetCurrentVehicle() and tick() - (LastNotif or 0) > 5 then
                  LastNotif = tick()
                  SendNotification("Aloha Scripts", "Please Enter A Vehicle!")
                 else
                  TP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                  VelocityTP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                  TP(EndPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                  VelocityTP(StartPosition + (TouchTheRoad and Vector3.new() or Vector3.new(0, 1, 0)))
                end
              end)
            end
          end)

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
local win = UILib:Window("King Script丨格林维尔",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为格林维尔脚本")

local tab = win:Tab("主要功能")
tab:Toggle("自动驾驶", false, function(value)
            AutoFarm = value
            if value and not AutoFarmRunning then
              coroutine.resume(AutoFarmFunc)
            end
 end)
tab:Toggle("触摸地面", false, function(value)
            TouchTheRoad = value
          end)
