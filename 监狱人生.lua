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
local win = UILib:Window("King Script丨监狱人生",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为监狱人生脚本")
    
local Tab = win:Tab("基础功能")
local Tab2 = win:Tab("变身功能")
local Tab3 = win:Tab("关于作者")

        local isAutoKillRunning = false
        local function AutoKillLoop()
            while isAutoKillRunning do
                for i, v in next, game:GetService("Players"):GetChildren() do
                    pcall(function()
                        if v ~= game:GetService("Players").LocalPlayer and not v.Character:FindFirstChildOfClass("ForceField") and v.Character.Humanoid.Health > 0 then
                            while v.Character:WaitForChild("Humanoid").Health > 0 and isAutoKillRunning do
                                wait()
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame
                                for x, c in next, game:GetService("Players"):GetChildren() do
                                    if c ~= game:GetService("Players").LocalPlayer then
                                        game.ReplicatedStorage.meleeEvent:FireServer(c)
                                    end
                                end
                            end
                        end
                    end)
                    wait()
                end
            end
        end

        local function AutoJump()
            while isAutoKillRunning do
                if game:GetService("Players").LocalPlayer.Character and game:GetService("Players").LocalPlayer.Character:FindFirstChild("Humanoid") then
                    local humanoid = game:GetService("Players").LocalPlayer.Character.Humanoid
                    if humanoid.Sit then
                        humanoid.Jump = true
                    end
                end
                wait()
            end
        end

local ez = Instance.new("Folder")
ez.Name = "nikodoors"
ez.Parent = game:service"ReplicatedStorage"
local ez = Instance.new("Folder")
ez.Name = "nikofences"
ez.Parent = game:service"ReplicatedStorage"

local Parts = {}
local States = {}
local plr = game.Players.LocalPlayer
local char = plr.Character

Tab:Label("正常速度改成16")
Tab:Textbox("速度", false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.WalkSpeed = Value
end)
Tab:Label("正常跳跃改成50")
Tab:Textbox("跳跃", false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.JumpPower = Value
end)
Tab:Label("正常高度改成2")
Tab:Textbox("调整悬浮高度", false, function(Value)
    game.Players.LocalPlayer.Character.Humanoid.HipHeight = Value
end)
Tab:Label("正常重力改成198")
Tab:Textbox("调整重力", false, function(Value)
    game.Workspace.Gravity = Value
end)

Tab:Button("拿车",function()
pcall(function()
                        local OldPos = game:GetService("Players").LocalPlayer.Character:GetPrimaryPartCFrame()
                        game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-910, 95, 2157))
                        wait()
                        local car = nil
                        task.spawn(function()
                                car = game:GetService("Workspace").CarContainer.ChildAdded:Wait()
                        end)
                        repeat wait(.1)
                                local ohInstance1 = game:GetService("Workspace").Prison_ITEMS.buttons:GetChildren()[8]["Car Spawner"]
                                workspace.Remote.ItemHandler:InvokeServer(ohInstance1)
                        until car
                        repeat task.wait() until car:FindFirstChild("RWD") and car:FindFirstChild("Body") and car:FindFirstChild("Body"):FindFirstChild("VehicleSeat")
                        car.PrimaryPart = car.RWD
                        game:GetService("Players").LocalPlayer.Character:SetPrimaryPartCFrame(OldPos)
                        wait(1)
                        local Done = false
                        car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
                        repeat 

                                game:GetService("RunService").RenderStepped:Wait()
                                car:SetPrimaryPartCFrame(OldPos)
                                game:GetService("Players").LocalPlayer.Character.HumanoidRootPart.CFrame =CFrame.new(car.Body.VehicleSeat.Position)
                                car.Body.VehicleSeat:Sit(game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid"))
                                if game:GetService("Players").LocalPlayer.Character:FindFirstChildOfClass("Humanoid").Sit == true then
                                        Done = true
                                end
                        until Done
                end)
end)

Tab:Dropdown("传送位置列表",{"警卫室","监狱室内","犯罪点","院子"}, function(Value)
if Value == "警卫室" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(847.7261352539062, 98.95999908447266, 2267.387451171875)
elseif Value == "监狱室内" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(919.2575073242188, 98.95999908447266, 2379.74169921875)
elseif Value == "犯罪点" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-937.5891723632812, 93.09876251220703, 2063.031982421875)
elseif Value == "院子" then
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(760.6033325195312, 96.96992492675781, 2475.405029296875)
end
end)

Tab:Button("全部甩飞", function()
    local Targets = {"All"} 

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end
        
        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end
        
        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()
                        
                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end
        
        workspace.FallenPartsDestroyHeight = 0/0
        
        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)
        
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)
        
        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error Occurred", "Target is missing everything", 5)
        end
        
        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid
        
        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error Occurred", "Random error", 5)
    end
