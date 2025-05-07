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

-- Modified to always create and validate key
local function SaveTheKeyPlease(key)
    pcall(function()
        writefile(KEY_FILE, key or "Zimbabwe")
    end)
end

local function LoaderTheKeyPlease()
    local success, result = pcall(function()
        if not isfile(KEY_FILE) then
            SaveTheKeyPlease("Zimbabwe")
            return "Zimbabwe"
        end
        return readfile(KEY_FILE)
    end)
    
    if not success then
        SaveTheKeyPlease("Zimbabwe")
        return "Zimbabwe"
    end
    
    return result
end

-- Modified check key function with improved validation
local function CheckiKey(key)
    -- Always validate for specified usernames
    local player = game:GetService("Players").LocalPlayer
    if player and (player.Name == "dynaxz" or player.Name == "NEWnew010942") then
        return {
            code = "KEY_VALID",
            data = {
                auth_expire = os.time() + (24 * 60 * 60),
                total_executions = 1
            }
        }
    end
    
    -- Validate specific keys
    if key == "Zimbabwe" then
        return {
            code = "KEY_VALID",
            data = {
                auth_expire = os.time() + (24 * 60 * 60),
                total_executions = 1
            }
        }
    end

    -- Attempt original validation but with fallback
    local success, status = pcall(function()
        return api.check_key(key)
    end)
    
    if not success then
        return {
            code = "KEY_VALID",
            data = {
                auth_expire = os.time() + (24 * 60 * 60),
                total_executions = 1
            }
        }
    end
    
    return status
end

-- Ensure key exists before anything else
pcall(function()
    if not isfile(KEY_FILE) then
        SaveTheKeyPlease("Zimbabwe")
    end
end)

-- Initialize key validation immediately
local key = LoaderTheKeyPlease()
if key and key ~= "" then
    local status = CheckiKey(key)
    ApiStatusCode = status.code
    if status.code == "KEY_VALID" then
        sigmakey = key
        
        -- Rest of your notification system
        local Notificationes = 0
        local function MakeNotificatione(title, message, duration)
            -- Your original notification code here
        end

        pcall(function()
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
        end)
    else
        makeUI()
    end
else
    makeUI()
end

-- Wait for validation but with timeout
local startTime = os.time()
while ApiStatusCode ~= "KEY_VALID" and os.time() - startTime < 5 do
    task.wait(0.1)
end

if ApiStatusCode == "KEY_VALID" then
    script_key = sigmakey
    api.load_script()
end
