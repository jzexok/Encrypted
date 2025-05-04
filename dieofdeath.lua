local Rayfield = loadstring(game:HttpGet('https://sirius.menu/rayfield'))()

local Window = Rayfield:CreateWindow({
   Name = "Purna | Die Of Death",
   Icon = 0, -- Icon in Topbar. Can use Lucide Icons (string) or Roblox Image (number). 0 to use no icon (default).
   LoadingTitle = "Loading...",
   LoadingSubtitle = "Made in CHINA",
   Theme = "Default", -- Check https://docs.sirius.menu/rayfield/configuration/themes

   DisableRayfieldPrompts = false,
   DisableBuildWarnings = false, -- Prevents Rayfield from warning when the script has a version mismatch with the interface

   ConfigurationSaving = {
      Enabled = true,
      FolderName = nil, -- Create a custom folder for your hub/game
      FileName = "Big Hub"
   },

   Discord = {
      Enabled = false, -- Prompt the user to join your Discord server if their executor supports it
      Invite = "noinvitelink", -- The Discord invite code, do not include discord.gg/. E.g. discord.gg/ ABCD would be ABCD
      RememberJoins = true -- Set this to false to make them join the discord every time they load it up
   },

   KeySystem = true, -- Set this to true to use our key system
   KeySettings = {
      Title = "Purna Script Hub",
      Subtitle = "Key System",
      Note = "Join our discord to get the key.", -- Use this to tell the user how to get a key
      FileName = "PurnaKeyFile", -- It is recommended to use something unique as other scripts using Rayfield may overwrite your key file
      SaveKey = true, -- The user's key will be saved, but if you change the key, they will be unable to use your script
      GrabKeyFromSite = false, -- If this is true, set Key below to the RAW site you would like Rayfield to get the key from
      Key = {"kurtlercantusethis"} -- List of keys that will be accepted by the system, can be RAW file links (pastebin, github etc) or simple strings ("hello","key22")
   }
})

setclipboard("https://discord.gg/dmD9KqFwHM")

local Tab = Window:CreateTab("Main", 128706247346129)
local Tab2 = Window:CreateTab("Visuals", 129261498595427)
local Tab3 = Window:CreateTab("Abilities", 15909461117)
local Tab4 = Window:CreateTab("Custom Decks", 15431766976)
local Tab5 = Window:CreateTab("Others", 5107175347)

Tab3:CreateSection("Stunner")