end

if not Welcome then Message("甩飞开启成功", "霖溺脚本", 5) end
getgenv().Welcome = true
if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error Occurred", "This user is whitelisted! (Owner)", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error Occurred", "Username Invalid", 5)
    end
end

end)

Tab:Button("给所有枪", function()
     print("Clicked")
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(822, 101, 2251, 1, -0, 0, 0, 1, 0, -0, -0, 1)
wait(1.1)
local args = {
    [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("M9"):WaitForChild("ITEMPICKUP")
}

workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
wait(1.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(824.801025, 104.330627, 2250.36157, 0.173624337, 0.984811902, 0, -0.984811902, 0.173624337, -0, -0, 0, 1)
wait(1.1)
local args = {
    [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("Remington 870"):WaitForChild("ITEMPICKUP")
}

workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
wait(1.1)
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(-936.710632, 93.5627747, 2054.66602, 0, -1, 0, 1, 0, -0, 0, 0, 1)
wait(1.1)
local args = {
    [1] = workspace:WaitForChild("Prison_ITEMS"):WaitForChild("giver"):WaitForChild("AK-47"):WaitForChild("ITEMPICKUP")
}

workspace:WaitForChild("Remote"):WaitForChild("ItemHandler"):InvokeServer(unpack(args))
        print("Ready")
    end)

Tab:Toggle("杀死光环", false, function(state)
     States.KillAura = state
        if state then
            print("Kill Aura On")
            CreateKillPart()
        else
            print("Kill Aura Off")
            if Parts[1] and Parts[1].Name == "KillAura" then
                Parts[1]:Destroy()
                Parts[1] = nil
            end
         end
        end)

        function CreateKillPart()
            if Parts[1] then
             pcall(function()
                 Parts[1]:Destroy()
             end)
             Parts[1] = nil
        end
        local Part = Instance.new("Part",plr.Character)
        local hilight = Instance.new("Highlight",Part)
        hilight.FillTransparency = 1

        Part.Anchored = true
        Part.CanCollide = false
        Part.CanTouch = false
        Part.Material = Enum.Material.SmoothPlastic
        Part.Transparency = .98
        Part.Material = Enum.Material.SmoothPlastic
        Part.BrickColor = BrickColor.White()
        Part.Size = Vector3.new(20,2,20)
        Part.Name = "KillAura"
        Parts[1] = Part
        end

        task.spawn(function()
        repeat task.wait()until plr.Character and char and char:FindFirstChildOfClass("Humanoid")

        if States.KillAura then
            CreateKillPart()
        end
      end)

    game:GetService("RunService").Stepped:Connect(function()
        if States.KillAura then
            for i,v in pairs(game.Players:GetPlayers()) do
                if v ~= game.Players.LocalPlayer then
                    if (v.Character.HumanoidRootPart.Position - plr.Character.HumanoidRootPart.Position).magnitude <14 and v.Character.Humanoid.Health >0 then
                        local args = {
                            [1] = v
                        }
                        for i =1,2 do
                            task.spawn(function()
                                game:GetService("ReplicatedStorage").meleeEvent:FireServer(unpack(args))
                            end)
                        end

                    end
                end
            end
        end  
     end)

Tab:Toggle("杀死全部", false, function(state)
     if state then
                isAutoKillRunning = true
                spawn(AutoKillLoop)
                spawn(AutoJump)
            else
                isAutoKillRunning = false
            end
        end)

Tab:Toggle("声音折磨", false, function(bool)
     getgenv().spamSoond = bool
        if bool then
            spamSound()
        end
end)

function spamSound()
        while getgenv().spamSoond == true do
                local class_check = game.IsA
                local sound = Instance.new('Sound')
                local sound_stop = sound.Play
                local get_descendants = game.GetDescendants

                for i,v in next, get_descendants(game) do 
                        if class_check(v,"Sound") then
                                sound_stop(v)
                        end
                end

                get_descendants = nil
                sound:Remove()
                get_descendants = nil
                sound_stop = nil
        task.wait()
        end
end

Tab:Button("无敌模式", function()
loadstring(game:HttpGet("https://pastebin.com/raw/LdTVujTA"))()
end)

Tab:Button("手里剑", function()
loadstring(game:HttpGet("https://pastebin.com/raw/mSLiAZHk"))()
end)


Tab:Toggle("删除门", false, function(state)
     if state then
        for i,v in pairs(workspace.Doors:GetChildren()) do
             v.Parent = game:service"ReplicatedStorage".nikodoors

        end
    else
        for i,v in pairs(game:service"ReplicatedStorage".nikodoors:GetChildren()) do
            v.Parent = workspace.Doors
        end
    end
end)

Tab:Toggle("穿墙", false, function(Value)
    if Value then
                    Noclip = true
                    Stepped = game.RunService.Stepped:Connect(function()
                            if Noclip == true then
                                    for a, b in pairs(game.Workspace:GetChildren()) do
                        if b.Name == game.Players.LocalPlayer.Name then
                            for i, v in pairs(game.Workspace[game.Players.LocalPlayer.Name]:GetChildren()) do
                                if v:IsA("BasePart") then
                                    v.CanCollide = false
                                end
                            end
                        end
                    end
                            else
                                    Stepped:Disconnect()
                            end
                    end)
            else
                    Noclip = false
            end
end)

Tab:Button("逮捕所有罪犯", function()
    wait(0.1)
        Player = game.Players.LocalPlayer
        Pcf = Player.Character.HumanoidRootPart.CFrame
        for i,v in pairs(game.Teams.Criminals:GetPlayers()) do
                if v.Name ~= Player.Name then
                        local i = 10
                        repeat
                                wait()
                                i = i-1
                                game.Workspace.Remote.arrest:InvokeServer(v.Character.HumanoidRootPart)
                                Player.Character.HumanoidRootPart.CFrame = v.Character.HumanoidRootPart.CFrame * CFrame.new(0, 0, 1)
                        until i == 0
                end
        end
end)

Tab:Button("变成警察", function()
workspace.Remote.TeamEvent:FireServer("Bright blue");
end)

Tab:Button("变成囚犯", function()
workspace.Remote.TeamEvent:FireServer("Bright orange");
end)

Tab:Button("子弹追踪", function()
local Players = game.Players
local LocalPlayer = Players.LocalPlayer
local GetPlayers = Players.GetPlayers
local Camera = workspace.CurrentCamera
local WTSP = Camera.WorldToScreenPoint
local FindFirstChild = game.FindFirstChild
local Vector2_new = Vector2.new
local Mouse = LocalPlayer.GetMouse(LocalPlayer)
function ClosestChar()
    local Max, Close = math.huge
    for I,V in pairs(GetPlayers(Players)) do
        if V ~= LocalPlayer and V.Team ~= LocalPlayer.Team and V.Character then
            local Torso = FindFirstChild(V.Character, "Torso")
            if Torso then
                local Pos, OnScreen = WTSP(Camera, Torso.Position)
                if OnScreen then
                    local Dist = (Vector2_new(Pos.X, Pos.Y) - Vector2_new(Mouse.X, Mouse.Y)).Magnitude
                    if Dist < Max then
                        Max = Dist
                        Close = V.Character
                    end
                end
            end
        end
    end
    return Close
end

local MT = getrawmetatable(game)
local __namecall = MT.__namecall
setreadonly(MT, false)
MT.__namecall = newcclosure(function(self, ...)
    local Method = getnamecallmethod()
    if Method == "FindPartOnRay" and not checkcaller() and tostring(getfenv(0).script) == "GunInterface" then
        local Character = ClosestChar()
        if Character then
            return Character.Torso, Character.Torso.Position
        end
    end

    return __namecall(self, ...)
end)
setreadonly(MT, true)
local vu = game:GetService("VirtualUser")
game:GetService("Players").LocalPlayer.Idled:connect(function()
    vu:Button2Down(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
    wait(1)
    vu:Button2Up(Vector2.new(0,0),workspace.CurrentCamera.CFrame)
end)
end)

Tab2:Button("FE变身", function()
loadstring("\108\111\97\100\115\116\114\105\110\103\40\103\97\109\101\58\72\116\116\112\71\101\116\40\34\104\116\116\112\115\58\47\47\114\97\119\46\103\105\116\104\117\98\117\115\101\114\99\111\110\116\101\110\116\46\99\111\109\47\103\48\48\108\88\112\108\111\105\116\101\114\47\103\48\48\108\88\112\108\111\105\116\101\114\47\109\97\105\110\47\70\101\37\50\48\98\121\112\97\115\115\34\44\32\116\114\117\101\41\41\40\41\10")()
end)

Tab2:Button("变车模型", function()
loadstring(game:HttpGet("https://pastebin.com/raw/zLe3e4BS"))()
end)

Tab2:Button("变钢铁侠", function()
loadstring(game:HttpGet("https://pastebin.com/raw/7prijqYH"))()
end)

Tab2:Button("金字塔", function()
local you = game.Players.LocalPlayer
local char = you.Character
local mouse = you:GetMouse()
local firing = false
local m = Instance.new("Model",char)
local illum = Instance.new("Part",m)
illum.CanCollide = false
illum.BottomSurface = "Smooth"
illum.TopSurface = "Smooth"
illum.Size = Vector3.new(0.2, 0.2, 0.2)
illum.Anchored = true

local s = Instance.new("Sound",m)
s.SoundId = "rbxassetid://17345436140"
s.Volume = 0.8
s.Looped = true
s:Play()
local SP = Instance.new("SpecialMesh",illum)
SP.MeshId = "rbxassetid://17345436140"
SP.TextureId = "rbxassetid://17345436140"
SP.Scale = Vector3.new(0.2, 0.2, 0.2)
SP.Offset = Vector3.new(0.5, 8, 0.03)


local MousePart = Instance.new("Part",m)
MousePart.CanCollide = false
MousePart.BottomSurface = "Smooth"
MousePart.TopSurface = "Smooth"
MousePart.Size = Vector3.new(0.2, 0.2, 0.2)
MousePart.Anchored = true


local TipPart = Instance.new("Part",m)
TipPart.CanCollide = false
TipPart.BottomSurface = "Smooth"
TipPart.TopSurface = "Smooth"
TipPart.BrickColor = BrickColor.new("Lime green")
TipPart.Material = "Neon"
TipPart.FormFactor = "Custom"
TipPart.Shape = "Ball"
TipPart.Size = Vector3.new(2, 2, 2)
TipPart.Anchored = true
TipPart.Locked = true
TipPart.CanCollide = false
TipPart.Transparency = 0.5

local PE1 = Instance.new("ParticleEmitter",TipPart) -- dorritoes
PE1.Texture = "rbxassetid://17345436140"
PE1.LightEmission = 0.3
PE1.Acceleration = Vector3.new(0,-2,0)
PE1.Lifetime = NumberRange.new(5,7)
PE1.Speed = NumberRange.new(3,5)
PE1.Rate = 30
PE1.VelocitySpread = 50

local PE2 = Instance.new("ParticleEmitter",TipPart) --illuminati
PE2.Texture = "rbxassetid://17345436140"
PE2.LightEmission = 1
PE2.Acceleration = Vector3.new(0,-2,0)
PE2.Lifetime = NumberRange.new(5,7)
PE2.Speed = NumberRange.new(3,5)
PE2.Rate = 10
PE2.VelocitySpread = 50

local PE3 = Instance.new("ParticleEmitter",TipPart) --HitMarkers
PE3.Texture = "rbxassetid://17345436140"
PE3.LightEmission = 1
PE3.Acceleration = Vector3.new(0,-2,0)
PE3.Lifetime = NumberRange.new(5,7)
PE3.Speed = NumberRange.new(3,5)
PE3.Rate = 10
PE3.VelocitySpread = 50

local PE4 = Instance.new("ParticleEmitter",MousePart) -- dorritoes
PE4.Texture = "rbxassetid://17345436140"
PE4.Acceleration = Vector3.new(0,-10,0)
PE4.Lifetime = NumberRange.new(2,4)
PE4.Speed = NumberRange.new(8,10)
PE4.Rate = 100
PE4.VelocitySpread = 50

local PE5 = Instance.new("ParticleEmitter",MousePart) --illuminati
PE5.Texture = "rbxassetid://686815657"
PE5.Acceleration = Vector3.new(0,-10,0)
PE5.Lifetime = NumberRange.new(2,4)
PE5.Speed = NumberRange.new(8,10)
PE5.Rate = 100
PE5.VelocitySpread = 50

local PE6 = Instance.new("ParticleEmitter",MousePart) --HitMarkers
PE6.Texture = "rbxassetid://17345436140"
PE6.Acceleration = Vector3.new(0,-10,0)
PE6.Lifetime = NumberRange.new(2,4)
PE6.Speed = NumberRange.new(8,10)
PE6.Rate = 100
PE6.VelocitySpread = 50

PE1.Enabled = false
PE2.Enabled = false
PE3.Enabled = false
PE4.Enabled = false
PE5.Enabled = false
PE6.Enabled = false

function drawlazer(p1,p2)
part = Instance.new("Part", m)
part.Name = "Location"
part.BottomSurface = 0
part.TopSurface = 0
part.BrickColor = BrickColor.new("Lime green")
part.Material = "Neon"
part.FormFactor = "Custom"
part.Shape = "Ball"
part.Size = Vector3.new(4, 4, 4)
part.Anchored = true
part.Locked = true
part.CanCollide = false
part.Transparency = 0.5
part.CFrame = CFrame.new(p1.Position.x,p1.Position.y,p1.Position.z)

obj = part
local lastPos = obj.CFrame.p
objC = obj:Clone()
objC.Name = "Line"
objC.Parent = m
objC.Shape = "Ball"
objC.Anchored = true
local distance = (p2.Position- obj.CFrame.p).magnitude
objC.Size = Vector3.new(10,10,distance)
objC.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/2)
lastPos = obj.CFrame.p
objCC1 = objC:Clone()
objCC1.Parent = objC
objCC1.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/2.5)
objCC1.Size = Vector3.new(4,4,distance/2)
objCC1.Name = "LineC1"

objCC2 = objC:Clone()
objCC2.Parent = objC
objCC2.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/1.5)
objCC2.Size = Vector3.new(4,4,distance/2)
objCC2.Name = "LineC2"
objCC2:ClearAllChildren()

end

function drawlazer2(p1,p2)
part = m:FindFirstChild("Location")
part.CFrame = CFrame.new(p1.Position.x,p1.Position.y,p1.Position.z)
obj = part
local distance = (p2.Position- obj.CFrame.p).magnitude
objC = m.Line:Clone()
objC.Name = "Line2"
objC.Parent = m
objC.Size = Vector3.new(4,4,distance)
objC.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/2)

objCC1 = objC.LineC1

objCC1.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/2.5)
objCC1.Size = Vector3.new(4,4,distance/2)


