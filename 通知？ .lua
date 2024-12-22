local a = {
    ["Notification"] = Instance.new("ScreenGui"),
    ["Frame"] = Instance.new("Frame"),
    ["UICorner"] = Instance.new("UICorner"),
    ["UIStroke"] = Instance.new("UIStroke"),
    ["TextLabel"] = Instance.new("TextLabel"),
    ["Frame 2"] = Instance.new("Frame"),
    ["UIListLayout"] = Instance.new("UIListLayout"),
    ["TextButton"] = Instance.new("TextButton"),
    ["UICorner 2"] = Instance.new("UICorner"),
    ["UIStroke 2"] = Instance.new("UIStroke")
}

a["Notification"]["Name"] = "Notification"
a["Notification"]["Parent"] = game:GetService("Players").LocalPlayer:WaitForChild("PlayerGui")

a["Frame"]["Position"] = UDim2.new(0.5, 0, 0.5, 0)
a["Frame"]["Size"] = UDim2.new(0, 0, 0, 0) -- Start with size 0
a["Frame"]["AnchorPoint"] = Vector2.new(0.5, 0.5)
a["Frame"]["BackgroundColor3"] = Color3.fromRGB(10, 140, 175)
a["Frame"]["BorderSizePixel"] = 0
a["Frame"]["Name"] = "Frame"
a["Frame"]["Parent"] = a["Notification"]

a["UICorner"]["Name"] = "UICorner"
a["UICorner"]["Parent"] = a["Frame"]

a["UIStroke"]["Color"] = Color3.fromRGB(0, 220, 255)
a["UIStroke"]["Thickness"] = 4
a["UIStroke"]["Name"] = "UIStroke"
a["UIStroke"]["Parent"] = a["Frame"]

a["TextLabel"]["Position"] = UDim2.new(0, 10, 0, 7)
a["TextLabel"]["Size"] = UDim2.new(1, -20, 0, 80)
a["TextLabel"]["BackgroundTransparency"] = 1
a["TextLabel"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
a["TextLabel"]["Text"] = "霖溺脚本最新更新时间2024/12/20，脚本新更新内容:堡垒服务器超强功能和地面战争全部秒杀"
a["TextLabel"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
a["TextLabel"]["TextSize"] = 20
a["TextLabel"]["TextWrapped"] = true
a["TextLabel"]["Name"] = "TextLabel"
a["TextLabel"]["Parent"] = a["Frame"]

a["Frame 2"]["Position"] = UDim2.new(0, 10, 1, -50)
a["Frame 2"]["Size"] = UDim2.new(1, -20, 0, 40)
a["Frame 2"]["BackgroundTransparency"] = 1
a["Frame 2"]["Name"] = "Frame"
a["Frame 2"]["Parent"] = a["Frame"]

a["UIListLayout"]["Padding"] = UDim.new(0, 10)
a["UIListLayout"]["HorizontalAlignment"] = Enum.HorizontalAlignment.Center
a["UIListLayout"]["FillDirection"] = Enum.FillDirection.Horizontal
a["UIListLayout"]["VerticalAlignment"] = Enum.VerticalAlignment.Center
a["UIListLayout"]["Name"] = "UIListLayout"
a["UIListLayout"]["Parent"] = a["Frame 2"]

a["TextButton"]["Size"] = UDim2.new(0.4, 0, 0, 30)
a["TextButton"]["BackgroundColor3"] = Color3.fromRGB(0, 220, 255)
a["TextButton"]["FontFace"] = Font.new("rbxasset://fonts/families/GothamSSm.json", Enum.FontWeight.Regular, Enum.FontStyle.Normal)
a["TextButton"]["Text"] = "好的"
a["TextButton"]["TextColor3"] = Color3.fromRGB(255, 255, 255)
a["TextButton"]["TextSize"] = 16
a["TextButton"]["TextWrapped"] = true
a["TextButton"]["Name"] = "TextButton"
a["TextButton"]["Parent"] = a["Frame 2"]

a["UICorner 2"]["CornerRadius"] = UDim.new(0, 6)
a["UICorner 2"]["Name"] = "UICorner"
a["UICorner 2"]["Parent"] = a["TextButton"]

a["UIStroke 2"]["Color"] = Color3.fromRGB(255, 255, 255)
a["UIStroke 2"]["Name"] = "UIStroke"
a["UIStroke 2"]["Parent"] = a["TextButton"]


local TweenService = game:GetService("TweenService")
local appearTween = TweenService:Create(
    a["Frame"],
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.Out),
    { Size = UDim2.new(0, 300, 0, 120) }
)

local disappearTween = TweenService:Create(
    a["Frame"],
    TweenInfo.new(0.5, Enum.EasingStyle.Quad, Enum.EasingDirection.In),
    { Size = UDim2.new(0, 0, 0, 0) }
)


appearTween:Play()


a["TextButton"].MouseButton1Click:Connect(function()
    disappearTween:Play()
    disappearTween.Completed:Connect(function()
    setclipboard("霖溺QQ新主群：http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=viOjjgj19-TUiZlamhpxb6uvWwVNGoB7&authKey=ACDi9sCtIis%2F4P%2BtirP046uWaJ54%2F149eBnUvaAsMu%2BWZwSFoEQrzZC9UDGFwmp%2F&noverify=0&group_code=744830231")
        
        
        a["Notification"]:Destroy()
    end)
end)