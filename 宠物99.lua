local SafeSpot = Instance.new("Part", workspace)

          SafeSpot.Position = Vector3.new(-1860.61,-399.9,927.21)

          SafeSpot.Name = "Vip"

          SafeSpot.Size = Vector3.new(0,0.1,0)

          SafeSpot.Anchored = true

          SafeSpot.Transparency = 1


          local SafeSpot = Instance.new("Part", workspace)

          SafeSpot.Position = Vector3.new(-1920.71,-399.9,929.66)

          SafeSpot.Name = "Laaabby"

          SafeSpot.Size = Vector3.new(0,0.1,0)

          SafeSpot.Anchored = true

          SafeSpot.Transparency = 1


          local SafeSpot = Instance.new("Part", workspace)

          SafeSpot.Position = Vector3.new(-0.81,1,-7.31)

          SafeSpot.Name = "Game"

          SafeSpot.Size = Vector3.new(0,0.1,0)

          SafeSpot.Anchored = true

          SafeSpot.Transparency = 1

          local Players = game:GetService("Players")
          local ReplicatedStorage = game:GetService("ReplicatedStorage")
          local VirtualUser = game:GetService("VirtualUser")

          local LocalPlayer = Players.LocalPlayer

          getgenv().Settings = {
            Win = false,
            Rebirth = false,
          }

          function getHash()
            for _, v in pairs(game:GetService("Workspace").PlayerTycoons:GetDescendants()) do
              if v:IsA("ObjectValue") and v.Name == "Owner" then
                if tostring(v.Value) == game.Players.LocalPlayer.Name then
                  return (v.Parent.Parent.Name)
                end
              end
            end
          end

          local Settings = {
            Names = false,
          }
          local RunService = game:GetService("RunService")
          local UserInputService = game:GetService("UserInputService")
          local Camera = game:GetService("Workspace").CurrentCamera
          local Players = game:GetService("Players")
          local Player = Players.LocalPlayer
          local Mouse = Player:GetMouse()

          local msg = Instance.new("Message",workspace)
          msg.Text = "欢迎使用HACKER脚本！"
          wait(1.8)
          msg:Destroy()
          local msg = Instance.new("Message",workspace)
          msg.Text = "制作者:HACKER"
          wait(1.8)
          msg:Destroy()
          local msg = Instance.new("Message",workspace)
          msg.Text = "当前宠物模拟器99"
          wait(3)
          msg:Destroy()
          local OrionLib = loadstring(game:HttpGet("https://raw.githubusercontent.com/Hunryn/VB/main/OrionLib.ui.lua"))()
          local Window = OrionLib:MakeWindow({Name = "King脚本", IntroIcon = "rbxassetid://11354741327", HidePremium = false, SaveConfig = true,IntroText = "King脚本", ConfigFolder = "King脚本"})
          local about = Window:MakeTab({
            Name = "公告",
            Icon = "rbxassetid://17015137366",
            PremiumOnly = false
          })
          about:AddParagraph("I got nothing to lose","不知不觉夏去秋来")
          about:AddParagraph("作者: King")
          about:AddParagraph("副作者: 红鲨")
          about:AddParagraph("制作者: King")

          local Tab = Window:MakeTab({
            Name = "宠物模拟器99",
            Icon = "rbxassetid://17015137366",
            PremiumOnly = false
          })
          Tab:AddToggle({
            Name = "自动收集",
            Default = false,
            Callback = function(state)
              _G.test = (state and true or false)
              while _G.test do
                wait()
                if workspace.__THINGS.Lootbags:FindFirstChildOfClass("Model") then
                  for i,v in pairs(workspace.__THINGS.Lootbags:GetChildren()) do
                    if v.ClassName == "Model" then
                      local test = v:FindFirstChildOfClass("MeshPart") or v:FindFirstChildOfClass("Part")
                      test.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                  end
                 elseif workspace.__THINGS.Orbs:FindFirstChildOfClass("Part") then
                  for i,v in pairs(workspace.__THINGS.Orbs:GetChildren()) do
                    if v.ClassName == "Part" then
                      v.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame
                    end
                  end
                end
              end
            end
          })

          Tab:AddToggle({
            Name = "自动农场",
            Default = false,
            Callback = function(state)
              _G.test2 = (state and true or false)
              _G.range = 100
              while _G.test2 do
                task.wait()
                pcall(function()
                  for i,v in pairs(workspace.__THINGS.Breakables:GetChildren()) do
                    if v.ClassName == "Model" and game:GetService("Players").LocalPlayer:DistanceFromCharacter(v:GetChildren()[1].Position) < _G.range then
                      print(v.PrimaryPart)
                      game:GetService("ReplicatedStorage").Network.Breakables_PlayerDealDamage:FireServer(v.Name)
                      task.wait()
                    end
                  end
                end)
              end
            end
          })
          Tab:AddToggle({
            Name = "自动领取排名奖励",
            Default = false,
            Callback = function(state)
              _G.reward = (state and true or false)
              while _G.reward do
                wait()
                for i=1,32 do
                  game:GetService("ReplicatedStorage").Network.Ranks_ClaimReward:FireServer(i)
                  task.wait(0.1)
                end
              end
            end
          })
