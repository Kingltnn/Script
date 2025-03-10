local Module = loadstring(game:HttpGet("https://raw.githubusercontent.com/ReimuSimpu/ReimuSimpu/refs/heads/main/Modules.lua"))()
local RaidCmds = require(game.ReplicatedStorage.Library.Client.RaidCmds)
local save = require(game.ReplicatedStorage.Library.Client.Save)
local event = game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active:WaitForChild("LuckyEventWorld")
local RaidInstance = require(game.ReplicatedStorage.Library.Client.RaidCmds.RaidInstance)

Module.RandomizeTeleport = function(Area) 
   LocalPlayer.Character.HumanoidRootPart.CFrame = CFrame.new(Area.X + math.random(-25, 25), Area.Y, Area.Z + math.random(-25, 25)) * CFrame.Angles(0, math.rad(math.random(0, 360)), 0) 
   task.wait()
function GetOpenPortal()
    for i = 1, 10 do
        local PortalData = RaidInstance.GetByPortal(i)
        if not PortalData then
            return i
        end
    end
end
local Breakables = game.Workspace.__THINGS.Breakables
local PortalNum = GetOpenPortal()
local gui = game.Players.LocalPlayer.PlayerGui.LuckyRaidSettings
assert(getconnections ~= nil, "Executor not supported!")
function GetClosestModel()
    local character = game.Players.LocalPlayer.Character
    if not character or not character:FindFirstChild("HumanoidRootPart") then
        return nil
    end
    local hrp = character.HumanoidRootPart
    local closest_model = nil
    local shortest_distance = math.huge
    for _, model in pairs(game.Workspace.__THINGS.Breakables:GetChildren()) do
        if model:IsA("Model") then
            local part = model:FindFirstChildWhichIsA("MeshPart") or model:FindFirstChildWhichIsA("Part")
            if part then
                local distance = (part.Position - hrp.Position).Magnitude
                if distance < shortest_distance then
                    closest_model = model
                    shortest_distance = distance
                end
            end
        end
    end
    return closest_model
end
function Find_Big_Chest()
    for _, v in ipairs(game.Workspace.__THINGS.Breakables:GetChildren()) do
        if v:GetAttribute("BreakableID") == "LuckyRaidBigChest"  then
            return true
        end
    end
end
function HasKey()
    local Save = save.Get()
    if not Save then
        return false
    end
    for UID, data in pairs(Save.Inventory.Misc) do
        if data.id == "Leprechaun Key" and type(data._am) == "number" and data._am > 0 then
            return true
        end
    end
    return false
end

function TP(CFrameOrVector3)
    local pos = CFrame.new(CFrameOrVector3.X, CFrameOrVector3.Y, CFrameOrVector3.Z)
    game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = pos
end

while task.wait(1) do
    task.wait(6)
    repeat
        task.wait(0.5)
        event = game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("LuckyEventWorld")
    until event
    local Raid = nil
    local dif = 30
    repeat
        if not dif then
            dif = RaidCmds.GetLevel()
        end
        if dif then
            local success = game.ReplicatedStorage.Network.Raids_RequestCreate:InvokeServer({Difficulty = 30, Portal = PortalNum, PartyMode = 1})
            TP(event:WaitForChild("INTERACT").RaidPortals[PortalNum].Enter.CFrame)
            repeat
                task.wait(0.5)
                Raid = game.Workspace.__THINGS.__INSTANCE_CONTAINER.Active:FindFirstChild("LuckyRaid")
            until Raid
            task.wait(0.5)
        end
        task.wait(1)
    until Raid
    repeat
        task.wait()
        local closest_model = GetClosestModel()
        if closest_model then
            local target_part = closest_model:FindFirstChildWhichIsA("MeshPart") or closest_model:FindFirstChildWhichIsA("Part")
            if target_part then
                game.Players.LocalPlayer.Character.HumanoidRootPart.CFrame = target_part.CFrame
            end
        end
    until Find_Big_Chest() or (Raid:FindFirstChild("INTERACT") and Raid.INTERACT:FindFirstChild("HugeChest"))
    if not Find_Big_Chest() then
        for _, chest_name in pairs({"HugeChest", "TitanicChest", "LootChest"}) do
            TP(Raid.INTERACT:WaitForChild(chest_name):FindFirstChildOfClass("Part").CFrame)
            task.wait(0.2)
            game.ReplicatedStorage.Network.Raids_OpenChest:InvokeServer(chest_name)
            task.wait(0.2)
        end
        if HasKey() then
            TP(Raid.INTERACT:WaitForChild("LeprechaunChest"):FindFirstChildOfClass("Part").CFrame)
            task.wait(0.5)
            game.ReplicatedStorage.Network.Raids_OpenChest:InvokeServer("LeprechaunChest")
            task.wait(0.5)
        end
    end
    game.ReplicatedStorage.Network.Instancing_PlayerLeaveInstance:FireServer("LuckyRaid")
    repeat
        task.wait(0.25)
    until game.Workspace.__THINGS.__INSTANCE_CONTAINER:FindFirstChild("LuckyRaid") == nil
    task.wait(0.25)
    game.ReplicatedStorage.Network.Instancing_PlayerEnterInstance:InvokeServer("LuckyEventWorld")
end
