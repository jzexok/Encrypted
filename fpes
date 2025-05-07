-- Secure Mode
getgenv().SecureMode = true

-- Load Rayfield Library
local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

-- Services
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

-- Create Window
local Window = Rayfield:CreateWindow({
    Name = "Encrypted | FPE: S",
    LoadingTitle = "Encrypted is loading, be patient.",
    LoadingSubtitle = "by pixel.imp",
    ConfigurationSaving = {
        Enabled = false,
        FolderName = "EncryptedFPE",
        FileName = "Config"
    },
    KeySystem = false
})

-- Create Tabs
local MainTab = Window:CreateTab("Main", "construction")
local VisualsTab = Window:CreateTab("Visuals", "eye")
local TeleportsTab = Window:CreateTab("Teleports", "box")

-- Create Sections
local Section = MainTab:CreateSection("Player")
local Section2 = VisualsTab:CreateSection("ESP For Ingame")
local Section3 = TeleportsTab:CreateSection("Teleport Places")

-- Stamina System
local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()

local function setInfiniteStamina()
    if character then
        character:SetAttribute("MaxStamina", math.huge)
        character:SetAttribute("Stamina", math.huge)
    end
end

local function protectStamina()
    if not character then return end
    
    character:GetAttributeChangedSignal("MaxStamina"):Connect(function()
        if character:GetAttribute("MaxStamina") ~= math.huge then
            character:SetAttribute("MaxStamina", math.huge)
        end
    end)
    
    character:GetAttributeChangedSignal("Stamina"):Connect(function()
        if character:GetAttribute("Stamina") ~= math.huge then
            character:SetAttribute("Stamina", math.huge)
        end
    end)
end

MainTab:CreateToggle({
    Name = "Infinite Stamina",
    CurrentValue = false,
    Flag = "InfiniteStaminaToggle",
    Callback = function(Value)
        if character then
            character:SetAttribute("InfiniteStamina", Value)
            if Value then
                setInfiniteStamina()
                protectStamina()
            end
        end
    end
})

MainTab:CreateDivider()

-- Speed Controls
MainTab:CreateSlider({
    Name = "Walk Speed",
    Range = {0, 40},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 12,
    Flag = "WalkSpeedSlider",
    Callback = function(Value)
        if character then
            character:SetAttribute("DefaultSpeed", Value)
        end
    end
})

MainTab:CreateSlider({
    Name = "Run Speed",
    Range = {0, 60},
    Increment = 1,
    Suffix = "Speed",
    CurrentValue = 28,
    Flag = "RunSpeedSlider",
    Callback = function(Value)
        if character then
            character:SetAttribute("RunSpeed", Value)
        end
    end
})

-- 📂 Services and Folder References
local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local LocalPlayer = Players.LocalPlayer

local Students = workspace:WaitForChild("Students")
local Teachers = workspace:WaitForChild("Teachers")
local Alices = workspace:WaitForChild("Alices")

-- 🎨 Team Colors
local teamColors = {
    Students = Color3.fromRGB(255, 255, 255), -- updated for Students
    Teachers = Color3.fromRGB(255, 85, 127),
    -- Alices will have manual fixed color
}

-- 🧠 ESP State Variables
local boxESPEnabled = false
local nameESPEnabled = false

-- 🔍 Functions to get team name and color
local function getTeamNameFromCharacter(character)
    if Students:FindFirstChild(character.Name) then
        return "Students"
    elseif Teachers:FindFirstChild(character.Name) then
        return "Teachers"
    elseif Alices:FindFirstChild(character.Name) then
        return "Alices"
    end
    return nil
end

local function getTeamColor(character)
    local teamName = getTeamNameFromCharacter(character)
    if teamName == "Alices" then
        return Color3.fromRGB(8, 173, 255) -- updated for Alices
    end
    return teamColors[teamName] or Color3.fromRGB(245, 155, 66)
end

-- 📦 Create and Remove Box ESP
local function createBoxESP(character)
    if character == LocalPlayer.Character then return end
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if not hrp or hrp:FindFirstChild("FrameESP") then return end

    local gui = Instance.new("BillboardGui")
    gui.Name = "FrameESP"
    gui.Adornee = hrp
    gui.Size = UDim2.new(4, 0, 6, 0)
    gui.AlwaysOnTop = true
    gui.LightInfluence = 0
    gui.Parent = hrp

    local frame = Instance.new("Frame")
    frame.Size = UDim2.new(1, 0, 1, 0)
    frame.BackgroundTransparency = 1
    frame.Parent = gui

    local stroke = Instance.new("UIStroke")
    stroke.Color = getTeamColor(character)
    stroke.Thickness = 1
    stroke.Parent = frame
end

local function removeBoxESP(character)
    local hrp = character:FindFirstChild("HumanoidRootPart")
    if hrp then
        local gui = hrp:FindFirstChild("FrameESP")
        if gui then
            gui:Destroy()
        end
    end
end

