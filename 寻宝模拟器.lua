local PhysicsService = game:GetService("PhysicsService")
          local RunService = game:GetService("RunService")
          local MarketplaceService = game:GetService("MarketplaceService")
          local ReplicatedStorage = game:GetService("ReplicatedStorage")
          local Players = game:GetService("Players")
          local VirtualUser = game:GetService("VirtualUser")
          local TeleportService = game:GetService("TeleportService")
          local HttpService = game:GetService("HttpService")

          getgenv().thunt_gui_executed = true
          getgenv().cheat_settings = {}
          getgenv().cheat_settings.autochest = false
          getgenv().cheat_settings.autosell = false
          getgenv().cheat_settings.autobuyshovels = false
          getgenv().cheat_settings.autobuybackpacks = false
          getgenv().cheat_settings.autobuypets = false
          getgenv().cheat_settings.autorebirth = false
          getgenv().cheat_settings.autobuycrates = false
          getgenv().cheat_settings.autoopencrates = false
          getgenv().cheat_settings.gcollide = true
          getgenv().cheat_settings.walkspeed = false
          getgenv().cheat_settings.jumppower = false
          getgenv().cheat_settings.autoserverhop = false
          getgenv().cheat_settings.antiafk = true
          getgenv().cheat_settings.savesettings = false

          getgenv().thunt_data = {}
          getgenv().thunt_data.chests = ReplicatedStorage:WaitForChild("Chests")
          getgenv().thunt_data.crates = ReplicatedStorage:WaitForChild("Crates")
          getgenv().thunt_data.shovels = ReplicatedStorage:WaitForChild("Shovels")
          getgenv().thunt_data.backpacks = ReplicatedStorage:WaitForChild("Backpacks")
          getgenv().thunt_data.pets = ReplicatedStorage:WaitForChild("Pets")
          getgenv().thunt_data.gamepasses = ReplicatedStorage:WaitForChild("Gamepasses")
          getgenv().thunt_data.buy_item = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Checkout")
          getgenv().thunt_data.buy_crate = ReplicatedStorage:WaitForChild("Events"):WaitForChild("BuyCrate")
          getgenv().thunt_data.open_crate = ReplicatedStorage:WaitForChild("Events"):WaitForChild("SendOpenCrate")
          getgenv().thunt_data.rebirth = ReplicatedStorage:WaitForChild("Events"):WaitForChild("Rebirth")
          getgenv().thunt_data.check_if_owned = ReplicatedStorage:WaitForChild("Events"):WaitForChild("CheckIfOwned")

          function thunt_data.getChestNames(with_health)
            local ret_val = {}
            for ind, val in pairs(getgenv().thunt_data.chests:GetChildren()) do
              if with_health then
                ret_val[ind] = val.Name.." ("..val:WaitForChild("Health").Value..")"
               else
                ret_val[ind] = val.Name
              end
            end
            return ret_val
          end

          function thunt_data.getCrateNames()
            local ret_val = {}
            for ind, val in pairs(getgenv().thunt_data.crates:GetChildren()) do
              ret_val[ind] = val.Name
            end
            return ret_val
          end

          getgenv().player_data = {}

          getgenv().cheat_vars = {}
          getgenv().cheat_vars.walkspeed = 16
          getgenv().cheat_vars.jumppower = 50
          getgenv().cheat_vars.servermin = 6
          getgenv().cheat_vars.servermax= 14

          getgenv().cheat_vars.chosen_autobuycrate = {}
          getgenv().cheat_vars.chosen_autoopencrates = {}

          local crates_arr = getgenv().thunt_data.getCrateNames()
          for i,v in pairs(crates_arr) do
            getgenv().cheat_vars.chosen_autobuycrate[v] = false
            getgenv().cheat_vars.chosen_autoopencrates[v] = false
          end


          getgenv().cheat_vars.chosen_autofarm = {}
          local chests_arr = getgenv().thunt_data.getChestNames(true)
          for i,v in pairs(chests_arr) do
            getgenv().cheat_vars.chosen_autofarm[v] = false
          end

          sandblocks = workspace.SandBlocks

          local function saveData()
            if getgenv().player_data["player"] == nil then
              return false
            end
            local table =
            {
              cheat_var = getgenv().cheat_vars,
              cheat_setting = getgenv().cheat_settings
            }
            local json = HttpService:JSONEncode(table)
            makefolder("BongoTHS")
            writefile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt", json)
            return true
          end

          local function loadData()
            if getgenv().player_data["player"] == nil then
              return false
            end
            if(not isfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")) then
              return nil
            end
            local file_content = readfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")
            local table = HttpService:JSONDecode(file_content)
            if table.cheat_setting.savesettings == true then
              getgenv().cheat_vars = table.cheat_var
              getgenv().cheat_settings = table.cheat_setting
            end
            return true
          end

          local function removeData()
            if getgenv().player_data["player"] == nil then
              return false
            end
            if isfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt") then
              delfile("BongoTHSdata_"..getgenv().player_data["player"].Name.."v1.txt")
            end
          end

          -- Other functions
          local function spawnThread(task, ...)
            local cor = coroutine.create(task)
            local success, message = coroutine.resume(cor, ...)
            return cor, success, message
          end

          local function updatePlayerData()
            getgenv().player_data["player"] = Players.LocalPlayer
            getgenv().player_data["character"] = getgenv().player_data["player"].Character or getgenv().player_data["player"].CharacterAdded:Wait()
            getgenv().player_data["humanoid"] = getgenv().player_data["character"]:WaitForChild("Humanoid")
            getgenv().player_data["root"] = getgenv().player_data["character"]:WaitForChild("HumanoidRootPart")
            getgenv().player_data["tool"] = nil
            for ind, val in pairs(getgenv().player_data["player"].Backpack:GetChildren()) do--:WaitForChild("Backpack"):GetChildren()) do
              if val:IsA("Tool") then
                getgenv().player_data["tool"] = val
                break
              end
            end

            if getgenv().player_data["tool"] == nil then
              for ind, val in pairs(getgenv().player_data["character"]:GetChildren()) do
                if val:IsA("Tool") then
                  getgenv().player_data["tool"] = val
                  break
                end
              end
            end
            getgenv().player_data["coins"] = getgenv().player_data["player"].leaderstats.Coins
          end

          local function createInstance(inst, args)
            local instance = Instance.new(inst)
     
            for key, value in pairs(args) do
              instance[key] = value
            end
            return instance
          end

          local function strToVec2(str, char)
            local temp = string.split(str, char)
            return {temp[1], temp[2]}
          end

          updatePlayerData()


          local function serverHop(min_players, max_players)
            local servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100"))
            local teleported = false
            local cursor = ""
            while not teleported do
              if servers.nextPageCursor ~= nil then
                for i,v in pairs(servers.data) do
                  if v.playing < min_players then
                    continue
                  end
                  if v.playing > max_players then
                    continue
                  end
                  teleported = true
                  TeleportService:TeleportToPlaceInstance(game.PlaceId, v.id)
                  break
                end
                if not teleported then
                  cursor = servers.nextPageCursor
                  servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor))
                end
               else
                wait(10)
                servers = HttpService:JSONDecode(game:HttpGet("https://games.roblox.com/v1/games/"..game.PlaceId.."/servers/Public?sortOrder=Asc&limit=100&cursor="..cursor))
              end
              wait(1)
            end
          end

          local function teleportTo(cframe)
            getgenv().player_data["root"].CFrame = cframe
          end

          local function setWalkSpeed(number)
            getgenv().player_data["humanoid"].WalkSpeed = number
          end

          local function setJumpPower(number)
            getgenv().player_data["humanoid"].JumpPower = number
          end

          local function platformStand()
            local args =
            {
              Anchored = true,
              Parent = workspace,
              CFrame = getgenv().player_data["root"].CFrame - Vector3.new(0, 3.6, 0)
            }
            local part = createInstance("Part", args)
            part.TouchEnded:Connect(function(tpart)
              if tpart.Parent == getgenv().player_data["character"] then
                part:Destroy()
              end
            end)
          end
          local function findChest(filters)
            for ind1, part1 in pairs(sandblocks:GetChildren()) do
              if part1:FindFirstChild("Chest") then
                local chest_type = part1:FindFirstChild("Mat")
                if chest_type == nil then
                  continue
                end
                for i,v in pairs(filters) do
                  if v == chest_type.Value or v:match(chest_type.Value) then
                    return part1
                  end
                end
              end
            end
            return nil
          end
          local function getFirstBlock()
            local children = sandblocks:GetChildren()
            for i,v in pairs(children) do
              if v:FindFirstChild("Rock") == nil or v:FindFirstChild("Chest") == nil then
                --return v
              end
            end
            return nil
          end
          local function digBlock(block)
            while getgenv().player_data["tool"] == nil do
              updatePlayerData()
              wait()
            end
            while(getgenv().player_data["tool"].Parent ~= getgenv().player_data["character"] and getgenv().player_data["tool"].Parent ~= getgenv().player_data["player"].Backpack) do
              updatePlayerData()
              wait()
            end
            getgenv().player_data["humanoid"]:EquipTool(getgenv().player_data["tool"])

            getgenv().player_data["tool"]:FindFirstChild("RemoteClick"):FireServer(block)
          end

          local function checkMaxBackpack()
            local amount = getgenv().player_data["player"].PlayerGui.Gui.Buttons.Sand.Amount
            local backpack_status = strToVec2(Amount.Text, " / ")
            return backpack_status[1] == backpack_status[2]
          end


          local function sell()
            while checkMaxBackpack() do
           
              teleportTo(CFrame.new(2201, 10, -254))
              wait(1)
            end
          end
          local function sellReturn()
            local cframe = getgenv().player_data["root"].CFrame
            sell()
            getgenv().player_data["root"].CFrame = cframe
          end
          local function checkIfItemOwned(item_name)
            getgenv().thunt_data.check_if_owned:InvokeServer(item_name)
          end
          local function buyItem(item_name)
            local args =
            {
              [1] = item_name
            }
            getgenv().thunt_data.buy_item:FireServer(unpack(args))
          end
          local function buyCrate(crate_name, target_name,quantity)
            local args =
            {
              [1] = getgenv().thunt_data.crates[crate_name],
              [2] = target_name,
              [3] = quantity
            }
            getgenv().thunt_data.buy_crate:FireServer(unpack(args))
          end
          local function openCrate(crate_name)
            local args =
            {
              [1] = getgenv().thunt_data.crates[crate_name]
            }

            getgenv().thunt_data.open_crate:FireServer(unpack(args))
          end

          local function rebirth()
            getgenv().thunt_data.rebirth:FireServer()
          end
          local function getCurrentItem(item_type)
            if string.lower(item_type) == "shovels" then
              return getgenv().player_data["tool"].Name
             elseif string.lower(item_type) == "backpacks" then
              local backpack
              for i,v in pairs(getgenv().player_data["character"]:GetChildren()) do
                if v:IsA("Model") then
                  return v.Name
                end
              end
             elseif string.lower(item_type) == "pets" then
              local pet_holder = getgenv().player_data["character"].PetHolder--:WaitForChild("PetHolder")
              local children = pet_holder:GetChildren()
              if #children == 0 then
                return "None"
              end
              return children[1].Name
            end
          end
          local function getNextBestItem(item_type, max_price)
            local current_item_name = getCurrentItem(item_type)
            if current_item_name == nil then
              return nil
            end
            local current_item
            local min_price
            if current_item_name ~= "None" then
              current_item = getgenv().thunt_data[item_type][current_item_name]
              if current_item == nil then
                return nil
              end
              min_price = current_item.Price.Value
             else
              min_price = 0
            end

            local next_best_item
            for i, item in pairs(getgenv().thunt_data[item_type]:GetChildren()) do
              if item_type == "shovels" then
                local item_tool = item:WaitForChild(item.Name)
                local item_configuration = item_tool:WaitForChild("Configurations")
                local item_type = item_configuration:WaitForChild("ToolType")

                if item_type.Value == "Bomb" then
                  continue
                end
              end
              local item_price = item.Price.Value
              if item_price <= min_price then
                continue
               elseif item_price > max_price then
                continue
              end
              next_best_item = item
              min_price = item_price
            end
            return next_best_item
          end
          local function buyNextBestItem(item_type)
            local item = getNextBestItem(item_type, getgenv().player_data["coins"].Value)
            if item == nil then
              return
            end
            buyItem(item.Name)
          end

          local function buyEverything()
            if getgenv().cheat_settings.autorebirth then
              rebirth()
            end

            if getgenv().cheat_settings.autobuyshovels then
              buyNextBestItem("shovels")
            end

            if getgenv().cheat_settings.autobuybackpacks then
              buyNextBestItem("backpacks")
            end

            if getgenv().cheat_settings.autobuypets then
              buyNextBestItem("pets")
            end

            updatePlayerData()
          end

          local function autoChest(chests)
            local block = findChest(chests) or getFirstBlock()
            if block == nil then
              return
            end
            local hp = block.Health.Value
            local retries = 0
            while getgenv().cheat_settings.autochest and block ~= nil do
              if block.Parent ~= sandblocks then
                break
              end
              if getgenv().cheat_settings.autosell then
                if checkMaxBackpack() then
                  sellReturn()
                  buyEverything()
                end
              end
              getgenv().cheat_settings.gcollide = false
              teleportTo(block.CFrame + Vector3.new(0, block.Size.Y, 0))
              digBlock(block)
              wait(getgenv().player_data["tool"].Configurations.AttackLength.Value)  
                end
          end

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
local win = UILib:Window("King Script丨寻宝模拟器",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为寻宝模拟器脚本")

local tab = win:Tab("主要功能")

          tab:Button("自动挖宝箱GUI", function()
            local TresureBreakSimulator = Instance.new("ScreenGui")
            local BG = Instance.new("Frame")
            local Line = Instance.new("Frame")
            local ToolBoxBG = Instance.new("Frame")
            local ToolBox = Instance.new("TextBox")
            local AutoFarm = Instance.new("TextButton")
            local Top = Instance.new("TextLabel")

            local Farm = false

            local Click1 = false

            TresureBreakSimulator.Name = "TresureBreakSimulator"
            TresureBreakSimulator.Parent = game.CoreGui
            TresureBreakSimulator.ZIndexBehavior = Enum.ZIndexBehavior.Sibling
            BG.Name = "BG"
            BG.Parent = TresureBreakSimulator
            BG.BackgroundColor3 = Color3.new(1, 0.823529, 0.54902)
            BG.BackgroundTransparency = 0.20000000298023
            BG.BorderColor3 = Color3.new(0, 0, 0)
            BG.BorderSizePixel = 5
            BG.Position = UDim2.new(0.604587197, 0, 0.30796814, 0)
            BG.Size = UDim2.new(0, 250, 0, 150)
            BG.Active = true
            BG.Selectable = true
            BG.Draggable = true
            Line.Name = "Line"
            Line.Parent = BG
            Line.BackgroundColor3 = Color3.new(0, 0, 0)
            Line.BorderSizePixel = 0
            Line.Position = UDim2.new(0, 0, 0, 72)
            Line.Size = UDim2.new(0, 250, 0, 5)
            ToolBoxBG.Name = "ToolBoxBG"
            ToolBoxBG.Parent = BG
            ToolBoxBG.BackgroundColor3 = Color3.new(1, 0.823529, 0.54902)
            ToolBoxBG.BackgroundTransparency = 0.20000000298023
            ToolBoxBG.BorderColor3 = Color3.new(0, 0, 0)
            ToolBoxBG.BorderSizePixel = 5
            ToolBoxBG.Position = UDim2.new(0, 25, 1, 5)
            ToolBoxBG.Size = UDim2.new(0, 200, 0, 50)
            ToolBox.Name = "ToolBox"
            ToolBox.Parent = ToolBoxBG
            ToolBox.BackgroundColor3 = Color3.new(0.490196, 0.490196, 0.490196)
            ToolBox.BorderColor3 = Color3.new(0.0980392, 0.0980392, 0.0980392)
            ToolBox.BorderSizePixel = 0
            ToolBox.Size = UDim2.new(0, 200, 0, 50)
            ToolBox.Font = Enum.Font.GothamBold
            ToolBox.PlaceholderColor3 = Color3.new(0, 0, 0)
            ToolBox.PlaceholderText = "工具名称"
            ToolBox.Text = game.Players.LocalPlayer.Backpack:FindFirstChildOfClass("Tool").Name
            ToolBox.TextColor3 = Color3.new(0, 0, 0)
            ToolBox.TextSize = 35
            ToolBox.TextWrapped = true
            AutoFarm.Name = "AutoFarm"
            AutoFarm.Parent = BG
            AutoFarm.BackgroundColor3 = Color3.new(0.882353, 0.882353, 0.882353)
            AutoFarm.BorderColor3 = Color3.new(1, 0, 0)
            AutoFarm.BorderSizePixel = 5
            AutoFarm.Position = UDim2.new(0, 25, 0, 5)
            AutoFarm.Size = UDim2.new(0, 200, 0, 62)
            AutoFarm.Font = Enum.Font.GothamBold
            AutoFarm.Text = "自动挖宝箱"
            AutoFarm.TextColor3 = Color3.new(1, 0, 0)
            AutoFarm.TextScaled = true
            AutoFarm.TextSize = 14
            AutoFarm.TextWrapped = true
            AutoFarm.MouseButton1Click:Connect(function()
              if Click1 then
                Click1 = false
                Farm = false
                AutoFarm.TextColor3 = Color3.new(1,0,0)
                AutoFarm.BorderColor3 = Color3.new(1,0,0)
               else
                if game.Players.LocalPlayer.Character:FindFirstChild(ToolBox.Text) then
                  print('Already EquipTool')
                 else
                  game.Players.LocalPlayer.Character.Humanoid:EquipTool(game.Players.LocalPlayer.Backpack[ToolBox.Text])
                end
                Click1 = true
                Farm = true
                AutoFarm.TextColor3 = Color3.new(0,1,0)
                AutoFarm.BorderColor3 = Color3.new(0,1,0)
              end
            end)

            Top.Name = "Top"
            Top.Parent = BG
            Top.Active = true
            Top.BackgroundColor3 = Color3.new(1, 0.823529, 0.54902)
            Top.BorderColor3 = Color3.new(0, 0, 0)
            Top.BorderSizePixel = 5
            Top.Position = UDim2.new(0, 25, 0, -30)
            Top.Selectable = true
            Top.Size = UDim2.new(0, 200, 0, 25)
            Top.Font = Enum.Font.GothamBold
            Top.Text = "寻宝模拟器"
            Top.TextColor3 = Color3.new(0, 0, 0)
            Top.TextScaled = true
            Top.TextSize = 14
            Top.TextWrapped = true

            local Character = game.Workspace:WaitForChild(game.Players.LocalPlayer.Name)

            function Sell()
              local OldPos = Character.HumanoidRootPart.CFrame
              Character.HumanoidRootPart.CFrame = CFrame.new(3, 10, -160)
              game.ReplicatedStorage.Events.AreaSell:FireServer()
              wait(0.1)
              Character.HumanoidRootPart.CFrame = OldPos
            end

            local function RE()
              while true do
                wait(1)
                if Rebirth == true then
                  local a = game.Players.LocalPlayer.PlayerGui.Gui.Buttons.Coins.Amount.Text:gsub(',','')
                  local b = game.Players.LocalPlayer.PlayerGui.Gui.Rebirth.Needed.Coins.Amount.Text:gsub(',','')
                  print(tonumber(a))
                  print(tonumber(b))
                  if tonumber(a) > tonumber(b) then
                    warn('Calculation Complete!')
                    game.ReplicatedStorage.Events.Rebirth:FireServer()
                    ToolBox.Text = "Bucket"
                    repeat wait(.1) until game.Players.LocalPlayer.PlayerGui.Gui.Popups.GiveReward.Visible == true
                    game.Players.LocalPlayer.PlayerGui.Gui.Popups.GiveReward.Visible = false
                    wait()
                  end
                end
              end
            end
            spawn(RE)
            while true do
              wait()
              if Farm then
                local Sand = nil
                local SandName = ""
                for i,v in pairs (game.Workspace.SandBlocks:GetChildren()) do
                  if not Farm then
                    Sell()
                    break
                  end
                  if v:FindFirstChild("Chest") then
                    if v.CFrame.X > -40 and v.CFrame.X < 20 and v.CFrame.Z < -175 and v.CFrame.Z > -235 then
                      local Next = false
                      if v == nil then
                        Next = false
                       else
                        Next = true
                        Sand = v
                        SandName = v.Name
                      end
                      if Next == true then
                        local Success,Problem = pcall(function()
                          if game.Players[game.Players.LocalPlayer.Name].PlayerGui.Gui.Popups.BackpackFull.Visible == true then Sell() end
                          Sand.CanCollide = false
                          local Coins = game.Players.LocalPlayer.PlayerGui.Gui.Buttons.Coins.Amount.Text
                          repeat
                            if game.Players[game.Players.LocalPlayer.Name].PlayerGui.Gui.Popups.BackpackFull.Visible == true then Sell() end
                            if not Farm then
                              wait(.1)
Character.HumanoidRootPart.CFrame = CFrame.new(3, 10, -160)
                              wait(1)
                              break
                            end
               Character.HumanoidRootPart.Anchored = true
                            wait()
      Character.HumanoidRootPart.CFrame = Sand.CFrame
                            wait()
            Character.HumanoidRootPart.Anchored = false
                            Character:WaitForChild(ToolBox.Text)['RemoteClick']:FireServer(game.Workspace.SandBlocks[SandName])
                            wait()
                          until game.Players.LocalPlayer.PlayerGui.Gui.Buttons.Coins.Amount.Text ~= Coins
                          Next = false
                        end)
                        if Success then
                          print('Worked')
                         else
                          warn(Problem)
                        end
                      end
                    end
                  end
                end
              end
            end
          end)
   tab:Toggle("自动重生", false, function(state)
            getgenv().cheat_settings.autorebirth = state
          end)
 tab:Toggle("自动售卖", false, function(state)
            getgenv().cheat_settings.autosell = state
          end)
   tab:Toggle("自动购买铲子", false, function(state)
            getgenv().cheat_settings.autobuyshovels = state
          end)
  tab:Toggle("自动购买宠物", false, function(state)
            getgenv().cheat_settings.autobuypets = state
          end)
 tab:Toggle("自动购买背包", false, function(state)
            getgenv().cheat_settings.autobuypets = state
          end)
   tab:Toggle("自动购买板条箱", false, function(state)
            getgenv().cheat_settings.autobuycrates = state
          end)
          spawnThread(function()
            while wait() do
              while getgenv().cheat_settings.autorebirth do
                rebirth()
                wait(1)
              end
            end
          end)
          spawnThread(function()
            while wait() do
              while getgenv().cheat_settings.autobuycrates do
                for k,v in pairs(getgenv().cheat_vars.chosen_autobuycrate) do
                  if v == true then
         buyCrate(k, getgenv().player_data["player"].Name, 1)
                  end
                end
                wait(0.5)
              end
            end
          end)