objCC2 = objC.LineC2

objCC2.CFrame = CFrame.new(p2.Position,obj.Position)*CFrame.new(0,0,-distance/1.5)
objCC2.Size = Vector3.new(4,4,distance/2)


m.Line:remove()

objC.Name = "Line"
for _,v in pairs(game.Players:GetPlayers()) do

if v ~= you then
local d = (part.Position- v.Character:WaitForChild("Torso").CFrame.p).magnitude
if d <= 5 then
v.Character:FindFirstChildOfClass("Humanoid"):TakeDamage(5)
end
end
--wait()
end

end


function despawn1(part1,part2,length)

for i = 10,1,-1 do

part1.Transparency = part1.Transparency + 0.1
part1.Size = part1.Size + Vector3.new(0.2,0.2,length)
part1.Size = Vector3.new(part1.Size.X,part1.Size.Y,length)

wait(0.01)
end
part1:remove()

for i = 10,1,-1 do

part2.Transparency = part2.Transparency + 0.1

wait(0.01)
end
part2:remove()

end

function despawn2(part1,length)

for i = 10,1,-1 do

part1.Transparency = part1.Transparency + 0.1
part1.Size = part1.Size + Vector3.new(0.2,0,length)
part1.Size = Vector3.new(part1.Size.X,part1.Size.Y,length)