-- 🏷 Create and Remove Name ESP
local function createNameESP(character)
    if character == LocalPlayer.Character then return end
    local head = character:FindFirstChild("Head")
    if not head or head:FindFirstChild("NameESP") then return end

    local gui = Instance.new("BillboardGui")
    gui.Name = "NameESP"
    gui.Size = UDim2.new(0, 200, 0, 50)
    gui.StudsOffset = Vector3.new(0, 2, 0)
    gui.AlwaysOnTop = true
    gui.LightInfluence = 0
    gui.Parent = head

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0.5
    label.TextColor3 = getTeamColor(character)
    label.Text = character.Name
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 11
    label.Parent = gui
end

local function removeNameESP(character)
    local head = character:FindFirstChild("Head")
    if head then
        local gui = head:FindFirstChild("NameESP")
        if gui then
            gui:Destroy()
        end
    end
end

-- 🔁 Continuous Update Loop
local function updateESP()
    for _, teamFolder in pairs({Students, Teachers, Alices}) do
        for _, character in pairs(teamFolder:GetChildren()) do
            if character:IsA("Model") and character:FindFirstChild("HumanoidRootPart") then
                if boxESPEnabled then
                    createBoxESP(character)
                else
                    removeBoxESP(character)
                end

                if nameESPEnabled then
                    createNameESP(character)
                else
                    removeNameESP(character)
                end
            end
        end
    end
end

RunService.RenderStepped:Connect(updateESP)

-- ESP Toggles
VisualsTab:CreateToggle({
    Name = "Player ESP",
    CurrentValue = false,
    Flag = "PlayerESPToggle",
    Callback = function(Value)
        boxESPEnabled = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Name ESP",
    CurrentValue = false,
    Flag = "NameESPToggle",
    Callback = function(Value)
        nameESPEnabled = Value
    end
})

local isBooksESPToggled = false

-- Function to create ESP for a part
local function createESP(object, color)
    if not object:FindFirstChild("NameESP") then
        local gui = Instance.new("BillboardGui")
        gui.Name = "NameESP"
        gui.Size = UDim2.new(0, 200, 0, 50)
        gui.StudsOffset = Vector3.new(0, 2, 0)
        gui.AlwaysOnTop = true
        gui.LightInfluence = 0
        gui.Parent = object

        local label = Instance.new("TextLabel")
        label.Size = UDim2.new(1, 0, 1, 0)
        label.BackgroundTransparency = 1
        label.TextStrokeTransparency = 0.5
        label.TextColor3 = color
        label.Text = object.Name
        label.Font = Enum.Font.GothamSemibold
        label.TextSize = 11
        label.Parent = gui
    end
end

-- Function to handle ESP logic
local function handleESP()
    local booksFolder = workspace:FindFirstChild("Books")
    if booksFolder then
        for _, child in pairs(booksFolder:GetChildren()) do
            if child:IsA("BasePart") then
                createESP(child, Color3.fromRGB(0, 0, 255)) -- Blue color for ESP
            end
        end
    else
        warn("Books folder not found!")
    end
end

-- Function to remove ESP
local function removeESP()
    local booksFolder = workspace:FindFirstChild("Books")
    if booksFolder then
        for _, child in pairs(booksFolder:GetChildren()) do
            local billboard = child:FindFirstChild("NameESP")
            if billboard then
                billboard:Destroy()
            end
        end
    end
end

-- Books ESP
VisualsTab:CreateToggle({
    Name = "Spawned Books ESP",
    CurrentValue = false,
    Flag = "BooksESPToggle",
    Callback = function(Value)
        isBooksESPToggled = Value

        if isBooksESPToggled then
            -- Start applying ESP
            while isBooksESPToggled do
                handleESP()
                wait(1) -- Refresh ESP every second
            end
        else
            -- Remove ESP when toggled off
            removeESP()
        end
    end
})

local teacherSpawns = workspace:WaitForChild("MapFolder"):WaitForChild("Map"):WaitForChild("Special"):WaitForChild("TeacherSpawns")
local breakersFolder = workspace:WaitForChild("MapFolder"):WaitForChild("Map"):WaitForChild("Special"):WaitForChild("BreakersFolder")

local teacherESPEnabled = false
local breakerESPEnabled = false

local function createNameESP(object, color)
    if object:FindFirstChild("NameESP") then return end

    local gui = Instance.new("BillboardGui")
    gui.Name = "NameESP"
    gui.Size = UDim2.new(0, 200, 0, 50)
    gui.StudsOffset = Vector3.new(0, 2, 0)
    gui.AlwaysOnTop = true
    gui.LightInfluence = 0
    gui.Parent = object

    local label = Instance.new("TextLabel")
    label.Size = UDim2.new(1, 0, 1, 0)
    label.BackgroundTransparency = 1
    label.TextStrokeTransparency = 0.5
    label.TextColor3 = color
    label.Text = object.Name
    label.Font = Enum.Font.GothamSemibold
    label.TextSize = 11
    label.Parent = gui
end

local function removeNameESP(object)
    local esp = object:FindFirstChild("NameESP")
    if esp then
        esp:Destroy()
    end
end

