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
local win = UILib:Window("King Script丨彩虹朋友2",Color3.fromRGB(102, 255, 153), Enum.KeyCode.RightControl)

local setup = win:Tab("介绍")
    setup:Label("King客户名:"..game.Players.LocalPlayer.Character.Name)
    setup:Label("King授权的注入器:"..identifyexecutor())
    setup:Label("King谢谢支持")
    setup:Label("副作者:龙叔【别被冒充的龙叔的圈了】")
    setup:Label("帮助者:白貓，钢筋，无xia，无极，清岩")
    setup:Label("本次开启为彩虹朋友2脚本")

local Tab = win:Tab("基础功能")

Tab:Toggle("自动收集物品", false, function(Value)
    Get = Value 
end)

Tab:Toggle("自动放置物品", false, function(Value)
    Put = Value 
end)

Tab:Toggle("自动收集眼球", false, function(Value)
_G.toggle = Value
while _G.toggle do task.wait()
    for i,v in pairs(game:GetService("Workspace"):FindFirstChild("ignore"):GetDescendants()) do
        if v.Name == "RootPart" and v:IsA("Part") and v.Parent.Name == "Looky" then
            game:GetService("Players").LocalPlayer.Character:WaitForChild("HumanoidRootPart").CFrame = v.CFrame 
            task.wait()
        end
    end
  end
end)

Tab:Toggle("怪物上色内透", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
                if not v:FindFirstChild("Lol") then
                    local esp = Instance.new("Highlight", v)
                    esp.Name = "Lol"
                    esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                    esp.FillColor = Color3.new(0, 0, 255)
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace").Monsters:GetChildren()) do
            v:FindFirstChild("Lol"):Destroy()
        end
    end
end)

Tab:Toggle("物品上色内透", false, function(bool)
    if bool then
        local runService = game:GetService("RunService")
        event = runService.RenderStepped:Connect(function()
            for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
                if v:FindFirstChild("TouchTrigger") then
                    if not v:FindFirstChild("Lol") then
                        local esp = Instance.new("Highlight", v)
                        esp.Name = "Lol"
                        esp.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
                        esp.FillColor = Color3.new(0, 255, 0)
                    end
                end
            end
        end)
    end
    if not bool then
        event:Disconnect()
        for _,v in pairs(game:GetService("Workspace"):GetChildren()) do
            if v:FindFirstChild("TouchTrigger") then
                v:FindFirstChild("Lol"):Destroy()
            end
        end
    end
end)

RunService.Stepped:Connect(function() 
    if Get then 
        Model = { 
            "Block"..math.random(1, 24), 
            "FoodOrange", 
            "FoodPink", 
            "FoodGreen", 
            "Fuse"..math.random(1, 14), 
            "Battery", 
            "LightBulb", 
            "GasCanister", 
            "CakeMix" 
        } 
        for i, v in pairs(game.Workspace:GetChildren()) do 
            if table.find(Model, v.Name) then 
                v.TouchTrigger.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
            end 
        end 
    end 
end) 

RunService.Stepped:Connect(function() 
    if Put then 
        for i, v in pairs(game.Workspace.GroupBuildStructures:GetChildren()) do 
            v.Trigger.CFrame = game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame 
        end 
    end 
end)

RunService.Stepped:Connect(function() 
    for i, v in pairs(game.Workspace.ignore:GetChildren()) do 
        if v.Name == "Looky" then 
            v.Highlight.Enabled = EO 
        end 
    end 
end)