wait(0.01)
end
part1:remove()
end



function snipe(T)
for i, plr in pairs(game.Players:GetChildren()) do
                        if plr.Name ~= game.Players.LocalPlayer.Name then
                        for i = 1, 10 do
                        game:GetService("ReplicatedStorage").meleeEvent:FireServer(plr)
                        end
        end
    end

part = Instance.new("Part", m)
part.Name = "Sniper"
part.BottomSurface = 0
part.TopSurface = 0
part.BrickColor = BrickColor.new("Really black")
part.Material = "Neon"
part.FormFactor = "Custom"
part.Size = Vector3.new(1, 1, 3)
part.Anchored = true
part.Locked = true
part.CanCollide = false
part.Transparency = 0

local SP = Instance.new("SpecialMesh",part)
SP.MeshId = "rbxassetid://685827900"
SP.Scale = Vector3.new(0.05, 0.05, 0.05)
SP.Offset = Vector3.new(0, -0.3, 3.05)

local S=part

part.Position = char.Torso.Position + Vector3.new(math.random(-5,5),math.random(3,8),math.random(-5,5))
part.CFrame = CFrame.new(part.Position,T.Position)


obj = part
local lastPos = obj.CFrame.p
objC = obj:Clone()
objC.Mesh:remove()
wait(0.05)
objC.Parent = part
objC.Shape = "Ball"
objC.FormFactor = "Custom"
objC.Anchored = true
objC.BrickColor = BrickColor.new("New Yeller")
local distance = (T.Position- obj.CFrame.p).magnitude
objC.Size = Vector3.new(0.2,0.2,distance)
objC.CFrame = CFrame.new(T.Position,obj.Position)*CFrame.new(0,0,-distance/2)
local s = Instance.new("Sound",part)
s.SoundId = "rbxassetid://680140087"
s.Volume = 1
s.PlayOnRemove = true
s:remove()
despawn1(objC,part,distance)
if mouse.Target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
mouse.Target.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(20)
local PETemp = Instance.new("ParticleEmitter",mouse.Target) --HitMarkers
PETemp.Texture = "rbxassetid://17345436140"
PETemp.Acceleration = Vector3.new(0,-10,0)
PETemp.Lifetime = NumberRange.new(2,4)
PETemp.Speed = NumberRange.new(8,10)
PETemp.Rate = 100
PETemp.VelocitySpread = 50
PETemp.Enabled = true
wait(0.1)
PETemp.Enabled = false
end
end