local function updateTeacherESP()
    for _, obj in pairs(teacherSpawns:GetChildren()) do
        if obj:IsA("BasePart") then
            if teacherESPEnabled then
                createNameESP(obj, Color3.new(1, 0, 0)) -- Red
            else
                removeNameESP(obj)
            end
        end
    end
end

local function updateBreakerESP()
    for _, obj in pairs(breakersFolder:GetChildren()) do
        if obj:IsA("BasePart") then
            if breakerESPEnabled then
                createNameESP(obj, Color3.new(1, 1, 0)) -- Yellow
            else
                removeNameESP(obj)
            end
        end
    end
end

-- Auto-update if new parts are added
teacherSpawns.ChildAdded:Connect(function(obj)
    if obj:IsA("BasePart") and teacherESPEnabled then
        createNameESP(obj, Color3.new(1, 0, 0))
    end
end)

breakersFolder.ChildAdded:Connect(function(obj)
    if obj:IsA("BasePart") and breakerESPEnabled then
        createNameESP(obj, Color3.new(1, 1, 0))
    end
end)

-- 🔁 Update every half second just in case (optional)
local lastUpdate = 0
RunService.RenderStepped:Connect(function(dt)
    lastUpdate += dt
    if lastUpdate >= 0.5 then
        updateTeacherESP()
        updateBreakerESP()
        lastUpdate = 0
    end
end)

-- Teacher Spawns and Breaker ESP
VisualsTab:CreateToggle({
    Name = "Teacher Spawns ESP",
    CurrentValue = false,
    Flag = "TeacherSpawnsESPToggle",
    Callback = function(Value)
        teacherESPEnabled = Value
    end
})

VisualsTab:CreateToggle({
    Name = "Breaker ESP",
    CurrentValue = false,
    Flag = "BreakerESPToggle",
    Callback = function(Value)
        breakerESPEnabled = Value
    end
})

VisualsTab:CreateDivider()

-- Fullbright
VisualsTab:CreateToggle({
    Name = "Fullbright",
    CurrentValue = false,
    Flag = "FullbrightToggle",
    Callback = function(Value)
        local Lighting = game:GetService("Lighting")
        if Value then
            savedLighting = {
                TimeOfDay = Lighting.TimeOfDay,
                Brightness = Lighting.Brightness,
                Ambient = Lighting.Ambient,
                OutdoorAmbient = Lighting.OutdoorAmbient
            }
            
            Lighting.TimeOfDay = "14:00:00"
            Lighting.Brightness = 2
            Lighting.Ambient = Color3.new(1, 1, 1)
            Lighting.OutdoorAmbient = Color3.new(1, 1, 1)
        else
            for prop, value in pairs(savedLighting) do
                Lighting[prop] = value
            end
        end
    end
})

-- Teleport Buttons
TeleportsTab:CreateButton({
    Name = "Teleport to Student",
    Callback = function()
        local students = workspace.Students:GetChildren()
        if #students > 0 then
            local randomStudent = students[math.random(1, #students)]
            if randomStudent and randomStudent:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character:MoveTo(randomStudent.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
            end
        end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to Teacher",
    Callback = function()
        local teachers = workspace.Teachers:GetChildren()
        if #teachers > 0 then
            local randomTeacher = teachers[math.random(1, #teachers)]
            if randomTeacher and randomTeacher:FindFirstChild("HumanoidRootPart") then
                LocalPlayer.Character:MoveTo(randomTeacher.HumanoidRootPart.Position + Vector3.new(0, 5, 0))
            end
        end
    end
})

TeleportsTab:CreateDivider()

TeleportsTab:CreateButton({
    Name = "Teleport to Book",
    Callback = function()
        local books = workspace.Books:GetChildren()
        if #books > 0 then
            local randomBook = books[math.random(1, #books)]
            if randomBook:IsA("BasePart") then
                LocalPlayer.Character:MoveTo(randomBook.Position + Vector3.new(0, 5, 0))
            end
        end
    end
})

TeleportsTab:CreateButton({
    Name = "Teleport to Breaker",
    Callback = function()
        local breakers = workspace.MapFolder.Map.Special.BreakersFolder:GetChildren()
        if #breakers > 0 then
            local randomBreaker = breakers[math.random(1, #breakers)]
            if randomBreaker:IsA("BasePart") then
                LocalPlayer.Character:MoveTo(randomBreaker.Position + Vector3.new(0, 5, 0))
            end
        end
    end
})

TeleportsTab:CreateButton({
    Name = "Safe Place (Outside the map)",
    Callback = function()
        local breakers = workspace.MapFolder.Map.Special.BreakersFolder:GetChildren()
        if #breakers > 0 then
            local randomBreaker = breakers[math.random(1, #breakers)]
            LocalPlayer.Character:MoveTo(randomBreaker.Position)
        end
    end
})

-- Initialize ESP Systems
RunService.RenderStepped:Connect(function()
    if boxESPEnabled or nameESPEnabled then
        updateESP()
    end
    if isBooksESPToggled then
        handleESP()
    end
    updateTeacherESP()
    updateBreakerESP()
end)
