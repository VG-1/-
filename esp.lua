local ESP = {}

function ESP.AddFolder(
    name: string
)
    local ESPFolder = Instance.new("Folder")
    ESPFolder.Parent = workspace
    ESPFolder.Name = name
end

function ESP.AddESP(
    folderName: string,
    text: string,
    adornee: BasePart | Model,
    color: Color3
)
    if not workspace:FindFirstChild(folderName) then
        return
    end

    local ESPBillboardGui = Instance.new("BillboardGui")
    ESPBillboardGui.Parent = workspace:FindFirstChild(folderName)
    ESPBillboardGui.Adornee = adornee
    ESPBillboardGui.Size = UDim2.new(0, 20, 0, 20)
    ESPBillboardGui.StudsOffset = Vector3.new(0, 3, 0)
    ESPBillboardGui.AlwaysOnTop = true

    local ESPTextLabel = Instance.new("TextLabel")
    ESPTextLabel.Parent = ESPBillboardGui
    ESPTextLabel.Size = UDim2.new(1, 0, 1, 0)
    ESPTextLabel.BackgroundTransparency = 1
    ESPTextLabel.Text = text
    ESPTextLabel.TextColor3 = color
    ESPTextLabel.TextStrokeTransparency = 0.5
    ESPTextLabel.TextScaled = true
end

function ESP.Clear(
    folderName: string
)
    if workspace:FindFirstChild(folderName) then
        workspace:FindFirstChild(folderName):ClearAllChildren()
    end
end

return ESP