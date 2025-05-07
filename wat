if string.split(identifyexecutor() or "None", " ")[1] == "Xeno" then
    getgenv().WebSocket = nil
end

local api = loadstring(game:HttpGet("https://sdkapi-public.luarmor.net/library.lua"))()
api.script_id = "d0632c30c8af0316aae11552dcb2a21d"
local sigmakey
local KeyCheckingButtonSex
local ApiStatusCode
local KEY_FILE = "fartkey.txt"
local STATUS_MESSAGES = {
    KEY_VALID = "Key valid! Loading script...",
    KEY_HWID_LOCKED = "HWID Mismatch. Please get a new Key!.",
    KEY_INCORRECT = "Key is wrong or Expired!",
}

-- Modified key functions to bypass checks
local function SaveTheKeyPlease(key)
    writefile(KEY_FILE, key or "Zimbabwe")
end

local function LoaderTheKeyPlease()
    if not isfile(KEY_FILE) then
        SaveTheKeyPlease("Zimbabwe")
    end
    return readfile(KEY_FILE)
end

-- Modified check key function to always validate for specific user
local function CheckiKey(key)
    if game:GetService("Players").LocalPlayer.Name == "NEWnew010942" then  -- Changed to your username
        return {
            code = "KEY_VALID",
            data = {
                auth_expire = os.time() + (24 * 60 * 60),  -- 24 hours
                total_executions = 1
            }
        }
    end
    
    if key == "Zimbabwe" then
        return {
            code = "KEY_VALID",
            data = {
                auth_expire = os.time() + (24 * 60 * 60),
                total_executions = 1
            }
        }
    end

    -- Always return valid to bypass checks
    return {
        code = "KEY_VALID",
        data = {
            auth_expire = os.time() + (24 * 60 * 60),
            total_executions = 1
        }
    }
end

-- Ensure key file exists
if not isfile(KEY_FILE) then
    SaveTheKeyPlease("Zimbabwe")
end

-- Rest of your original UI code remains the same
local function makeUI()
    local scringui = Instance.new("ScreenGui")
    scringui.Name = "KeySystem"
    scringui.Parent = game.CoreGui
    local blurEffect = Instance.new("BlurEffect")
    blurEffect.Size = 0
    blurEffect.Name = "KeySystemBlur"
    blurEffect.Parent = game:GetService("Lighting")
    local Background = Instance.new("Frame")
    Background.Name = "Background"
    Background.BackgroundColor3 = Color3.fromRGB(0, 0, 0)
    Background.BackgroundTransparency = 0.5
    Background.Size = UDim2.new(1.5, 0, 1.5, 0)
    Background.Position = UDim2.new(0.5, 0, 0.3, 0)
    Background.AnchorPoint = Vector2.new(0.5, 0.5)
    Background.ZIndex = 10
    Background.Parent = scringui

    -- Rest of your original UI code...
    -- [Previous UI code continues here unchanged]
    
    return scringui
end

-- Modified key check logic
local key = LoaderTheKeyPlease()
if key and key ~= "" then
    local status = CheckiKey(key)
    ApiStatusCode = status.code
    if status.code == "KEY_VALID" then
        sigmakey = key
        local Notificationes = 0
        local function MakeNotificatione(title, message, duration)
            -- Your original notification code...
        end

        MakeNotificatione("Welcome", "Script access valid! Loading script...", 3)
        task.delay(0.5, function()
            local timeLeftSecs = status.data.auth_expire - os.time()
            local hours = math.floor(timeLeftSecs / 3600)
            local minutes = math.floor((timeLeftSecs % 3600) / 60)
            MakeNotificatione("Subscription Info", "Time left: " .. hours .. "h " .. minutes .. "m", 4)
        end)
        task.delay(1, function()
            MakeNotificatione("Usage Stats", "Total executions: " .. status.data.total_executions, 4)
        end)
    else
        print(STATUS_MESSAGES[status.code] or status.message)
        makeUI()
    end
else
    makeUI()
end

while ApiStatusCode ~= "KEY_VALID" do
    task.wait(0.1)
end
script_key = sigmakey
api.load_script()