local Button = Tab3:CreateButton({
   Name = "Punch",
   Callback = function()
      local args = {
         "Punch"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Block",
   Callback = function()
      local args = {
         "Block"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Revolver",
   Callback = function()
      local args = {
         "Revolver"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Taunt",
   Callback = function()
      local args = {
         "Taunt"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})


Tab3:CreateSection("Runner")

local Button = Tab3:CreateButton({
   Name = "Adrenaline",
   Callback = function()
      local args = {
         "Adrenaline"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Dash",
   Callback = function()
      local args = {
         "Dash"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Cloak",
   Callback = function()
      local args = {
         "Cloak"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})


Tab3:CreateSection("Support")

local Button = Tab3:CreateButton({
   Name = "Caretaker",
   Callback = function()
      local args = {
         "Caretaker"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Hotdog",
   Callback = function()
      local args = {
         "Hotdog"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

local Button = Tab3:CreateButton({
   Name = "Bonus Pad",
   Callback = function()
      local args = {
         "BonusPad"
      }
      game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteFunctions"):WaitForChild("UseAbility"):InvokeServer(unpack(args))
   end,
})

Tab:CreateSection("Camera")

local Players = game:GetService("Players")
local RunService = game:GetService("RunService")
local fovSettings = {
    isEnabled = true,
    minFOV = 70,
    maxFOV = 120,
    currentFOV = 70
}

local function updateCameraFOV()
    local player = Players.LocalPlayer
    if player and player.Character then
        local camera = workspace.CurrentCamera
        if camera and fovSettings.isEnabled then
            camera.FieldOfView = fovSettings.currentFOV
        else
            camera.FieldOfView = 70
        end
    end
end

local Slider = Tab:CreateSlider({
   Name = "Field Of View",
   Range = {20, 120},
   Increment = 2,
   Suffix = "Bingbong",
   CurrentValue = 70,
   Flag = "FOVSlider",
   Callback = function(value)
   fovSettings.currentFOV = value
        if fovSettings.isEnabled then
            updateCameraFOV()
        end
   end,
})

local Toggle = Tab:CreateToggle({
   Name = "Set FOV",
   CurrentValue = false,
   Flag = "ToggleForFOV", -- A flag is the identifier for the configuration file, make sure every element has a different flag if you're using configuration saving to ensure no overlaps
   Callback = function(state)
   fovSettings.isEnabled = state
        updateCameraFOV()
   end,
})

RunService.RenderStepped:Connect(function()
    updateCameraFOV()
end)

Players.LocalPlayer.CharacterAdded:Connect(function()
    wait(0.5)
    updateCameraFOV()
end)

Tab:CreateSection("Player")

local player = game.Players.LocalPlayer
local character = player.Character or player.CharacterAdded:Wait()
local infiniteStaminaEnabled = false

-- Function to set infinite stamina
local function setInfiniteMaxStamina(character)
    if character then
        character:SetAttribute("MaxStamina", math.huge)
        print("Set MaxStamina to infinite")
    end
end

-- Protects the max stamina attribute from being changed
local function protectMaxStamina(character)
    if not character then return end
    character:GetAttributeChangedSignal("MaxStamina"):Connect(function()
        if infiniteStaminaEnabled and character:GetAttribute("MaxStamina") ~= math.huge then
            character:SetAttribute("MaxStamina", math.huge)
            print("Protected MaxStamina from change")
        end
    end)
end

-- Event listener for character respawn
local function onCharacterSpawn(newCharacter)
    character = newCharacter
    wait(0.5)
    if infiniteStaminaEnabled then
        setInfiniteMaxStamina(character)
        protectMaxStamina(character)
        print("Applied infinite stamina to new character")
    end
end

-- Enables infinite stamina and applies to current character
local function enableInfiniteStamina()
    infiniteStaminaEnabled = true
    if character then
        setInfiniteMaxStamina(character)
        protectMaxStamina(character)
        print("Infinite stamina enabled")
    end
end

-- Event connection to listen for new character spawn
player.CharacterAdded:Connect(onCharacterSpawn)

local Button = Tab:CreateButton({
   Name = "Infinite Stamina",
   Callback = function()
      enableInfiniteStamina()
      print("Infinite stamina activated.")
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Sprint Speed",
   Range = {27, 80},
   Increment = 1,
   Suffix = "Curba",
   CurrentValue = 27,
   Flag = "Purnagamingcurba",
   Callback = function(t)
   if character then
            character:SetAttribute("SprintSpeed", t)
        end
   end,
})

local Slider = Tab:CreateSlider({
   Name = "Walk Speed",
   Range = {7, 27},
   Increment = 1,
   Suffix = "Zurna",
   CurrentValue = 7,
   Flag = "Purnagamingcurba",
   Callback = function(t)
   if character then
            character:SetAttribute("WalkSpeed", t)
        end
   end,
})

Tab2:CreateSection("Esp Types")

local Button3 = Tab2:CreateButton({
   Name = "Player ESP",
   Callback = function()
      local oyuncular = game:GetService("Players")
      local calistir = game:GetService("RunService")
      local ben = oyuncular.LocalPlayer
      local espListesi = {}

      local renkler = {
         Survivor = Color3.new(1, 1, 1), -- Beyaz
         Killer = Color3.new(1, 0, 0),   -- Kırmızı
         Ghost = Color3.new(0, 0.5, 1),  -- Mavi
      }

      local function espEkle(oyuncu)
         if oyuncu == ben then return end
         local karakter = oyuncu.Character
         if not karakter or not karakter:FindFirstChild("HumanoidRootPart") then return end

         local grup = karakter.Parent
         if not grup then return end
         local renk = renkler[grup.Name] or Color3.new(1, 1, 0) -- default sarı

         if espListesi[oyuncu] then espListesi[oyuncu]:Destroy() end

         local h = Instance.new("Highlight")
         h.Adornee = karakter
         h.FillColor = renk
         h.FillTransparency = 0.8
         h.OutlineColor = renk
         h.OutlineTransparency = 0.5
         h.DepthMode = Enum.HighlightDepthMode.AlwaysOnTop
         h.Parent = game.CoreGui
         espListesi[oyuncu] = h
      end

      oyuncular.PlayerRemoving:Connect(function(o)
         if espListesi[o] then
            espListesi[o]:Destroy()
            espListesi[o] = nil
         end
      end)

      calistir.RenderStepped:Connect(function()
         for _, o in ipairs(oyuncular:GetPlayers()) do
            local karakter = o.Character
            if karakter and karakter.Parent then
               local grup = karakter.Parent
               if not espListesi[o] or espListesi[o].Adornee ~= karakter then
                  espEkle(o)
               end
            end
         end
      end)
   end,
})

local Button4 = Tab2:CreateButton({
   Name = "Name ESP",
   Callback = function()
      local p = game:GetService("Players")
      local lp = p.LocalPlayer

      local renkler = {
         Survivor = Color3.new(1,1,1),
         Killer = Color3.new(1,0,0),
         Ghost = Color3.new(0,0.5,1),
      }

      local function renk(karakter)
         local klasor = karakter and karakter.Parent
         if klasor and renkler[klasor.Name] then
            return renkler[klasor.Name]
         end
         return Color3.new(1,1,0)
      end

      local function esp(oy)
         if oy == lp then return end
         local char = oy.Character
         if not char then return end
         local head = char:FindFirstChild("Head")
         if not head or head:FindFirstChild("esp") then return end

         local gui = Instance.new("BillboardGui")
         gui.Name = "esp"
         gui.Adornee = head
         gui.Size = UDim2.new(0,200,0,40)
         gui.StudsOffset = Vector3.new(0,2,0)
         gui.AlwaysOnTop = true

         local txt = Instance.new("TextLabel", gui)
         txt.Size = UDim2.new(1,0,1,0)
         txt.BackgroundTransparency = 1
         txt.Text = oy.Name
         txt.TextColor3 = renk(char)
         txt.Font = Enum.Font.Code
         txt.TextStrokeTransparency = 0.5
         txt.TextSize = 13

         gui.Parent = head
      end

      for _,oy in ipairs(p:GetPlayers()) do
         oy.CharacterAdded:Connect(function()
            task.wait(1)
            esp(oy)
         end)
      end

      p.PlayerAdded:Connect(function(oy)
         oy.CharacterAdded:Connect(function()
            task.wait(1)
            esp(oy)
         end)
      end)
   end,
})

local Button5 = Tab2:CreateButton({
   Name = "Music Box ESP",
   Callback = function()
      local function esp(o)
         if o:IsA("BasePart") and not o:FindFirstChild("esp_musicbox") then
            local b = Instance.new("BillboardGui")
            b.Name = "esp_musicbox"
            b.Adornee = o
            b.Size = UDim2.new(0, 100, 0, 30)
            b.StudsOffset = Vector3.new(0, 2, 0)
            b.AlwaysOnTop = true

            local t = Instance.new("TextLabel", b)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "MusicBox"
            t.TextColor3 = Color3.new(1, 1, 0)
            t.TextStrokeTransparency = 0.5
            t.TextSize = 13
            t.Font = Enum.Font.Code

            b.Parent = o
         end
      end

      local function tara(obj)
         if obj.Name == "MusicBox" then
            esp(obj)
         end
         for _, c in ipairs(obj:GetChildren()) do
            tara(c)
         end
      end

      tara(workspace)

      workspace.DescendantAdded:Connect(function(obj)
         if obj.Name == "MusicBox" then
            esp(obj)
         end
      end)
   end,
})

local Button6 = Tab2:CreateButton({
   Name = "Bonus Pad ESP",
   Callback = function()
      local function esp(o)
         if o:IsA("BasePart") and not o:FindFirstChild("esp_bonuspad") then
            local b = Instance.new("BillboardGui")
            b.Name = "esp_bonuspad"
            b.Adornee = o
            b.Size = UDim2.new(0, 100, 0, 30)
            b.StudsOffset = Vector3.new(0, 2, 0)
            b.AlwaysOnTop = true

            local t = Instance.new("TextLabel", b)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "BonusPad"
            t.TextColor3 = Color3.new(1, 1, 0)
            t.TextStrokeTransparency = 0.5
            t.TextSize = 13
            t.Font = Enum.Font.Code

            b.Parent = o
         end
      end

      local function taraBonusPad(obj)
         if obj.Name == "BonusPad" then
            for _, c in ipairs(obj:GetChildren()) do
               if c:IsA("BasePart") then
                  esp(c)
               end
            end
         end
         for _, c in ipairs(obj:GetChildren()) do
            taraBonusPad(c)
         end
      end

      taraBonusPad(workspace)

      workspace.DescendantAdded:Connect(function(obj)
         if obj.Name == "BonusPad" then
            for _, c in ipairs(obj:GetChildren()) do
               if c:IsA("BasePart") then
                  esp(c)
               end
            end
         end
      end)
   end,
})

local Button7 = Tab2:CreateButton({
   Name = "Red Vessel ESP",
   Callback = function()
      local function esp(o)
         if o:IsA("BasePart") and not o:FindFirstChild("esp_redvessel") then
            local b = Instance.new("BillboardGui")
            b.Name = "esp_redvessel"
            b.Adornee = o
            b.Size = UDim2.new(0, 100, 0, 30)
            b.StudsOffset = Vector3.new(0, 2, 0)
            b.AlwaysOnTop = true

            local t = Instance.new("TextLabel", b)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "RedHairedVessel"
            t.TextColor3 = Color3.new(1, 1, 0)
            t.TextStrokeTransparency = 0.5
            t.TextSize = 13
            t.Font = Enum.Font.Code

            b.Parent = o
         end
      end

      local function tara(obj)
         if obj.Name == "RedHairedVessel" then
            esp(obj)
         end
         for _, c in ipairs(obj:GetChildren()) do
            tara(c)
         end
      end

      tara(workspace)

      workspace.DescendantAdded:Connect(function(obj)
         if obj.Name == "RedHairedVessel" then
            esp(obj)
         end
      end)
   end,
})

local Button8 = Tab2:CreateButton({
   Name = "Banana Peel ESP",
   Callback = function()
      local function esp(o)
         if o:IsA("BasePart") and not o:FindFirstChild("esp_banana") then
            local b = Instance.new("BillboardGui")
            b.Name = "esp_banana"
            b.Adornee = o
            b.Size = UDim2.new(0, 100, 0, 30)
            b.StudsOffset = Vector3.new(0, 2, 0)
            b.AlwaysOnTop = true

            local t = Instance.new("TextLabel", b)
            t.Size = UDim2.new(1, 0, 1, 0)
            t.BackgroundTransparency = 1
            t.Text = "BananaPeel"
            t.TextColor3 = Color3.new(1, 1, 0)
            t.TextStrokeTransparency = 0.5
            t.TextSize = 13
            t.Font = Enum.Font.Code

            b.Parent = o
         end
      end

      local function tara(obj)
         if obj.Name == "BananaPeel" then
            esp(obj)
         end
         for _, c in ipairs(obj:GetChildren()) do
            tara(c)
         end
      end

      tara(workspace)

      workspace.DescendantAdded:Connect(function(obj)
         if obj.Name == "BananaPeel" then
            esp(obj)
         end
      end)
   end,
})

Tab5:CreateSection("Game Things")

local Button9 = Tab5:CreateButton({
    Name = "Instant Proximity Prompt",
    Callback = function()
        task.spawn(function()
            while true do
                for _, obj in ipairs(workspace:GetDescendants()) do
                    if obj:IsA("ProximityPrompt") then
                        if obj.HoldDuration ~= 0 then
                            obj.HoldDuration = 0
                        end
                        if not obj.Enabled then
                            obj.Enabled = true
                        end
                        -- Ek ayarlar buraya eklenebilir
                    end
                end
                task.wait(0.5) -- Dengeli hız
            end
        end)
    end,
})

local Button10 = Tab5:CreateButton({
    Name = "Destroy Artful's Walls",
    Callback = function()
        task.spawn(function()
            while true do
                local other = workspace:FindFirstChild("GameAssets")
                if other then
                    other = other:FindFirstChild("Teams")
                    if other then
                        other = other:FindFirstChild("Other")
                        if other then
                            other:Destroy()
                        end
                    end
                end
                task.wait(0.1)
            end
        end)
    end,
})

Tab4:CreateSection("Custom Deck Of Your Own")

-- Ability list
local abilityOptions = {
   "Punch", "Block", "Dash", "Adrenaline",
   "Cloak", "BonusPad", "Hotdog", "Caretaker",
   "Revolver", "Taunt"
}

-- Track selections
local selectedFirst = nil
local selectedSecond = nil

-- First ability dropdown
Tab4:CreateDropdown({
   Name = "First Ability",
   Options = abilityOptions,
   CurrentOption = {"Punch"},
   MultipleOptions = false,
   Flag = "FirstAbility",
   Callback = function(option)
      selectedFirst = option[1]
   end,
})

-- Second ability dropdown
Tab4:CreateDropdown({
   Name = "Second Ability",
   Options = abilityOptions,
   CurrentOption = {"Block"},
   MultipleOptions = false,
   Flag = "SecondAbility",
   Callback = function(option)
      selectedSecond = option[1]
   end,
})

-- Submit button
Tab4:CreateButton({
   Name = "Change Deck",
   Callback = function()
      if not selectedFirst or not selectedSecond then
         warn("Both abilities must be selected.")
         return
      end

      local args = {
         {selectedFirst, selectedSecond}
      }

      game:GetService("ReplicatedStorage"):WaitForChild("Events")
         :WaitForChild("RemoteEvents")
         :WaitForChild("AbilitySelection")
         :FireServer(unpack(args))
   end,
})

Tab4:CreateSection("Ready Made Decks")

-- Stunner button
Tab4:CreateButton({
    Name = "Stunner",
    Callback = function()
        local args = {
            {"Block", "Punch"}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack(args))
    end,
})

-- Support button
Tab4:CreateButton({
    Name = "Support",
    Callback = function()
        local args = {
            {"Caretaker", "Hotdog"}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack(args))
    end,
})

-- Stealth button
Tab4:CreateButton({
    Name = "Stealth",
    Callback = function()
        local args = {
            {"Cloak", "BonusPad"}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack(args))
    end,
})

-- Runner button
Tab4:CreateButton({
    Name = "Runner",
    Callback = function()
        local args = {
            {"Adrenaline", "Dash"}
        }
        game:GetService("ReplicatedStorage"):WaitForChild("Events"):WaitForChild("RemoteEvents"):WaitForChild("AbilitySelection"):FireServer(unpack(args))
    end,
})
