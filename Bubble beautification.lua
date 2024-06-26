textcolour = Color3.new(0,0,0)

    game:GetService("Chat").BubbleChatEnabled = true

    coroutine.wrap(function()
      while wait() do
        for i = 0,255,10 do
          textcolour = Color3.new(255/255,i/255,0/255)
          wait()
        end
        for i = 255,0,-10 do
          textcolour = Color3.new(i/255,255/255,0/255)
          wait()
        end
        for i = 0,255,10 do
          textcolour = Color3.new(0/255,255/255,i/255)
          wait()
        end
        for i = 255,0,-10 do
          textcolour = Color3.new(0/255,i/255,255/255)
          wait()
        end
        for i = 0,255,10 do
          textcolour = Color3.new(i/255,0/255,255/255)
          wait()
        end
        for i = 255,0,-10 do
          textcolour = Color3.new(255/255,0/255,i/255)
          wait()
        end
      end
    end)()

    local settings = {

    }

    while wait() do
      pcall(function()
        game:GetService("Chat"):SetBubbleChatSettings({
          TextColor3 = textcolour,
          BubbleDuration = 20,
          MaxBubbles = 20,
          BackgroundColor3 = Color3.fromRGB(0, 0, 0),
          TextSize = 16,
          Font = Enum.Font.Ubuntu,
          Transparency = .1,
          CornerRadius = UDim.new(0, 30),
          TailVisible = true,
          Padding = 8,
          MaxWidth = 500,
          VerticalStudsOffset = 0,
          BubblesSpacing = 3,
          MinimizeDistance = 250,
          MaxDistance = 500,
        })
      end)
    end
  end)
linni:Button("娱乐脚本",function()
loadstring(game:HttpGet("https://raw.githubusercontent.com/KingHaxxor/King-Hax-Gui/main/Arab-Gui%E2%98%85"))()
end)
linni:Button("通用杀死全部",function()
    while true do
local player = game.Players.LocalPlayer

for i, v in ipairs(game.Players:GetPlayers()) do
  if v.Name ~= player.Name then
    local upperTorso = v.Character:FindFirstChild("UpperTorso")
    if upperTorso then
      local humanoid = v.Character:FindFirstChild("Humanoid")
      if humanoid then
        local args = {
          [1] = player.Character.Pistol,
          [2] = {
            ["p"] = Vector3.new(-0.04069240391254425, 103.88400268554688, 3.110368251800537),
            ["pid"] = 1,
            ["part"] = upperTorso,
            ["d"] = 2.241058111190796,
            ["maxDist"] = 1.8013105392456055,
            ["h"] = humanoid,
            ["m"] = Enum.Material.Plastic,
            ["sid"] = 1,
            ["t"] = 0.01474018327328561,
            ["n"] = Vector3.new(-0.21247883141040802, 0.5551897287368774, -0.8041250705718994)
          }
        }

        game:GetService("ReplicatedStorage").WeaponsSystem.Network.WeaponHit:FireServer(unpack(args))
      end
    end
  end
end
wait(0.1)
end
