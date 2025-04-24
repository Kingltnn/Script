getgenv().Settings = {
    ["Egg Settings"] = {
        OpenEggs = true,
        Egg ="Rainbow Egg",
        --// Supports ANY egg ("Rainbow Egg", "Infinity Egg", ...). Keep "Best" for new accounts.

        ["Notifications"] = {
            Webhook = "https://discord.com/api/webhooks/1364783387889635419/IQuXU9ql4SQGGQ8PzE36Ez5PT1VVHoDfzRcArXEuYFM5jomS_d1okwzoXOF6o2c2Zmmc",
            DiscordID = "",
            Difficulty = "100k", --// Minimum Difficulty for Webhook Notifications
        },

        ["Rifts"] = {
            FindRifts = true,
            SortByMultiplier = false, 
            --// true --> Sort by Multiplier out of ALL Targetted Rifts.
            --// false --> Sort by Multiplier out of BEST Targetted Rifts.

            Targets = {"Aura Egg", "Throwback Egg" },
            --// Targets = {} will automatically find the Top 3 BEST Rifts to hatch.
        },
    },

    ["Debug"] = {
        DisableUI = true,
    },
}
loadstring(game:HttpGet("https://system-exodus.com/scripts/BGSI/OneClick.lua"))()
