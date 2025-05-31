
getgenv().Settings = {
    Multiplier = 1, 
    ["Kill All"] = false, 
    ["Revive All"] = false, 
    ["High Health"] = false,
    ["Server Crasher"] = false, 
    ["Style Changer"] = "Telamon" 
}

game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Linni Script!";Text = "加载...";Duration = 5;})
local start = tick()
if not game:IsLoaded() then game.Loaded:Wait() end
local time = tick()-start
game:GetService("StarterGui"):SetCore("SendNotification",{Title = "Linni Script!";Text = "加载! 加载所需时间: "..string.format("%.2f",time).." 秒.";Duration = 5;})
for _ = 1,getgenv().Settings.Multiplier do
    for _,v in ipairs(game:GetService("ReplicatedStorage").PlrMan.Items:GetChildren()) do
        if v:IsA("Part") then
            game:GetService("ReplicatedStorage").PlrMan.Items.PickupItem:FireServer(v.Name)
        end
    end
end
game:GetService("RunService").RenderStepped:Connect(function()
    if getgenv().Settings["Kill All"] then
        for _,v in ipairs(workspace.Enemies:GetChildren()) do
            if v:IsA("Model") and v.Name ~= "Highlight" then
                game:GetService("ReplicatedStorage").HurtEnemy:FireServer(v,math.huge)
            end
        end
    end
    if getgenv().Settings["Revive All"] then
        
    end
end)
if getgenv().Settings["High Health"] then
    for _ = 1,500 do
        game:GetService("ReplicatedStorage"):WaitForChild("PlrMan"):WaitForChild("Items"):WaitForChild("PickupItem"):FireServer("Armor")
        game:GetService("ReplicatedStorage"):WaitForChild("PlrMan"):WaitForChild("Items"):WaitForChild("PickupItem"):FireServer("Chezburger")
        game:GetService("ReplicatedStorage"):WaitForChild("PlrMan"):WaitForChild("Items"):WaitForChild("PickupItem"):FireServer("RegenCoil")
    end
end
if getgenv().Settings["Server Crasher"] then
    workspace.Bullets:Destroy()
    local count = 0
    local connection;connection = game:GetService("RunService").Stepped:Connect(function() if conut ~= 1e5 then game:GetService("ReplicatedStorage"):WaitForChild("PlrMan"):WaitForChild("Items"):WaitForChild("PickupItem"):FireServer("Windforce") else connection:Disconnect() connection = nil end end)
end
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenUI"):WaitForChild("SetActiveFighter"):FireServer(tostring(getgenv().Settings["Style Changer"]))
game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui"):WaitForChild("ScreenUI"):WaitForChild("StartGame"):FireServer()