function ThrowDorito(a,b)
if m:FindFirstChild("Throw") == nil then
local animation=Instance.new("Animation",char:FindFirstChildOfClass("Humanoid"))
animation.Name="Throw"
animation.AnimationId="http://www.roblox.com/asset/?id=17345436140"
anim=char:FindFirstChildOfClass("Humanoid"):LoadAnimation(animation)
anim:Play()
else
local animation=char:FindFirstChildOfClass("Humanoid").Throw
anim=char:FindFirstChildOfClass("Humanoid"):LoadAnimation(animation)
anim:Play()
end

part = Instance.new("Part", m)
part.Name = "Dorito"
part.BottomSurface = 0
part.TopSurface = 0
part.BrickColor = BrickColor.new("Neon orange")
part.Material = "Neon"
part.FormFactor = "Custom"
part.Shape = "Ball"
part.Size = Vector3.new(1,0.2,1)
part.Anchored = true
part.Locked = true
part.CanCollide = false
part.Transparency = 0
part.CFrame = CFrame.new(a.Position.x,a.Position.y,a.Position.z)
local SP = Instance.new("SpecialMesh",part)
SP.MeshId = "rbxassetid://17345436140"
SP.Scale = Vector3.new(1, 1, 1)


obj = part
local lastPos = obj.CFrame.p
objC = obj:Clone()
objC.Name = "DoritoTrail"
objC.Mesh:remove()
objC.Parent = m
objC.FormFactor = "Custom"
objC.Anchored = true
objC.Transparency = 0.5
objC.BrickColor = BrickColor.new("CGA brown")

