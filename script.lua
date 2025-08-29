-- Load the Spawner
local Spawner = loadstring(game:HttpGet("https://gitlab.com/darkiedarkie/dark/-/raw/main/Spawner.lua"))()

-- Create UI
local player = game.Players.LocalPlayer
local gui = Instance.new("ScreenGui", player:WaitForChild("PlayerGui"))
gui.Name = "PetSpawnerUI"
gui.ResetOnSpawn = false

-- Frame
local frame = Instance.new("Frame", gui)
frame.Size = UDim2.new(0, 300, 0, 180)
frame.Position = UDim2.new(0.5, -150, 0.5, -90)
frame.BackgroundColor3 = Color3.fromRGB(102, 76, 51) -- brown base color for fallback
frame.BorderSizePixel = 0

local corner = Instance.new("UICorner", frame)
corner.CornerRadius = UDim.new(0, 6)

-- Title bar (green top)
local titleBar = Instance.new("Frame", frame)
titleBar.Size = UDim2.new(1, 0, 0, 30)
titleBar.BackgroundColor3 = Color3.fromRGB(74, 153, 45) -- green base for fallback
titleBar.BorderSizePixel = 0

local titleText = Instance.new("TextLabel", titleBar)
titleText.Size = UDim2.new(1, -30, 1, 0)
titleText.Position = UDim2.new(0, 5, 0, 0)
titleText.BackgroundTransparency = 1
titleText.Text = "Nero pet spawner"
titleText.TextColor3 = Color3.new(1,1,1)
titleText.Font = Enum.Font.SourceSansBold
titleText.TextSize = 18
titleText.TextXAlignment = Enum.TextXAlignment.Left

-- Close button (red X)
local closeBtn = Instance.new("TextButton", titleBar)
closeBtn.Size = UDim2.new(0, 30, 1, 0)
closeBtn.Position = UDim2.new(1, -30, 0, 0)
closeBtn.BackgroundColor3 = Color3.fromRGB(180, 35, 35)
closeBtn.Text = "X"
closeBtn.TextColor3 = Color3.new(1,1,1)
closeBtn.Font = Enum.Font.SourceSansBold
closeBtn.TextSize = 20
closeBtn.BorderSizePixel = 0

closeBtn.MouseButton1Click:Connect(function()
    gui:Destroy()
end)

-- Pet Spawner label
local petSpawnerLabel = Instance.new("TextLabel", frame)
petSpawnerLabel.Size = UDim2.new(1, 0, 0, 30)
petSpawnerLabel.Position = UDim2.new(0, 0, 0, 30)
petSpawnerLabel.BackgroundColor3 = Color3.fromRGB(102, 51, 25)
petSpawnerLabel.BorderSizePixel = 0
petSpawnerLabel.Text = "Pet Spawner"
petSpawnerLabel.TextColor3 = Color3.new(1,1,1)
petSpawnerLabel.Font = Enum.Font.SourceSansBold
petSpawnerLabel.TextSize = 20

-- Pet Name TextBox
local petNameBox = Instance.new("TextBox", frame)
petNameBox.Size = UDim2.new(0.9, 0, 0, 30)
petNameBox.Position = UDim2.new(0.05, 0, 0, 60)
petNameBox.PlaceholderText = "Enter Pet Name (e.g., Kitsune)"
petNameBox.BackgroundColor3 = Color3.fromRGB(170, 128, 77)
petNameBox.TextColor3 = Color3.new(1, 1, 1)
petNameBox.Font = Enum.Font.SourceSans
petNameBox.TextSize = 18
petNameBox.Text = ""

-- KG TextBox
local kgBox = Instance.new("TextBox", frame)
kgBox.Size = UDim2.new(0.4, 0, 0, 30)
kgBox.Position = UDim2.new(0.05, 0, 0, 100)
kgBox.PlaceholderText = "KG"
kgBox.BackgroundColor3 = Color3.fromRGB(180, 140, 90)
kgBox.TextColor3 = Color3.new(1, 1, 1)
kgBox.Font = Enum.Font.SourceSans
kgBox.TextSize = 18
kgBox.Text = ""

-- Age TextBox
local ageBox = Instance.new("TextBox", frame)
ageBox.Size = UDim2.new(0.4, 0, 0, 30)
ageBox.Position = UDim2.new(0.55, 0, 0, 100)
ageBox.PlaceholderText = "Age"
ageBox.BackgroundColor3 = Color3.fromRGB(180, 140, 90)
ageBox.TextColor3 = Color3.new(1, 1, 1)
ageBox.Font = Enum.Font.SourceSans
ageBox.TextSize = 18
ageBox.Text = ""

