local a = game.PlaceId

local b = {
    [71895508397153] = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/dieofdeath.lua",
    [79834168261692] = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/forsakenbutbad.lua",
    [17164617414]    = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/fpes.lua",
    [18687417158]    = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/forsaken.lua",
    [74161468227974] = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/fivenightshunted.lua",
    [121418861436763] = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/inamegastore.lua",
    [2413927524] = "https://raw.githubusercontent.com/jzexok/Encrypted/refs/heads/main/therakeremastered.lua"
}

if b[a] then
    loadstring(game:HttpGet(b[a]))()
else
    warn("script doesnt exist for this game.")
end
