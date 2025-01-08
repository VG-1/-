--[[“造船寻宝”游戏脚本，脚本功能：
• 自动农场（~20k/小时（无游戏通行证））
• 图像加载器
•自动构建
• 计数器隔离模式
• 欺骗轮速
• 传送到地点[内云、圣诞节] ⁣]]

if game.PlaceId ~= 537413528 then
    return
end

if not isfolder("BABFT") then
    makefolder("BABFT")
end

if not isfolder("BABFT/Image") then
    makefolder("BABFT/Image")
end

if not isfolder("BABFT/Build") then
    makefolder("BABFT/Build")
end

local FcMaster = true
local folderName = "ImagePreview"
local previewFolder = Workspace:FindFirstChild(folderName) or Instance.new("Folder", Workspace)
previewFolder.Name = folderName

for _, skibidi in ipairs(previewFolder:GetChildren()) do
        skibidi:Destroy()
end

local Rayfield = loadstring(game:HttpGet('https://raw.githubusercontent.com/Hunryn/VB/refs/heads/main/%E8%80%81%E5%A4%96%E9%80%A0%E8%88%B9%E5%AF%BB%E5%AE%9Dui1%20.lua'))()

local HttpService = cloneref(game:GetService("HttpService"))
local TeleportService = cloneref(game:GetService("TeleportService"))
local Players = game:GetService("Players")
local Workspace = game:GetService("Workspace")
local VirtualUser = game:GetService("VirtualUser")
local httprequest = (syn and syn.request) or (http and http.request) or http_request or (fluxus and fluxus.request) or request
local JobId = game.JobId
local PlaceId = game.PlaceId
local queueteleport = (syn and syn.queue_on_teleport) or queue_on_teleport or (fluxus and fluxus.queue_on_teleport)
local RunService = game:GetService("RunService")

local Window = Rayfield:CreateWindow({
    Name = "造船寻宝",
    Icon = 85108798400826,
    LoadingTitle = "造船寻宝",
    LoadingSubtitle = "欢迎进入脚本 ❤️ by @霖溺",
    Theme = "DarkBlue",
 
    DisableRayfieldPrompts = false,
    DisableBuildWarnings = false,
 
    ConfigurationSaving = {
       Enabled = false,
       FolderName = nil,
       FileName = "Big Hub"
    },
 
    Discord = {
       Enabled = false,
       Invite = "noinvitelink",
       RememberJoins = true
    },
 
    KeySystem = false,
    KeySettings = {
       Title = "Untitled",
       Subtitle = "Key System",
       Note = "No method of obtaining the key is provided",
       FileName = "Key",
       SaveKey = true,
       GrabKeyFromSite = false,
       Key = {"Hello"}
    }
})

local Global = Window:CreateTab("整体的", 125428076789049)
local ImageLoader = Window:CreateTab("图像加载器", 91865122737183)
local AutoBuild = Window:CreateTab("自动构建", 128207976113050)
local BlockNeeded = Window:CreateTab("需要块", 138460602231983)
local Miscellaneous = Window:CreateTab("其他的", 90305619538335)
local Information = Window:CreateTab("信息", 84130531909418)
local Credit = Window:CreateTab("留言", 103654977021797)


local Section = Credit:CreateSection("QQ Group")
local Section = Information:CreateSection("QQ Group")