-- Spawn Button
local spawnBtn = Instance.new("TextButton", frame)
spawnBtn.Size = UDim2.new(0.9, 0, 0, 40)
spawnBtn.Position = UDim2.new(0.05, 0, 0, 140)
spawnBtn.Text = "Spawn"
spawnBtn.BackgroundColor3 = Color3.fromRGB(74, 153, 45)
spawnBtn.TextColor3 = Color3.new(1, 1, 1)
spawnBtn.Font = Enum.Font.SourceSansBold
spawnBtn.TextSize = 20
spawnBtn.BorderSizePixel = 0

-- Status Label
local statusLabel = Instance.new("TextLabel", frame)
statusLabel.Size = UDim2.new(1, 0, 0, 25)
statusLabel.Position = UDim2.new(0, 0, 1, -25)
statusLabel.BackgroundTransparency = 1
statusLabel.TextColor3 = Color3.new(1, 1, 1)
statusLabel.Font = Enum.Font.SourceSans
statusLabel.TextSize = 16
statusLabel.Text = ""

-- Function to create stud pattern inside a parent frame
local function createStudPattern(parent, studSize, studColor, offset)
    local rows = math.ceil(parent.AbsoluteSize.Y / studSize)
    local cols = math.ceil(parent.AbsoluteSize.X / studSize)

    for i = 0, cols do
        for j = 0, rows do
            local stud = Instance.new("Frame")
            stud.Size = UDim2.new(0, studSize - 4, 0, studSize - 4) -- small gap
            stud.Position = UDim2.new(0, i * studSize + (offset and studSize/2 or 0), 0, j * studSize + (offset and studSize/2 or 0))
            stud.BackgroundColor3 = studColor
            stud.BorderSizePixel = 0
            stud.ZIndex = 0
            stud.Parent = parent

            -- Add a small highlight to mimic stud shading
            local highlight = Instance.new("Frame", stud)
            highlight.Size = UDim2.new(1, -6, 1, -6)
            highlight.Position = UDim2.new(0, 3, 0, 3)
            highlight.BackgroundColor3 = studColor:Lerp(Color3.new(1, 1, 1), 0.3)
            highlight.BorderSizePixel = 0
            highlight.ZIndex = 1
        end
    end
end

-- Wait for AbsoluteSize to be ready before adding studs
frame:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    -- Clear existing studs if any
    for _, child in ipairs(frame:GetChildren()) do
        if child.Name == "Stud" then
            child:Destroy()
        end
    end
    createStudPattern(frame, 18, Color3.fromRGB(102, 76, 51), false)
end)

titleBar:GetPropertyChangedSignal("AbsoluteSize"):Connect(function()
    -- Clear existing studs if any
    for _, child in ipairs(titleBar:GetChildren()) do
        if child.Name == "Stud" then
            child:Destroy()
        end
    end
    createStudPattern(titleBar, 18, Color3.fromRGB(74, 153, 45), true)
end)

-- We call these once after initial size
task.wait(0.1)
createStudPattern(frame, 18, Color3.fromRGB(102, 76, 51), false)
createStudPattern(titleBar, 18, Color3.fromRGB(74, 153, 45), true)

-- Rename studs for easier removal on resize
for _, stud in ipairs(frame:GetChildren()) do
    if stud:IsA("Frame") and stud.BackgroundColor3 == Color3.fromRGB(102, 76, 51) then
        stud.Name = "Stud"
    end
end
for _, stud in ipairs(titleBar:GetChildren()) do
    if stud:IsA("Frame") and stud.BackgroundColor3 == Color3.fromRGB(74, 153, 45) then
        stud.Name = "Stud"
    end
end

-- Dragging logic
local dragging
local dragInput
local dragStart
local startPos

local function update(input)
    local delta = input.Position - dragStart
    frame.Position = UDim2.new(startPos.X.Scale, startPos.X.Offset + delta.X,
                              startPos.Y.Scale, startPos.Y.Offset + delta.Y)
end

titleBar.InputBegan:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseButton1 then
        dragging = true
        dragStart = input.Position
        startPos = frame.Position

        input.Changed:Connect(function()
            if input.UserInputState == Enum.UserInputState.End then
                dragging = false
            end
        end)
    end
end)

titleBar.InputChanged:Connect(function(input)
    if input.UserInputType == Enum.UserInputType.MouseMovement then
        dragInput = input
    end
end)

game:GetService("UserInputService").InputChanged:Connect(function(input)
    if input == dragInput and dragging then
        update(input)
    end
end)

-- Spawn Logic
spawnBtn.MouseButton1Click:Connect(function()
    local petName = petNameBox.Text
    local kg = tonumber(kgBox.Text)
    local age = tonumber(ageBox.Text)

    if petName == "" or not kg or not age then
        statusLabel.Text = "❌ Please fill in pet name, KG and Age!"
        return
    end

    -- Spawn pet
    local success, err = pcall(function()
        Spawner.SpawnPet(petName, kg, age)
    end)

    if success then
        statusLabel.Text = "✅ Spawned " .. petName .. "!"
    else
        statusLabel.Text = "❌ Failed to spawn. Check name!"
    end
end)