local distance = (b.Position- obj.CFrame.p).magnitude
objC.Size = Vector3.new(1,0.2,distance)
objC.CFrame = CFrame.new(b.Position,obj.Position)*CFrame.new(0,0,-distance/2)
lastPos = obj.CFrame.p
obj.CFrame = CFrame.new(b.Position,obj.Position)*CFrame.new(0,0,-distance)
obj.CFrame = obj.CFrame * CFrame.fromEulerAnglesXYZ(0,math.random(1,99),0)
objC.Size = Vector3.new(1,0.2,distance)
print(distance)
        local target = mouse.Target
    local weld = Instance.new("ManualWeld")
    weld.Part0 = part
    weld.Part1 = target
    weld.C0 = CFrame.new()
    weld.C1 = target.CFrame:inverse() * part.CFrame
    weld.Parent = part
        part.Anchored = false
        if target.Parent:FindFirstChildOfClass("Humanoid") ~= nil then
                target.Parent:FindFirstChildOfClass("Humanoid"):TakeDamage(5)
        end
        despawn2(objC,distance)
end









function shoot()
for i, plr in pairs(game.Players:GetChildren()) do
                        if plr.Name ~= game.Players.LocalPlayer.Name then
                        for i = 1, 10 do
                        game:GetService("ReplicatedStorage").meleeEvent:FireServer(plr)
                        end
        end
    end

print("FIRE!")
TipPart.Transparency = 0.5
if m:FindFirstChild("Line") == nil then

drawlazer(MousePart,TipPart)
else
drawlazer2(MousePart,TipPart)
end
local s = Instance.new("Sound",TipPart)
s.SoundId = "rbxassetid://17345436140"
s.Volume = 2.5
s.PlayOnRemove = true
s:remove()
wait()
end


mouse.Button1Up:connect(function()
firing = false
print("Stop")
PE1.Enabled = false
PE2.Enabled = false
PE3.Enabled = false
PE4.Enabled = false
PE5.Enabled = false
PE6.Enabled = false
if m:FindFirstChild("Line") ~= nil then
m.Line:remove()
m.Location:remove()
end
TipPart.Transparency = 1
repeat illum.CFrame = illum.CFrame * CFrame.fromEulerAnglesXYZ(0,0.05,0) illum.Position = char.Torso.Position + Vector3.new(0,.01,0) if m:FindFirstChild("Line") ~= nil then m:FindFirstChild("Line"):remove() end if m:FindFirstChild("Location") ~= nil then m:FindFirstChild("Location"):remove() end wait()
until firing == true
end)

mouse.Button1Down:connect(function()
firing = true
PE1.Enabled = true
--PE2.Enabled = true
--PE3.Enabled = true
PE4.Enabled = true
PE5.Enabled = true
PE6.Enabled = true
repeat MousePart.CFrame = CFrame.new(mouse.Hit.p) TipPart.Position = char.Head.Position + Vector3.new(0,9,0) illum.CFrame = illum.CFrame * CFrame.fromEulerAnglesXYZ(0,0.05,0) illum.Position = char.Torso.Position + Vector3.new(0,.01,0) shoot() wait()
until firing == false 

end)

