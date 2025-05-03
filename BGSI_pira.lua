getgenv().Config = {
    ["Hatching"] = {
        ["Rifts"] = {
            ["Eggs"] = {"Throwback Egg", "Pastel Egg", "Bunny Egg","Nightmare Egg"}
        },
        ["Egg"] = "100M Egg" -- // Doesnt work yet, but will in the future
    },
    ["Webhook"] = {
        ["MinDifficulty"] = "1m",
        ["UserID"] = "",
        ["URL"] = "https://discord.com/api/webhooks/1364783387889635419/IQuXU9ql4SQGGQ8PzE36Ez5PT1VVHoDfzRcArXEuYFM5jomS_d1okwzoXOF6o2c2Zmmc",
    },
    ["AutoEnchant"] = true, -- // Enchant Team Up on all Equipped Pets
       ["Debug"] = {
        DisableUI = true,
         },
}
loadstring(game:HttpGet("https://api.luarmor.net/files/v3/loaders/6a28683e5e681161a5074613f6daf64c.lua"))()
