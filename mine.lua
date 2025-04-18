local player = game.Players.LocalPlayer
local ReplicatedStorage = game:GetService("ReplicatedStorage")
local Network = ReplicatedStorage:WaitForChild("Network")
local InstancingEvent = Network:WaitForChild("Instancing_PlayerEnterInstance")
local TeleportService = game:GetService("TeleportService")
local HttpService = game:GetService("HttpService")

local isMining = false
local stopMining = false

-- Function to teleport to mining area
local function teleportToMining()
    local miningCFrame = CFrame.new(11962.5088, 10.7709723, -4000.94141)
    player.Character.HumanoidRootPart.CFrame = miningCFrame
    print("Teleported to Mining Area")
end

-- Function to get server list
local function ListServers(cursor)
    local Servers = "https://games.roblox.com/v1/games/" .. game.PlaceId .. "/servers/Public?sortOrder=Asc&limit=100"
    local Raw = game:HttpGet(Servers .. ((cursor and "&cursor=" .. cursor) or ""))
    return HttpService:JSONDecode(Raw)
end

-- Function to teleport to Zone 5
local function teleportToZone5()
    local args = { [1] = "__Zone_3" }
    Network:WaitForChild("Teleports_RequestInstanceTeleport"):InvokeServer(unpack(args))
    print("Teleported to Zone 3")
end

-- Function to start mining
local function startMining()
    local targetEvent = Network:WaitForChild("BlockWorlds_Target")
    local breakEvent = Network:WaitForChild("BlockWorlds_Break")

    local currentY = 0
    local currentX, currentZ = -8, 7
    local MIN_Y, MIN_X, MAX_X, MIN_Z, MAX_Z = -200, -8, 7, -8, 7

    local function incrementCoords()
        currentZ = currentZ - 1
        if currentZ < MIN_Z then
            currentZ = MAX_Z
            currentX = currentX + 1
            if currentX > MAX_X then
                currentX = MIN_X
                currentY = currentY - 1
                if currentY < MIN_Y then
                    stopMining = true
                end
            end
        end
    end

    while isMining and not stopMining do
        local coords = Vector3int16.new(currentX, currentY, currentZ)
        targetEvent:FireServer(coords)
        task.wait(0)
        breakEvent:FireServer(coords)
        task.wait(0)
        incrementCoords()
    end
end

-- Function for server hop
local function serverHop()
    local Server, Next = nil, nil

    -- Wait for the configured time before attempting server hop
    task.wait(getgenv().Config.serverHopWaitTime)

    -- Attempt to find a server to hop to
    repeat
        local Servers = ListServers(Next)
        Server = Servers.data[math.random(1, (#Servers.data / 3))]  -- Randomly select a server
        Next = Servers.nextPageCursor
    until Server

    -- If there's a valid server with available slots and not the same job id
    if Server.playing < Server.maxPlayers and Server.id ~= game.JobId then
        TeleportService:TeleportToPlaceInstance(game.PlaceId, Server.id, player)
        print("Server hop to server with ID: " .. Server.id)
    else
        print("No suitable server found, retrying...")
        serverHop()  -- Retry server hop if no suitable server found
    end
end

-- Example code for world detection and teleportation (you can keep your existing logic for this)
local currentPlaceId = game.PlaceId
print("Current Place ID:", currentPlaceId)

local world, teleportCFrame
if currentPlaceId == 8737899170 then
    world = 1
    teleportCFrame = CFrame.new(179.702148, 19.0086937, -139.804199, -2.56299973e-05, -0.998239934, 0.0593036786, 0.99999994, -2.56299973e-05, 7.59959221e-07, 7.59959221e-07, 0.0593036786, 0.998239994)
elif currentPlaceId == 16498369169 then
    world = 2
    teleportCFrame = CFrame.new(-9984.90137, 18.9828796, -293.768799, -1.25169754e-05, -0.999974966, 0.00708046556, 1, -1.25169754e-05, 4.42378223e-08, 4.42378223e-08, 0.00708046556, 0.999974906)
elif currentPlaceId == 17503543197 then
    world = 3
    teleportCFrame = CFrame.new(-10263.2471, 5.67860603, -7330.23242, -5.34057617e-05, -0.962711513, -0.270530194, 1, -5.34057617e-05, -7.36117363e-06, -7.36117363e-06, -0.270530194, 0.962711513)
end

-- Logic for handling teleportation and mining event, as well as server hopping
if world then
    print("Detected World:", world)
    task.wait(10) -- Wait 10 seconds before teleporting
    local player = game.Players.LocalPlayer
    if player and player.Character and teleportCFrame then
        player.Character:SetPrimaryPartCFrame(teleportCFrame)
        task.wait(4)
        InstancingEvent:InvokeServer("MiningEvent")

teleportToZone5()
task.wait(7)
teleportToMining()
task.wait(3)

-- Start mining process
isMining = true
coroutine.wrap(startMining)()
coroutine.wrap(serverHop)()