mouse.KeyDown:connect(function(key)
if key == "q" and firing == false then
MousePart.CFrame = CFrame.new(mouse.Hit.p)
snipe(MousePart)
print("Snipe")
elseif key == "e" and firing == false then
MousePart.CFrame = CFrame.new(mouse.Hit.p)
ThrowDorito(MousePart,char:FindFirstChild("Right Arm"))
print("Dorito")
end

end)
end)

local King = win:Tab("折磨功能")
local plrlist = {}
local plr = nil
for i, v in pairs(game:GetService("Players"):GetChildren()) do
table.insert(plrlist,v.Name)
end

local drop = King:Dropdown("玩家列表", plrlist, function(m)
for i, b in pairs(game:GetService("Workspace"):GetChildren()) do
if m == b.name then
plr = m
end
end
end)

King:Button("刷新列表", function()
drop:Clear()
for i, v in pairs(game.Players:GetChildren()) do
if v:IsA("Player") then
drop:Add(v.Name)
end
end
end)

King:Button("甩飞一次", function()
if plr == nil then 
elseif plr ~= nil then
local Targets = {plr}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("玩家消失", "King乱杀", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end

        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end

        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end

        workspace.FallenPartsDestroyHeight = 0/0

        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("玩家已经退出/脚本承受不了", "认准King[霖溺]", 5)
        end

        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid

        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("玩家消失", "消失", 5)
    end
end

if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("检测到玩家消失", "King乱杀", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("无敌中", "King乱杀", 5)
    end
end
end
end)

King:Button("甩飞所有", function()
local Targets = {"All"}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error Occurred", "Targeting is sitting", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end

        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end

        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end

        workspace.FallenPartsDestroyHeight = 0/0

        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("错误", "King乱杀", 5)
        end

        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid

        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("错误", "重新调整", 5)
    end
end

if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error❌", "！KING", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error❌", "必须甩", 5)
    end
end
end)

King:Toggle("循环甩飞",false, function(t)
if plr == nil then
 elseif plr ~= nil then
getgenv().autofling = t
spawn(function()
while autofling do wait()
pcall(function()
local Targets = {plr}

local Players = game:GetService("Players")
local Player = Players.LocalPlayer

local AllBool = false

local GetPlayer = function(Name)
    Name = Name:lower()
    if Name == "all" or Name == "others" then
        AllBool = true
        return
    elseif Name == "random" then
        local GetPlayers = Players:GetPlayers()
        if table.find(GetPlayers,Player) then table.remove(GetPlayers,table.find(GetPlayers,Player)) end
        return GetPlayers[math.random(#GetPlayers)]
    elseif Name ~= "random" and Name ~= "all" and Name ~= "others" then
        for _,x in next, Players:GetPlayers() do
            if x ~= Player then
                if x.Name:lower():match("^"..Name) then
                    return x;
                elseif x.DisplayName:lower():match("^"..Name) then
                    return x;
                end
            end
        end
    else
        return
    end
end

local Message = function(_Title, _Text, Time)
    game:GetService("StarterGui"):SetCore("SendNotification", {Title = _Title, Text = _Text, Duration = Time})
end

local SkidFling = function(TargetPlayer)
    local Character = Player.Character
    local Humanoid = Character and Character:FindFirstChildOfClass("Humanoid")
    local RootPart = Humanoid and Humanoid.RootPart

    local TCharacter = TargetPlayer.Character
    local THumanoid
    local TRootPart
    local THead
    local Accessory
    local Handle

    if TCharacter:FindFirstChildOfClass("Humanoid") then
        THumanoid = TCharacter:FindFirstChildOfClass("Humanoid")
    end
    if THumanoid and THumanoid.RootPart then
        TRootPart = THumanoid.RootPart
    end
    if TCharacter:FindFirstChild("Head") then
        THead = TCharacter.Head
    end
    if TCharacter:FindFirstChildOfClass("Accessory") then
        Accessory = TCharacter:FindFirstChildOfClass("Accessory")
    end
    if Accessoy and Accessory:FindFirstChild("Handle") then
        Handle = Accessory.Handle
    end

    if Character and Humanoid and RootPart then
        if RootPart.Velocity.Magnitude < 50 then
            getgenv().OldPos = RootPart.CFrame
        end
        if THumanoid and THumanoid.Sit and not AllBool then
            return Message("Error❌", "KINGKING", 5) -- u can remove dis part if u want lol
        end
        if THead then
            workspace.CurrentCamera.CameraSubject = THead
        elseif not THead and Handle then
            workspace.CurrentCamera.CameraSubject = Handle
        elseif THumanoid and TRootPart then
            workspace.CurrentCamera.CameraSubject = THumanoid
        end
        if not TCharacter:FindFirstChildWhichIsA("BasePart") then
            return
        end

        local FPos = function(BasePart, Pos, Ang)
            RootPart.CFrame = CFrame.new(BasePart.Position) * Pos * Ang
            Character:SetPrimaryPartCFrame(CFrame.new(BasePart.Position) * Pos * Ang)
            RootPart.Velocity = Vector3.new(9e7, 9e7 * 10, 9e7)
            RootPart.RotVelocity = Vector3.new(9e8, 9e8, 9e8)
        end

        local SFBasePart = function(BasePart)
            local TimeToWait = 2
            local Time = tick()
            local Angle = 0

            repeat
                if RootPart and THumanoid then
                    if BasePart.Velocity.Magnitude < 50 then
                        Angle = Angle + 100

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle),0 ,0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(2.25, 1.5, -2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(-2.25, -1.5, 2.25) + THumanoid.MoveDirection * BasePart.Velocity.Magnitude / 1.25, CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0) + THumanoid.MoveDirection,CFrame.Angles(math.rad(Angle), 0, 0))
                        task.wait()
                    else
                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -THumanoid.WalkSpeed), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, THumanoid.WalkSpeed), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, -TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, 1.5, TRootPart.Velocity.Magnitude / 1.25), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(math.rad(90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5 ,0), CFrame.Angles(math.rad(-90), 0, 0))
                        task.wait()

                        FPos(BasePart, CFrame.new(0, -1.5, 0), CFrame.Angles(0, 0, 0))
                        task.wait()
                    end
                else
                    break
                end
            until BasePart.Velocity.Magnitude > 500 or BasePart.Parent ~= TargetPlayer.Character or TargetPlayer.Parent ~= Players or not TargetPlayer.Character == TCharacter or THumanoid.Sit or Humanoid.Health <= 0 or tick() > Time + TimeToWait
        end

        workspace.FallenPartsDestroyHeight = 0/0

        local BV = Instance.new("BodyVelocity")
        BV.Name = "EpixVel"
        BV.Parent = RootPart
        BV.Velocity = Vector3.new(9e8, 9e8, 9e8)
        BV.MaxForce = Vector3.new(1/0, 1/0, 1/0)

        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, false)

        if TRootPart and THead then
            if (TRootPart.CFrame.p - THead.CFrame.p).Magnitude > 5 then
                SFBasePart(THead)
            else
                SFBasePart(TRootPart)
            end
        elseif TRootPart and not THead then
            SFBasePart(TRootPart)
        elseif not TRootPart and THead then
            SFBasePart(THead)
        elseif not TRootPart and not THead and Accessory and Handle then
            SFBasePart(Handle)
        else
            return Message("Error❌", "给我殺", 5)
        end

        BV:Destroy()
        Humanoid:SetStateEnabled(Enum.HumanoidStateType.Seated, true)
        workspace.CurrentCamera.CameraSubject = Humanoid

        repeat
            RootPart.CFrame = getgenv().OldPos * CFrame.new(0, .5, 0)
            Character:SetPrimaryPartCFrame(getgenv().OldPos * CFrame.new(0, .5, 0))
            Humanoid:ChangeState("GettingUp")
            table.foreach(Character:GetChildren(), function(_, x)
                if x:IsA("BasePart") then
                    x.Velocity, x.RotVelocity = Vector3.new(), Vector3.new()
                end
            end)
            task.wait()
        until (RootPart.Position - getgenv().OldPos.p).Magnitude < 25
        workspace.FallenPartsDestroyHeight = getgenv().FPDH
    else
        return Message("Error❌甩", "飞", 5)
    end
end

if Targets[1] then for _,x in next, Targets do GetPlayer(x) end else return end

if AllBool then
    for _,x in next, Players:GetPlayers() do
        SkidFling(x)
    end
end

for _,x in next, Targets do
    if GetPlayer(x) and GetPlayer(x) ~= Player then
        if GetPlayer(x).UserId ~= 1414978355 then
            local TPlayer = GetPlayer(x)
            if TPlayer then
                SkidFling(TPlayer)
            end
        else
            Message("Error❌", "乱飞", 5)
        end
    elseif not GetPlayer(x) and not AllBool then
        Message("Error㎏力", "KING.SCPRIT", 5)
    end
end
end)
end
end)
end
end)

King:Toggle("锁定传送",false, function(t)
if plr == nil then
 elseif plr ~= nil then
getgenv().autotele = t
spawn(function()
while autotele do wait()
pcall(function()
game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = game.Players[plr].Character.HumanoidRootPart.CFrame wait()
end)
end
end)
end
end)

Tab3:Label("King就是霖溺")

Tab3:Button("作者QQ群，点击我复制", function()
    setclipboard("霖溺QQ新主群https://qm.qq.com/q/SU0hmhIvwk")
end)
