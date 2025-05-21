local a = game.PlaceId

local b = {
    [71895508397153] = "https://raw.githubusercontent.com/63dl/Encrypted/refs/heads/main/dieofdeath.lua",
    [79834168261692] = "https://raw.githubusercontent.com/63dl/Encrypted/refs/heads/main/forsakenbutbad.lua",
    [17164617414]    = "https://raw.githubusercontent.com/63dl/Encrypted/refs/heads/main/fpes.lua",
    [18687417158]    = "https://raw.githubusercontent.com/63dl/Encrypted/refs/heads/main/forsaken.lua",
    [74161468227974] = "https://raw.githubusercontent.com/63dl/Encrypted/refs/heads/main/fivenightshunted.lua"
}

if b[a] then
    loadstring(game:HttpGet(b[a]))()
else
    warn("script doesnt exist for this game.")
end