local Button = Credit:CreateButton({
    Name = "加入我的群聊!",
    Callback = function()
        setclipboard("霖溺QQ新主群：http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=viOjjgj19-TUiZlamhpxb6uvWwVNGoB7&authKey=ACDi9sCtIis%2F4P%2BtirP046uWaJ54%2F149eBnUvaAsMu%2BWZwSFoEQrzZC9UDGFwmp%2F&noverify=0&group_code=744830231")
        Rayfield:Notify({
            Title = "复制成功!",
            Content = "感谢加入霖溺的QQ群聊，去QQ群发送然后点击链接即可！",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end,
 })

local yjdtjf = Global:CreateButton({
    Name = "关闭脚本",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi:Destroy()
    end
        FcMaster = false
        Rayfield:Destroy()
    end,
 })

local qzdqzd = Global:CreateDivider()

local Section = Credit:CreateSection("脚本制作者")

local Labeld = Credit:CreateLabel("作者: @霖溺", 93981953300699, Color3.fromRGB(255, 255, 255), true)

local Paragraph = Credit:CreateParagraph({Title = "脚本", Content = "请不要成为一个坏的“玩家”，请尊重我，尊重我的脚本，享受其中的乐趣，我的这个肯定有搬的成分，不喜勿喷。"})

 local aButton = Information:CreateButton({
    Name = "加入我的群聊",
    Callback = function()
        setclipboard("霖溺QQ新主群：http://qm.qq.com/cgi-bin/qm/qr?_wv=1027&k=viOjjgj19-TUiZlamhpxb6uvWwVNGoB7&authKey=ACDi9sCtIis%2F4P%2BtirP046uWaJ54%2F149eBnUvaAsMu%2BWZwSFoEQrzZC9UDGFwmp%2F&noverify=0&group_code=744830231")
        Rayfield:Notify({
            Title = "复制成功!",
            Content = "感谢加入霖溺的QQ群聊，去QQ群发送然后点击链接即可",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end,
 })

local Section = Information:CreateSection("自动功能")
local Paragraph = Information:CreateParagraph({Title = "信息", Content = "让我知道，如果你曾经见过一个自动功能在每小时的黄金方面比这个更强大，当你不在屏幕前时，你可以使用网络挂钩来跟踪自动功能的统计数据.\n\n - 无增压：20K/小时\n - 使用X1.25:25K/小时\n - 使用X2：40K/小时。\n - 两者都有:50K/小时"})
local Section = Information:CreateSection("图像加载器")
local Paragraph = Information:CreateParagraph({Title = "要求", Content = "（问题）或者您可以自己转换图像：（支持更多图像）图像是从包含特殊数据（RGB）的文件创建的，要拥有这些文件或从您选择的图像创建您自己的文件，您必须加入QQ Group，您需要一个外部脚本（开源），将图像转换为适合此脚本使用的文件，QQ Group服务器中有一个教程。\n\n - 构建速度：您可以选择构建映像的速度。如果您的互联网连接速度较慢，请将速度设置为“低”。对于大图像，不要将其设置为最大值\n\n- 预览：显示图像的预览，以便更轻松地使用修改器或查看图像的外观。还需要建立形象.\n\n- 更改速度：通过打开库存并检查是否没有放置更多块来停止当前进程。更改速度并再次按“加载图像”。它应该从停止的地方自动恢复。.\n\n- 优化模式：即使是最弱的PC或没有良好连接的PC也可以加载图像."})
local Button = Information:CreateButton({
    Name = "复制工作地点清单",
    Callback = function()
        setclipboard("https://www.pythonanywhere.com/whitelist/")
        Rayfield:Notify({
            Title = "复制成功!",
            Content = "通过浏览器中的链接查看哪些网站有效",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end,
 })
local Section = Information:CreateSection("自动构建")
local Paragraph = Information:CreateParagraph({Title = "信息-[自动构建正在进行中]", Content = "此功能不需要任何外部要求，如果您使用已存在的名称保存构建，它将覆盖该构建。您可以在Dc中下载和共享文件.\n\n - 安全模式：防止在加载过程中崩溃。如果你有一个糟糕的互联网连接，这个切换会降低构建速度。.\n\n - 预览：显示生成的预览."})

local player = game.Players.LocalPlayer
local Nplayer = game.Players.LocalPlayer.Name

local characterConnection
local connection

local function enableAntiAFK()
    if not connection then
        Rayfield:Notify({
            Title = "反AFK|开启",
            Content = "你不会在20分钟不活动后被踢",
            Duration = 6.5,
            Image = 124144713366592,
         })
        connection = player.Idled:Connect(function()
            if getgenv().afk6464 then
                VirtualUser:CaptureController()
                VirtualUser:ClickButton2(Vector2.new())
            end
        end)
    end
end

local function disableAntiAFK()
    if connection then
        connection:Disconnect()
        connection = nil
        Rayfield:Notify({
            Title = "反AFK|关闭",
            Content = "你不活动20分钟就会被踢",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end
end

local function loop()
    while true do
        if getgenv().afk6464 then
            enableAntiAFK()
        else
            disableAntiAFK()
        end
        wait(1)
    end
end

spawn(loop)

local Section = Global:CreateSection("Utilities")
local AFKToggle = Global:CreateToggle({
    Name = "反AFK",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        getgenv().afk6464 = Value
    end,
})

if getgenv().afk6464 == true then
    AFKToggle:Set(true)
end

local Button = Global:CreateButton({
    Name = "Load Infinite Yield",
    Callback = function()
        loadstring(game:HttpGet('https://raw.githubusercontent.com/EdgeIY/infiniteyield/master/source'))()
    end,
})

local Button = Global:CreateButton({ -- From IY
    Name = "重新加入",
    Callback = function()
        Rayfield:Notify({
            Title = "重新加入",
            Content = "等一下",
            Duration = 6.5,
            Image = 124144713366592,
         })
         wait(0.2)
        if #Players:GetPlayers() <= 1 then
            Players.LocalPlayer:Kick("\nRejoining...")
            wait()
            TeleportService:Teleport(PlaceId, Players.LocalPlayer)
        else
            TeleportService:TeleportToPlaceInstance(PlaceId, JobId, Players.LocalPlayer)
        end
        wait(5)
        Rayfield:Notify({
            Title = "重新加入可能已失败",
            Content = "尝试重试",
            Duration = 6.5,
            Image = 124144713366592,
         })
    end,
})

local Button = Global:CreateButton({ -- From IY by IY devs and NoobSploit
    Name = "到下一个服务器",
    Callback = function()
        if httprequest then
            Rayfield:Notify({
                Title = "到下一个服务器",
                Content = "等一下",
                Duration = 6.5,
                Image = 124144713366592,
             })
             wait(0.2)
            local servers = {}
            local req = httprequest({Url = string.format("https://games.roblox.com/v1/games/%d/servers/Public?sortOrder=Desc&limit=100&excludeFullGames=true", PlaceId)})
            local body = HttpService:JSONDecode(req.Body)

            if body and body.data then
                for i, v in next, body.data do
                    if type(v) == "table" and tonumber(v.playing) and tonumber(v.maxPlayers) and v.playing < v.maxPlayers and v.id ~= JobId then
                        table.insert(servers, 1, v.id)
                    end
                end
            end

            if #servers > 0 then
                TeleportService:TeleportToPlaceInstance(PlaceId, servers[math.random(1, #servers)], Players.LocalPlayer)
            else
                Rayfield:Notify({
                    Title = "错误❌",
                    Content = "找不到服务器.",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
            end
            wait(5)
            Rayfield:Notify({
                Title = "服务器跃点可能已失败",
                Content = "重试",
                Duration = 6.5,
                Image = 124144713366592,
             })
        end
    end,
})

local Section = Global:CreateSection("自动功能-最强大的一个")
local AutoFarm1 = Global:CreateToggle({
    Name = "自动功能",
    CurrentValue = false,
    Flag = "",
    Callback = function(Value)
        getgenv().AF = Value
        local isFarming = false

        local function startAutoFarm()
            if Value == false then return end

            local player = game.Players.LocalPlayer
            local character = player.Character or player.CharacterAdded:Wait()
            local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

            local newPart = Instance.new("Part")
            newPart.Size = Vector3.new(5, 1, 5)
            newPart.Transparency = 1
            newPart.CanCollide = true
            newPart.Anchored = true
            newPart.Parent = workspace

            local decal = Instance.new("Decal")
            decal.Texture = "rbxassetid://139953968294114"
            decal.Face = Enum.NormalId.Top 
            decal.Parent = newPart

            local function teleportAndMovePart(iteration)
                if Value == false then return end
                if iteration == 5 then
                    humanoidRootPart.CFrame = CFrame.new(-55.34379959106445, -362.25067138671875, 9487.841796875)
                    wait(0.2)
                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                else
                    humanoidRootPart.CFrame = CFrame.new(-51, 65, 984 + (iteration - 1) * 770)
                end
                newPart.Position = humanoidRootPart.Position - Vector3.new(0, 2, 0)

                wait(2.3) -- if lower, it can't work every time

                if iteration == 3 or iteration == 4 then
                else
                    workspace.ClaimRiverResultsGold:FireServer()
                end
            end

            for i = 1, 10 do
                if not Value then
                    break
                end
                teleportAndMovePart(i)
            end

            newPart:Destroy()
        end

                local function onCharacterRespawned()
                    if getgenv().AF == true then
                    local player = game.Players.LocalPlayer
                    local character = player.Character or player.CharacterAdded:Wait()
                    character:WaitForChild("HumanoidRootPart")
                       -- wait(2)
                    startAutoFarm()
                    end
                end

        if Value then
            Rayfield:Notify({
                Title = "自动功能-已启用",
                Content = "建议使用隔离模式和防AFK",
                Duration = 6.5,
                Image = 124144713366592,
             })
            game.Players.LocalPlayer.Character:BreakJoints()
            wait(1)
            game.Players.LocalPlayer.CharacterAdded:Connect(onCharacterRespawned)
        else
            Rayfield:Notify({
                Title = "自动功能-已禁用",
                Content = "请等待迭代完成。",
                Duration = 6.5,
                Image = 124144713366592,
             })
            game.Players.LocalPlayer.CharacterAdded:Connect(function() end)
        end
    end,
})

local FStats = Global:CreateParagraph({Title = "信息", Content = "经过的时间: -".."\n".."金块获得: -".."\n".."黄金上涨: -".."\n".."\n".."黄金每小时: -"})

local clockTime = 0
local running = false
local totalGoldGained = 0
local Ftime = 0 
local totalGoldBlock = 0
local GoldPerHour = 0
local lastGoldValue = game:GetService("Players").LocalPlayer.Data.Gold.Value
local IGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value

local function formatTime(seconds)
    local hours = math.floor(seconds / 3600)
    local minutes = math.floor((seconds % 3600) / 60)
    local sec = seconds % 60
    return hours .. " 时 " .. minutes .. " 分 " .. sec .. " 秒"
end

local function startClock()
    if running then return end
    running = true

    while running do
        if getgenv().AF then
            clockTime = clockTime + 1
        else
            running = false
        end
        wait(1) 
    end
end

game:GetService("RunService").Stepped:Connect(function()
    if getgenv().AF and not running then
        startClock()
    end
end)

function initclock()
while true do
    local FinalGold = game:GetService("Players").LocalPlayer.Data.Gold.Value
    Ftime = formatTime(clockTime)
    local GoldGained = FinalGold - lastGoldValue
    totalGoldGained = totalGoldGained + GoldGained
    local FGBLOCK = game:GetService("Players").LocalPlayer.Data.GoldBlock.Value
    totalGoldBlock = FGBLOCK - IGBLOCK

    GoldPerHour = (totalGoldGained / clockTime) * 3600

    FStats:Set({
        Title = "信息",
        Content = "经过的时间: " .. Ftime .. "\n" ..
                  "金块获得: " .. totalGoldBlock .. "\n" ..
                  "黄金上涨: " .. totalGoldGained .. "\n" ..
                  "黄金每小时: " .. math.floor(GoldPerHour),
    })

    lastGoldValue = FinalGold

    wait(1)
end
end

GoldPerHour = 0

function SendMessageEMBED(url, embed)
    local http = game:GetService("HttpService")
    local headers = {
        ["Content-Type"] = "application/json"
    }
    local data = {
        ["embeds"] = {
            {
                ["title"] = embed.title,
                ["description"] = embed.description,
                ["color"] = embed.color,
                ["fields"] = embed.fields,
                ["footer"] = {
                    ["text"] = embed.footer.text
                },
                ["thumbnail"] = {
                    ["url"] = embed.thumbnail_url
                }
            }
        }
    }
    local body = http:JSONEncode(data)
    local response = request({
        Url = url,
        Method = "POST",
        Headers = headers,
        Body = body
    })
end

local WebHook = "a"
local interval = 1800

function SendAUTOFARMInfo(Ftime, totalGoldBlock, totalGoldGained, GoldPerHour)
    local embed = {
        ["title"] = "霖溺 - 自动功能",
        ["description"] = "Stats",
        ["color"] = 16777215,
        ["fields"] = {
            {
                ["name"] = "时间流逝",
                ["value"] = Ftime or 0
            },
            {
                ["name"] = "金块获得:",
                ["value"] = tostring(totalGoldBlock) or 0
            },
            {
                ["name"] = "黄金上涨:",
                ["value"] = tostring(totalGoldGained) or 0
            },
            {
                ["name"] = "黄金每小时:",
                ["value"] = tostring(math.floor(GoldPerHour)) or 0
            }
        },
        ["footer"] = {
            ["text"] = "制作者 by @霖溺"
        },
        ["thumbnail_url"] = "https://tr.rbxcdn.com/180DAY-5cc07c05652006d448479ae66212782d/768/432/Image/Webp/noFilter"
    }

    if WebHook then
        SendMessageEMBED(WebHook, embed)
    else
        warn("https://discord.com/api/webhooks/1256910598617432115/n9r1hzddGQm1CVIWTz37FXS1Z2lkstRZLhZOUZp1cInbWqJVpt-mq_0wgEvEl5gu_C4t")
    end
end

local InputWebHook = Global:CreateInput({
    Name = "获取信息URL（不是获取个人隐私信息的）:",
    CurrentValue = "",
    PlaceholderText = "URL",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
        WebHook = Text
    end,
})

local InputInterval = Global:CreateInput({
    Name = "消息之间的时间:",
    CurrentValue = "1800",
    PlaceholderText = "Seconds",
    RemoveTextAfterFocusLost = false,
    Flag = "Input2",
    Callback = function(Text)
        interval = tonumber(Text)
    end,
})

local Toggle = Global:CreateToggle({
    Name = "使用 霖溺WebHook（可以不开，这样霖溺就不知道信息）",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        getgenv().WBhook = Value
    end,
})

coroutine.wrap(function()
    while true do
        if getgenv().WBhook and getgenv().AF and not getgenv().intervalLock then
            getgenv().intervalLock = true
            SendAUTOFARMInfo(Ftime, totalGoldBlock, totalGoldGained, GoldPerHour)
            wait(interval)
            getgenv().intervalLock = false
        end
        wait(1)
    end
end)()

-- Image Loader

--BlockId table
--loadstring(game:HttpGet('https://raw.githubusercontent.com/TheRealAsu/BABFT/refs/heads/main/BlockId'))()

local BlockId = {
    BalloonBlock = 1916437856,
    BalloonStarBlock = 1973706944,
    BrickBlock = 1608273751,
    Button = 1678033905,
    CaneBlock = 1298643792,
    CaneRod = 1298644378,
    Cannon = 845567732,
    CarSeat = 1863051164,
    Chair = 924419491,
    ConcreteBlock = 845565990,
    ConcreteRod = 845564596,
    CornerWedge = 845567909,
    FabricBlock = 1608274294,
    FireworkD = 7036614604,
    Flag = 845563550,
    GlassBlock = 1335289047,
    Glue = 1887147909,
    GoldBlock = 1678364253,
    Harpoon = 2062877865,
    HugeMotor = 1865438463,
    IceBlock = 1608273971,
    Lever = 1608273289,
    LifePreserver = 958894042,
    MarbleBlock = 845566206,
    MarbleRod = 845564866,
    Mast = 845566917,
    MegaThruster = 1358894694,
    MetalBlock = 845565844,
    MetalRod = 845564481,
    Motor = 9236142098,
    MysteryBox = 2035087825,
    ObsidianBlock = 1335288552,
    PlasticBlock = 1609332225,
    Pumpkin = 1105248393,
    RustedBlock = 845565648,
    RustedRod = 845564347,
    Seat = 845567578,
    Servo = 1863050474,
    Spring = 1863049770,
    Star = 1916677740,
    SteelIBeam = 845566665,
    Step = 845568429,
    StoneBlock = 845565497,
    StoneRod = 845564162,
    TNT = 932196135,
    Throne = 845567243,
    Thruster = 1317812037,
    TitaniumBlock = 845566458,
    TitaniumRod = 845565080,
    Torch = 5717267458,
    Truss = 845568199,
    Wedge = 845568062,
    Helm = 845567402,
    Window = 845563704,
    WinterThruster = 1298650848,
    WoodBlock = 845568340,
    WoodDoor = 1191997076,
    WoodRod = 845563975,
    WoodTrapDoor = 1191997319,
    YellowChest = 976448763,
    BouncyBlock = 2293816241,
    Bread = 2102742548,
    CandyBlue = 7781285156,
    Plushie2 = 2214257779,
    Plushie1 = 2223411329,
    GrassBlock = 2417963634,
    Lamp = 2413603467,
    Candle = 2413603938,
    ChestLegendary = 4717828937,
    ChestRare = 4717827311,
    ChestCommon = 4717826099,
    ChestUncommon = 4717826702,
    Cake = 2103921305,
    CandyOrange = 7781288646,
    CandyPurple = 7781287748,
    ChestEpic = 4717828261,
    SandBlock = 2418018500,
    HalloweenThruster = 2501530509,
    JetTurbineWinter = 2690396507,
    NeonBlock = 2690438936,
    JetTurbine = 2592852037,
    PilotSeat = 2592852717,
    SonicJetTurbine = 2592851747,
    DualCaneHarpoon = 2690396999,
    Firework = 2042685042,
    FireworkB = 7036612976,
    FireworkC = 7036613636,
    SoccerBall = 2732318916,
    BoxingGlove = 2783557827,
    Heart = 2855511869,
    CandyPink = 7781284023,
    JetPack = 3230273281,
    JetPackEaster = 3230273718,
    Magnet = 2910074282,
    CannonMount = 7130971602,
    Gameboard = 3162472457,
    GunMount = 7130971085,
    SwordMount = 7130969623,
    LockedDoor = 3162472006,
    UltraThruster = 3164908588,
    ShieldGenerator = 3162472660,
    Piston = 3162469425,
    SticksOfTNT = 2511283148,
    CannonTurret = 3162469847,
    Hinge = 3162470626,
    TreasureSmall = 5176251125,
    JetPackStar = 3268106680,
    JetPackUltra = 3268107303,
    Potions = 3500449318,
    TreasureMedium = 5176250512,
    HarpoonGold = 3583968049,
    TreasureLarge = 5176249676,
    Plushie3 = 3591541892,
    Portal = 3744399826,
    JetPackSteampunk = 3838566130,
    BowMount = 7131030442,
    KnightSwordMount = 7131029546,
    LightningStaffMount = 7131031163,
    JackOLantern = 4079113414,
    PineTree = 4210890467,
    CoalBlock = 4539749508,
    Sign = 4539749166,
    BoatMotorUltra = 4539748713,
    BoatMotor = 4539748155,
    BoatMotorWinter = 4539748452,
    DragonEgg = 4742940542,
    FrontWheel = 4736855340,
    BackWheel = 4736853414,
    FrontWheelCookie = 4803870316,
    HugeBackWheel = 4742770672,
    BackWheelCookie = 4803870924,
    HugeFrontWheel = 4742773097,
    Plushie4 = 4918988544,
    Trophy1st = 5299317467,
    Trophy2nd = 5299318083,
    Trophy3rd = 5299319293,
    HarpoonDragon = 5740994229,
    BackWheelMint = 6228838828,
    FrontWheelMint = 6228838214,
    CameraDome = 6218312957,
    Camera = 6218312341,
    ToyBlock = 5578285243,
    Switch = 6361970614,
    LightBulb = 6635725107,
    ParachuteBlock = 6635488100,
    SwitchBig = 6828907824,
    CannonEgg = 6568169777,
    TrophyMaster = 6876313983,
    FireworkA = 7036591081,
    Delay = 7743806268,
    CandyRed = 7781250539,
    SnowballTurret = 8452611946,
    CandyCaneSwordMount = 8452610423,
    Note = 8452606673,
    SmoothWoodBlock = 8142306398,
    SpikeTrap = 7207314809,
    MiniGun = 2302342262,
    LaserTurret = 12229204385,
    Bar = 16088076429,
    Rope = 16088186920
}

local ImageFiles = {}

local function updateImageFiles()

    local files = listfiles("BABFT/Image")

    ImageFiles = {}

    for _, file in ipairs(files) do
        if isfile(file) then
            table.insert(ImageFiles, file)
        end
    end

end

local Label = ImageLoader:CreateLabel("选中“信息”选项卡以使用此功能", 134637165939940, Color3.fromRGB(204, 156, 0), true)

--[[
local Dropdownimg = ImageLoader:CreateDropdown({ --When shlex adds a script to refresh the dropdown
    Name = "Files",
    Options = ImageFiles,
    CurrentOption = {""},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
        print(Options)
    end,
 })
--]]

local function LPTEAM()
local teamName = player.Team.Name

local zoneMapping = {
    black = "黑区",
    blue = "真蓝区",
    green = "迷彩区",
    red = "真红区",
    white = "白区",
    yellow = "新黄区",
    magenta = "品红区"
}

local selectedZoneName = zoneMapping[teamName]

if selectedZoneName then
    local zone = workspace:FindFirstChild(selectedZoneName)
    if zone then
        return zone.position + Vector3.new(-100, 150, 0)
    else
        print("Zone not found in workspace for:" .. selectedZoneName)
    end
else
    print("Error: No Team")
end
end

local function LPTEAM3()
    local teamName = player.Team.Name
    
    local zoneMapping = {
        black = "黑区",
        blue = "真蓝区",
        green = "迷彩区",
        red = "真红区",
        white = "白区",
        yellow = "新黄区",
        magenta = "品红区"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.position
        else
            print("Zone not found in workspace for:" .. selectedZoneName)
        end
    else
        print("Error: No Team")
    end
    end

local function LPTEAM2()
    local teamName = player.Team.Name
    
    local zoneMapping = {
        black = "黑区",
        blue = "真蓝区",
        green = "迷彩区",
        red = "真红区",
        white = "白区",
        yellow = "新黄区",
        magenta = "品红区"
    }
    
    local selectedZoneName = zoneMapping[teamName]
    
    if selectedZoneName then
        local zone = workspace:FindFirstChild(selectedZoneName)
        if zone then
            return zone.Name
        else
            print("在的工作区中找不到区域:" .. selectedZoneName)
        end
    else
        print("错误:没有团队")
    end
end

function BuildingTool()
    game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer("WoodBlock",58,workspace.BlackZone,CFrame.new(0, 6, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1),true,CFrame.new(),false)
end

local imagePreviewFolder = workspace:FindFirstChild("ImagePreview") or Instance.new("Folder")
imagePreviewFolder.Name = "ImagePreview"
imagePreviewFolder.Parent = workspace

local UserBlockList = {}
local dataFolder = game:GetService("Players").LocalPlayer.Data
local BlockType = "PlasticBlock"
local LPBlockvalue = UserBlockList[BlockType]
local blockSize = 2
local startPosition = nil
local PreviewPart = nil
local kflxjdhgw = nil
local currentConnection = nil
local FileImage = nil
local HalfblockSize = blockSize / 2
local cooloffset = Vector3.new(0, 0, 0)
local Unit = 45
local Bdepth = 2
local angleY = 0
local ImgCenterimage = nil
local Brainrot = CFrame.identity
local rotationCFrame = CFrame.Angles(0, 0, 0)
local batchSize = 700
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0
local USEURL = nil
local TempData = {}

local function UUserBlockList()
    UserBlockList = {}
    for _, feuh in ipairs(dataFolder:GetChildren()) do
        if feuh.Value ~= nil then
            UserBlockList[feuh.Name] = feuh.Value
        end
    end
end

local function readFile(filePath)
    if not isfile(filePath) then
        return nil
    end
    return readfile(filePath)
end

local function parseColors(fileContent)
    local data = {}

    for value in string.gmatch(fileContent, "[^,]+") do
        value = value:match("^%s*(.-)%s*$")
        table.insert(data, tonumber(value) or value)
    end
    return data
end

local function calculateFrameSize(data)
    local width = 0
    local height = 0
    local currentWidth = 0

    for i = 1, #data, 3 do
        local r, g, b = data[i], data[i + 1], data[i + 2]

        if r == "B" and g == "B" and b == "B" then
            height += 1
            width = math.max(width, currentWidth)
            currentWidth = 0
        elseif r == "R" and g == "R" and b == "R" then
            currentWidth += 1
        elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then
            currentWidth += 1
        end
    end
    height += 1
    width = math.max(width, currentWidth)
    return Vector3.new(width * blockSize, height * blockSize, Bdepth)
end

local function previewFrame(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if PreviewPart then
        PreviewPart:Destroy()
        PreviewPart = nil
    end

    PreviewPart = Instance.new("Part")
    PreviewPart.Size = frameSize
    PreviewPart.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0) + cooloffset
    PreviewPart.Transparency = 1
    PreviewPart.Color = Color3.new(1, 1, 1)
    PreviewPart.Anchored = true
    PreviewPart.CanCollide = false
    PreviewPart.Name = "PreviewSize"
    PreviewPart.Parent = previewFolder
    PreviewPart.Rotation = Vector3.new(0, angleY - 90, 0)

    local textureId = "rbxassetid://133978572926918"

    local function applyTextureToSurface(surface, sizeX, sizeY)
        local texture = Instance.new("Texture")
        texture.Texture = textureId
        texture.Face = surface
        texture.Parent = PreviewPart
        texture.StudsPerTileU = blockSize
        texture.StudsPerTileV = blockSize
        texture.Transparency = 0.2
    end

    applyTextureToSurface(Enum.NormalId.Front, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Back, frameSize.X, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Left, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Right, frameSize.Z, frameSize.Y)
    applyTextureToSurface(Enum.NormalId.Top, frameSize.X, frameSize.Z)
    applyTextureToSurface(Enum.NormalId.Bottom, frameSize.X, frameSize.Z)
end

local function Centerimage(frameSize, position, blockSize)
    startPosition = LPTEAM()
    if kflxjdhgw then
        kflxjdhgw:Destroy()
        kflxjdhgw = nil
    end

    kflxjdhgw = Instance.new("Part")
    kflxjdhgw.Size = frameSize
    kflxjdhgw.Position = position + Vector3.new(HalfblockSize - blockSize + frameSize.X / 2, HalfblockSize + blockSize - frameSize.Y / 2, 0)
    kflxjdhgw.Transparency = 1
    kflxjdhgw.Color = Color3.new(1, 1, 1)
    kflxjdhgw.Anchored = true
    kflxjdhgw.CanCollide = false
    kflxjdhgw.Name = "Centerimage"
    kflxjdhgw.Parent = previewFolder
    return kflxjdhgw.Position
end


local function buildImageFAST()
    local folder = workspace:FindFirstChild("ImagePreview")
    if not folder then
        return
    end
    
    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            part.Transparency = 0.8
        end
    end

    local parts = {}
    for _, part in ipairs(folder:GetChildren()) do
        if part:IsA("BasePart") and part.Name == "Part" then
            table.insert(parts, part)
        end
    end

    if #parts == 0 then
        return
    end

    local processingIndex = 1
    local batchSize = 30
    local paintData = {}
    local blocksPlaced = {}
    local totalProcessed = 0

    UUserBlockList()
    local uszLPBlockvalue = UserBlockList[BlockType]
    local Zonesss = LPTEAM2()

    local function sendPaintDataAsync(data)
        if #data > 0 then
            task.delay(2, function()
                game:GetService("Players").LocalPlayer.Backpack.PaintingTool.RF:InvokeServer(data)
            end)
        end
    end

    local heartbeatConnection
    heartbeatConnection = RunService.Heartbeat:Connect(function()
        if processingIndex > #parts then
            heartbeatConnection:Disconnect()
            task.wait(3)
            sendPaintDataAsync(paintData)

            Rayfield:Notify({
                Title = "已成功加载图像",
                Content = "现在，您可以再次使用清单",
                Duration = 6.5,
                Image = 124144713366592,
            })
            return
        end

        for i = 1, batchSize do
            if processingIndex > #parts then
                break
            end

            local part = parts[processingIndex]
            processingIndex += 1

            local WORLDPOS = part.Position
            local partRot = part.CFrame - part.Position
            local newCFrame = CFrame.new(math.random(-69, 69), math.random(120000, 2200000), math.random(-69, 69))
            local newwCFrame = CFrame.new(WORLDPOS) * partRot * CFrame.Angles(0, math.rad(90), 0)

            game:GetService("Players").LocalPlayer.Backpack.BuildingTool.RF:InvokeServer(
                BlockType,
                uszLPBlockvalue,
                workspace:FindFirstChild(Zonesss),
                newCFrame,
                true
            )

            local blocks = workspace.Blocks:FindFirstChild(Nplayer):GetChildren()
            TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong += 1
            local targetBlock = blocks[TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong]
            table.insert(blocksPlaced, targetBlock)

            game.Players.LocalPlayer.Backpack.ScalingTool.RF:InvokeServer(
                targetBlock,
                Vector3.new(Bdepth, blockSize, blockSize),
                newwCFrame
            )

            local color = part.Color
            table.insert(paintData, {targetBlock, Color3.new(color.R, color.G, color.B)})

            part:Destroy()

            totalProcessed += 1
            if totalProcessed % 50 == 0 then
                sendPaintDataAsync(paintData)
                paintData = {}
            end
        end
    end)

    task.delay(5, function()
        if #paintData > 0 then
            sendPaintDataAsync(paintData)
        end
    end)
end



function onImgBlockSecChanged()
    getgenv().COCO = false
    wait(0.1)
    getgenv().COCO = true
    buildImage()
end

local function buildImagePREVIEW(data, blockSize)
    local frameSize = calculateFrameSize(data)
    startPosition = LPTEAM() + cooloffset
    ImgCenterimage = Centerimage(frameSize, startPosition, blockSize)
    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        warn("未找到中心图像")
        return
    end

    rotationCFrame = CFrame.Angles(0, math.rad(angleY - 90), 0)

    Brainrot = centerImage.CFrame * rotationCFrame
    local currentX = startPosition.X
    local currentY = startPosition.Y
    local currentZ = startPosition.Z
    local initialX = startPosition.X
    local dataIndex = 1

    local centerImage = workspace.ImagePreview.Centerimage
    if not centerImage then
        warn("未找到中心图像")
        return
    end

    local centerCFrame = centerImage.CFrame

    if currentConnection then
        currentConnection:Disconnect()
    end

    currentConnection = RunService.Heartbeat:Connect(function()
        local finished = false
        for _ = 1, batchSize do
            if dataIndex > #data then
                finished = true
                break
            end

            local r, g, b = data[dataIndex], data[dataIndex + 1], data[dataIndex + 2]
            if r == "B" and g == "B" and b == "B" then
                currentX = initialX
                currentY = currentY - blockSize
            elseif r == "R" and g == "R" and b == "R" then
                currentX = currentX + blockSize
            elseif type(r) == "number" and type(g) == "number" and type(b) == "number" then

                local block = Instance.new("Part")
                block.Size = Vector3.new(blockSize, blockSize, Bdepth)
                block.Color = Color3.fromRGB(r, g, b)
                block.Anchored = true
                block.Material = Enum.Material.SmoothPlastic
                block.CastShadow = false
                block.Parent = previewFolder

                local blockPosition = Vector3.new(currentX, currentY, currentZ) + cooloffset
                local relativeCFrame = centerCFrame:ToObjectSpace(CFrame.new(blockPosition))
                block.CFrame = Brainrot * relativeCFrame
                currentX = currentX + blockSize
            end

            dataIndex += 3
        end

        if finished then
            currentConnection:Disconnect()
            currentConnection = nil
        end
    end)
end

local Section = ImageLoader:CreateSection("导入图像")

local ImageLoaderFile = ImageLoader:CreateLabel("此处将显示详细信息", 72272740678757, Color3.fromRGB(121, 188, 226), false)

local URL_RESO_VALUE = 4
local TBLOCK = 0
local BLKLD = 0
local FI = 0

local Input = ImageLoader:CreateInput({
    Name = "文件或URL",
    CurrentValue = "",
    PlaceholderText = "File/Url",
    RemoveTextAfterFocusLost = true,
    Flag = "Input1",
    Callback = function(Text)
        TBLOCK = 0
        BLKLD = 0
        TempData = {}
        USEURL= nil
        cooloffset = Vector3.new(0, 0, 0)
        Brainrot = CFrame.identity
        angleY = 0
        rotationCFrame = CFrame.Angles(0, 0, 0)
        local fileName = Text .. ".txt"
        local filePath = "BABFT/Image/" .. fileName

        ImageLoaderFile:Set("Fetching...", 72272740678757, Color3.fromRGB(121, 188, 226), false)
        wait(0.22)

        if string.sub(Text, 1, 5) == "https" then
            ImageLoaderFile:Set("方法：URL|状态：正在获取..", 110690411966110, Color3.fromRGB(121, 188, 226), false)

            local url = "https://therealasu.pythonanywhere.com/process_image" -- It is useless to DDOS it, all you're going to do is DDOS pythonanywhere which are protected against that, and the server doesn't cost me anything, it's free
            local headers = {
                ["Content-Type"] = "application/json"
            }

            local function getImageData(imageUrl, resolution)
                local body = HttpService:JSONEncode({
                    image_url = imageUrl,
                    resolution = resolution
                })

                local success, result = pcall(function()
                    return request({
                        Url = url,
                        Method = "POST",
                        Headers = headers,
                        Body = body
                    })
                end)

                if success then
                    if result.StatusCode == 200 then
                        local responseData = result.Body
                        return responseData
                    else
                        ImageLoaderFile:Set("方法：URL状态：错误", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                        return nil
                    end
                else
                    ImageLoaderFile:Set("方法：URL状态：错误", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                    Rayfield:Notify({
                        Title = "错误 ",
                        Content = "无法提取数据",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })
                    return nil
                end
            end

            local response = getImageData(Text, URL_RESO_VALUE)

            if response then
                local success, result = pcall(function()
                    return HttpService:JSONDecode(response)
                end)
                if success and result then
                    if result.error then
                        ImageLoaderFile:Set("方法：URL状态：错误", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                        Rayfield:Notify({
                            Title = "错误",
                            Content = "API错误：不支持URL",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    else
                        USEURL = true
                        TempData = response
                        ImageLoaderFile:Set("方法：URL状态：已获取您可以启用预览", 110690411966110, Color3.fromRGB(133, 230, 138), false)
                        Rayfield:Notify({
                            Title = "成功!",
                            Content = "您的URL已转换并可供使用",
                            Duration = 6.5,
                            Image = 124144713366592,
                        })
                    end
                else
                    --print(response)
                    TempData = response
                    USEURL = true
                    ImageLoaderFile:Set("方法：URL状态：已获取您可以启用预览", 110690411966110, Color3.fromRGB(133, 230, 138), false) -- how the fk
                    Rayfield:Notify({
                        Title = "成功!",
                        Content = "您的URL已转换并可供使用",
                        Duration = 6.5,
                        Image = 124144713366592,
                    })

                end
            else
                ImageLoaderFile:Set("方法：URL状态：错误", 110690411966110, Color3.fromRGB(255, 66, 41), false)
                Rayfield:Notify({
                    Title = "错误",
                    Content = "API可能过载，在Discord服务器中有一个替代方案",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        else
            USEURL = false
            if isfile(filePath) then
                FileImage = fileName
                ImageLoaderFile:Set("方法：文件状态：成功您可以启用预览", 81435876451920, Color3.fromRGB(133, 230, 138), false)
                Rayfield:Notify({
                    Title = "成功!",
                    Content = "文件: " .. fileName .. " 发现!",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            else
                FileImage = nil
                ImageLoaderFile:Set("方法：文件状态：错误", 81435876451920, Color3.fromRGB(255, 66, 41), false)
                Rayfield:Notify({
                    Title = "找不到错误文件",
                    Content = "确保文件 " .. fileName .. " 存在或URL有效，请勿在文本框中输入“.txt”",
                    Duration = 6.5,
                    Image = 124144713366592,
                })
            end
        end
    end,
})

local Input = ImageLoader:CreateInput({
    Name = "仅适用于URL的解决方案",
    CurrentValue = "4",
    PlaceholderText = "Number",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Nb)
        URL_RESO_VALUE = tostring(Nb)
    end,
})

local Divider = ImageLoader:CreateDivider()

local Section = ImageLoader:CreateSection("预览")

local TogglePreview = ImageLoader:CreateToggle({
    Name = "预览",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            BLKLD = 0
            TBLOCK = 0
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
                --print(fileContent)
            end
            if not fileContent then return end
            local data
                data = parseColors(fileContent)
            buildImagePREVIEW(data, blockSize)
        else
            for _, skibidi in ipairs(previewFolder:GetChildren()) do
                if skibidi.Name ~= "PreviewSize" then
                    skibidi:Destroy()
                end
            end
        end
    end,
})

local ToggleGrid = ImageLoader:CreateToggle({
    Name = "格网",
    CurrentValue = false,
    Callback = function(Value)
        if Value then
            local filePath = "BABFT/Image/" .. (FileImage or "default.txt")
            local fileContent = {}
            if USEURL == false then
                fileContent = readFile(filePath)
            else
                fileContent = TempData
                --print(fileContent)
            end
            if not fileContent then return end
            local data = parseColors(fileContent)
            local frameSize = calculateFrameSize(data)
            startPosition = LPTEAM()
            previewFrame(frameSize, startPosition, blockSize)
        else
            if PreviewPart then
                PreviewPart:Destroy()
                PreviewPart = nil
            else
                Rayfield:Notify({
                    Title = "错误",
                    Content = "无文件或文件无效",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
            end
        end
    end,
})

local Slider = ImageLoader:CreateSlider({
    Name = "预览加载速度",
    Range = {100, 4000},
    Increment = 25,
    Suffix = "block/sec",
    CurrentValue = 750,
    Flag = "",
    Callback = function(Value)
        batchSize = Value
    end,
 })

 local Divider = ImageLoader:CreateDivider()

 local Section = ImageLoader:CreateSection("modifiers")

 local Dropdown = ImageLoader:CreateDropdown({
    Name = "块类型",
    Options = {
        "砖块", 
        "煤块", 
        "混凝土块", 
        "布料块", 
        "玻璃块", 
        "金块", 
        "草块", 
        "冰块", 
        "大理石砖", 
        "金属块", 
        "霓虹块", 
        "黑曜岩", 
        "塑料块", 
        "锈块", 
        "光滑的木版", 
        "石块", 
        "钛块", 
        "玩具积木", 
        "木版"
    },
    CurrentOption = {"PlasticBlock"},
    MultipleOptions = false,
    Flag = "",
    Callback = function(Options)
        BlockType = Options[1]
        --print(BlockType)
    end,
})

 local Slider = ImageLoader:CreateSlider({
    Name = "移动",
    Range = {0, 100},
    Increment = 0.1,
    Suffix = "stud",
    CurrentValue = 45,
    Flag = "",
    Callback = function(Value)
        Unit = Value
    end,
 })

local originalCFrames = {}

local Input = ImageLoader:CreateInput({
    Name = "旋转",
    CurrentValue = "0",
    PlaceholderText = "0 - 360",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        angleY = tonumber(Text)
        if not angleY then
            warn("轮值表的输入无效")
            return
        end

        local centerImage = workspace.ImagePreview.Centerimage
        if not centerImage then
            warn("未找到中心图像")
            return
        end

        local rotationCFrame = CFrame.Angles(0, math.rad(angleY), 0)

        Brainrot = centerImage.CFrame * rotationCFrame

        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            if skibidi:IsA("BasePart") and skibidi ~= centerImage then

                local centerCFrame = centerImage.CFrame

                if not originalCFrames[skibidi] then
                    originalCFrames[skibidi] = skibidi.CFrame
                end

                local originalCFrame = originalCFrames[skibidi]
                local relativeCFrame = centerCFrame:ToObjectSpace(originalCFrame)

                local ghaaa = centerCFrame * rotationCFrame * relativeCFrame
                skibidi.CFrame = ghaaa
            end
        end
    end,
})

 local Input = ImageLoader:CreateInput({
    Name = "块深度",
    CurrentValue = "2",
    PlaceholderText = "Value",
    RemoveTextAfterFocusLost = false,
    Flag = "",
    Callback = function(Text)
        Bdepth = tonumber(Text)
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Size = Vector3.new(skibidi.Size.X, skibidi.Size.Y, Bdepth)
            end
    end,
 })

 local Slider = ImageLoader:CreateSlider({
    Name = "尺寸",
    Range = {0.1, 10},
    Increment = 0.1,
    Suffix = "x",
    CurrentValue = 2,
    Flag = "",
    Callback = function(Value)
        blockSize = Value
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 +X",
    Callback = function()
    for _, skibidi in ipairs(previewFolder:GetChildren()) do
        skibidi.Position = skibidi.Position + Vector3.new(Unit, 0, 0)
        end
        cooloffset = cooloffset + Vector3.new(Unit, 0, 0)
        --print(cooloffset)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 -X",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(-Unit, 0, 0)
            end
            cooloffset = cooloffset + Vector3.new(-Unit, 0, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 +Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, Unit, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 -Y",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, -Unit, 0)
            end
            cooloffset = cooloffset + Vector3.new(0, -Unit, 0)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 +Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, Unit)
    end,
 })

 local Button = ImageLoader:CreateButton({
    Name = "移动 -Z",
    Callback = function()
        for _, skibidi in ipairs(previewFolder:GetChildren()) do
            skibidi.Position = skibidi.Position + Vector3.new(0, 0, -Unit)
            end
            cooloffset = cooloffset + Vector3.new(0, 0, -Unit)
    end,
 })

local Divider = ImageLoader:CreateDivider()

local Label = ImageLoader:CreateLabel("构建速度也将取决于您的ping。如果你的WiFi速度太慢，你可能会崩溃。.", 134637165939940, Color3.fromRGB(204, 156, 0), true)



local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneChangeLol = 0
local TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = 0

 local Button = ImageLoader:CreateButton({
    Name = "必须启用生成映像预览",
    Callback = function()
        Rayfield:Notify({
            Title = "加载图像",
            Content = "提示：打开您的库存以中止",
            Duration = 10,
            Image = 124144713366592,
         })

         TBLOCK = 0
TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = 0

local blocksFolder = workspace:FindFirstChild("Blocks")
if blocksFolder then
    local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
    if blockssFolder then
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLong = #blockssFolder:GetChildren()
        TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol = #blockssFolder:GetChildren()
        local parts = {}
        local folder = workspace:FindFirstChild("ImagePreview")
        for _, part in ipairs(folder:GetChildren()) do
            if part:IsA("BasePart") and part.Name == "Part" then
                table.insert(parts, part)
            end
        end
        TBLOCK = #parts
    else
            Rayfield:Notify({
                Title = "错误",
                Content = "找不到文件夹，请尝试重新加入",
                Duration = 6.5,
                Image = 124144713366592,
             })
    end
else
        Rayfield:Notify({
            Title = "错误",
            Content = "找不到文件夹，请尝试重新加入",
            Duration = 6.5,
            Image = 124144713366592,
         })
end
        task.spawn(buildImageFAST)
    end,
 })
 
local Label = ImageLoader:CreateLabel("库存必须在整个过程中关闭，才能正常工作。打开库存以停止流程.", 134637165939940, Color3.fromRGB(204, 156, 0), true)


local ImgStatsP = ImageLoader:CreateParagraph({Title = "信息", Content = "块已加载:\n放置的块:\n色块:\n完成于:"})

function ImgStats()
    local startTime = tick()
    while true do
        local blocksFolder = workspace:FindFirstChild("Blocks")
        local blockssFolder = blocksFolder:FindFirstChild(Nplayer)
        local totalBlocks = #blockssFolder:GetChildren()
        local BLKLD = totalBlocks - TotalBlockInBlocksFolderBeforeBuildImageInitYesThisVarIsVeryLongButThisOneDoesntChangeLol
        local elapsedTime = tick() - startTime
        local blocksPerSecond = BLKLD / elapsedTime
        local blocksRemaining = TBLOCK - BLKLD
        local timeRemaining = blocksRemaining / blocksPerSecond
        local FI = math.max(timeRemaining, 0)
        ImgStatsP:Set({
            Title = "信息",
            Content = "块已加载: "..BLKLD.."/"..TBLOCK..
                      "\n完成于: " .. math.floor(FI) .. "s"
        })
        task.wait(1.2)
    end
end

local initimgfilesbool = false
 function initimgfiles()
    while initimgfilesbool == true do
        updateImageFiles()
        wait(1)
    end
end

--AUTO BUILD
local Label = AutoBuild:CreateLabel("选中“信息”选项卡以使用此功能", 134637165939940, Color3.fromRGB(204, 156, 0), true)
local Label = AutoBuild:CreateLabel("此功能在WIP中-它现在不起作用", 134637165939940, Color3.fromRGB(204, 31, 0), true)

local Divider = AutoBuild:CreateDivider()

local Section = AutoBuild:CreateSection("偷建")

local Dropdown = AutoBuild:CreateDropdown({
    Name = "目标玩家",
    Options = {"Option 1","Option 2"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
    -- The function that takes place when the selected option is changed
    -- The variable (Options) is a table of strings for the current selected options
    end,
 })

 local Input = AutoBuild:CreateInput({
    Name = "内部版本名称",
    CurrentValue = "",
    PlaceholderText = "Name",
    RemoveTextAfterFocusLost = false,
    Flag = "Input1",
    Callback = function(Text)
    -- The function that takes place when the input is changed
    -- The variable (Text) is a string for the value in the text box
    end,
 })

 local Button = AutoBuild:CreateButton({
    Name = "保存",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
 })

 local Divider = AutoBuild:CreateDivider()
 local Section = AutoBuild:CreateSection("自动建造")

 local Dropdown = AutoBuild:CreateDropdown({
    Name = "构建文件",
    Options = {"Option 1","Option 2"},
    CurrentOption = {"Option 1"},
    MultipleOptions = false,
    Flag = "Dropdown1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Options)
    -- The function that takes place when the selected option is changed
    -- The variable (Options) is a table of strings for the current selected options
    end,
 })

 local Toggle = AutoBuild:CreateToggle({
    Name = "预览模式",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

 local Toggle = AutoBuild:CreateToggle({
    Name = "安全模式",
    CurrentValue = false,
    Flag = "Toggle1", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
    Callback = function(Value)
    -- The function that takes place when the toggle is pressed
    -- The variable (Value) is a boolean on whether the toggle is true or false
    end,
 })

 local Button = AutoBuild:CreateButton({
    Name = "装载",
    Callback = function()
    -- The function that takes place when the button is pressed
    end,
 })

 -- OTHER
 local Paragraph = BlockNeeded:CreateParagraph({Title = "重要的", Content = "必须启用预览模式才能计算所需的块数"})
 local Divider = BlockNeeded:CreateDivider()
 local Section = BlockNeeded:CreateSection("图像加载器")
 local LblBlockNeeded = BlockNeeded:CreateLabel("找不到块", 72272740678757, Color3.fromRGB(255, 255, 255), true)
 local Divider = BlockNeeded:CreateDivider()
 local Section = BlockNeeded:CreateSection("自动建造")
 local Label = BlockNeeded:CreateLabel("此功能在WIP中", 134637165939940, Color3.fromRGB(204, 31, 0), true)
 local Divider = BlockNeeded:CreateDivider()
  -- BLOCK NEEDED
  local NbBlockneeded = 0
  local NbBlockmissing = 0
  local Button = BlockNeeded:CreateButton({
      Name = "刷新列表",
      Callback = function()
          NbBlockneeded = 0
          local blocktypeID = BlockId[BlockType]

          for _, skibidi in ipairs(workspace.ImagePreview:GetChildren()) do
            if skibidi.Name == "Part" then

                local blockVolume = skibidi.Size.X * skibidi.Size.Y * skibidi.Size.Z

                local blockSize = (blockVolume < 8) and 8 or blockVolume

                NbBlockneeded = NbBlockneeded + blockSize
            end
        end
            UUserBlockList()

          LPBlockvalue = UserBlockList[BlockType]
          NbBlockneeded = math.ceil(NbBlockneeded / 8)
          NbBlockmissing = NbBlockneeded - LPBlockvalue
          if NbBlockmissing < 0 then
            NbBlockmissing = 0
          end
          LblBlockNeeded:Set("需要 " .. tostring(NbBlockneeded) .. " " .. BlockType .. " 和 " .. tostring(NbBlockmissing) .. " 块丢失", blocktypeID, Color3.fromRGB(255, 255, 255), true)
      end,
  })

local Section = Miscellaneous:CreateSection("瞬间移动")

local Button = Miscellaneous:CreateButton({
    Name = "白",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-49.8510132, -9.7000021, -520.37085, -1, 0, 0, 0, 1, 0, 0, 0, -1))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "黑",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, -69.433342, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "红",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, -64.7801361, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "蓝",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 300.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "洋红",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(396.697418, -9.7000021, 647.219849, 0, 0, 1, 0, 1, -0, -1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "黄",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 640.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "绿",
    Callback = function()
        game.Players.LocalPlayer.Character:SetPrimaryPartCFrame(CFrame.new(-503.82843, -9.7000021, 293.56665, 0, 0, -1, 0, 1, 0, 1, 0, 0))
    end,
 })

local Section = Miscellaneous:CreateSection("Troll")
local Button = Miscellaneous:CreateButton({
    Name = "强制共享模式",
    Callback = function()
        local args = {
            [1] = "ShareBlocks",
            [2] = true
        }
        workspace.SettingFunction:InvokeServer(unpack(args))
    end,
 })

 local function removeLock()
    local Teams = {"黑色地带", "卡莫索内", "品红", "新的黄色地带", "真的是蓝色地带", "真的红地带", "白色地带"}

    for _, teamName in ipairs(Teams) do
        local teamPart = workspace:FindFirstChild(teamName)
        if teamPart then
            local lockFolder = teamPart:FindFirstChild("Lock")
            if lockFolder then
                lockFolder:Destroy()
            end
        end
    end
end

local previousPosition = nil
local counterIsoMODE = false

local function trackPlayerPosition()
    while FcMaster == true do
        if counterIsoMODE then
            removeLock()
            local character = player.Character
            if character then
                local humanoidRootPart = character:FindFirstChild("HumanoidRootPart")
                if humanoidRootPart then
                    previousPosition = humanoidRootPart.CFrame
                end
            end
        end
        task.wait(.1)
    end
end

local function onCharacterAdded(character)
    if counterIsoMODE then
        local humanoidRootPart = character:WaitForChild("HumanoidRootPart")

        if previousPosition then
            humanoidRootPart.CFrame = previousPosition
        end
    end
end

player.CharacterAdded:Connect(onCharacterAdded)
task.spawn(trackPlayerPosition)

local Toggle = Miscellaneous:CreateToggle({
    Name = "隔离模式",
    CurrentValue = false,
    Flag = "Toggle1",
    Callback = function(Value)
        counterIsoMODE = Value
        if counterIsoMODE then
            Rayfield:Notify({
                Title = "隔离模式",
                Content = "你会出现在你死去的地方",
                Duration = 6.5,
                Image = 124144713366592,
             })
            else
                Rayfield:Notify({
                    Title = "隔离模式",
                    Content = "你不会再出现在你死去的地方",
                    Duration = 6.5,
                    Image = 124144713366592,
                 })
        end
    end,
})


 local spoofSpeed = 40

 local Section = Miscellaneous:CreateSection("Spoofer")
 local Slider = Miscellaneous:CreateSlider({
    Name = "车轮转速",
    Range = {10, 1000},
    Increment = 10,
    Suffix = " - MaxSpeed",
    CurrentValue = 40,
    Flag = "Slider1",
    Callback = function(Value)
        spoofSpeed = Value
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "恶搞速度",
    Callback = function()
        local itcihmsoeoesoes = workspace.Blocks:FindFirstChild(Nplayer)
        if itcihmsoeoesoes then
    for _, model in ipairs(itcihmsoeoesoes:GetChildren()) do
        if model:IsA("Model") then
            local maxSpeed = model:FindFirstChild("MaxSpeed")
            if maxSpeed and maxSpeed:IsA("NumberValue") then
                maxSpeed.Value = spoofSpeed
            end
        end
    end
end
    end,
 })

 local Section = Miscellaneous:CreateSection("传送到一个地方")
 local Button = Miscellaneous:CreateButton({
    Name = "Inner Cloud",
    Callback = function()
        TeleportService:Teleport(1930863474, game.Players.LocalPlayer)
    end,
 })

 local Button = Miscellaneous:CreateButton({
    Name = "圣诞节",
    Callback = function()
        TeleportService:Teleport(1930866268, game.Players.LocalPlayer)
    end,
 })

local function Init()
local initclock = coroutine.create(initclock)
local ImgStats = coroutine.create(ImgStats)
local initimgfiles = coroutine.create(initimgfiles)

coroutine.resume(initclock)
coroutine.resume(ImgStats)
coroutine.resume(initimgfiles)
end

Init()