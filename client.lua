RegisterCommand("cleararea", function()
    local playerPed = GetPlayerPed(-1) -- Get the player's ped (character) ID
    local radius = 50.0 -- Set the radius in which AI vehicles will be deleted

    local vehicles = GetGamePool("CVehicle") -- Get all vehicles in the game
    local playerCoords = GetEntityCoords(playerPed)

    for i, vehicle in ipairs(vehicles) do
        local vehicleCoords = GetEntityCoords(vehicle)
        local distance = Vdist(playerCoords.x, playerCoords.y, playerCoords.z, vehicleCoords.x, vehicleCoords.y, vehicleCoords.z)

        if distance <= radius and IsEntityAVehicle(vehicle) and not IsEntityDead(vehicle) then
            DeleteEntity(vehicle) -- Delete the vehicle
        end
    end

    TriggerEvent("chatMessage", "SYSTEM", {255, 0, 0}, "Cleared AI vehicles around you!")
end, false)
