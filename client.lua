local vehiclemaxspeed = 0
local damage = 0

AddEventHandler('gameEventTriggered', function (event, args)
    if event == "CEventNetworkEntityDamage" then
        vehicle = args[1];
        victimDied = args[4];
        weaponHash = args[5];
        if vehicle ~= nil then
            if victimDied == 0 then
                if GetEntityType(vehicle) == 2 then
                    vehiclemaxspeed = GetVehicleHandlingFloat(vehicle, "CHandlingData", "fInitialDriveMaxFlatVel")
                    damage = GetVehicleEngineHealth(vehicle)
                    if damage <= 300 then
                        SetVehicleEngineHealth(vehicle, 300)
                        SetVehicleUndriveable(vehicle, true)
                        SetVehicleMaxSpeed(vehicle, 0)
                        SetVehicleEngineOn(vehicle, false, true, true)
                    else
                        if weaponHash == 133987706 then
                            SetVehicleEngineHealth(vehicle, damage - math.abs((damage - GetVehicleBodyHealth(vehicle)) * 10))
                        else
                            SetVehicleEngineHealth(vehicle, damage - 120)
                        end
                        if damage == 1000 then
                            SetVehicleMaxSpeed(vehicle, vehiclemaxspeed)
                        elseif damage > 950 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 14)
                        elseif damage > 900 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 13)
                        elseif damage > 850 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 12)
                        elseif damage > 800 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 11)
                        elseif damage > 750 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 10)
                        elseif damage > 700 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 9)
                        elseif damage > 650 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 8)
                        elseif damage > 600 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 7)
                        elseif damage > 550 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 6)
                        elseif damage > 500 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 5)
                        elseif damage > 450 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 4)
                        elseif damage > 400 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 3)
                        elseif damage > 350 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 2)
                        elseif damage > 300 then
                            SetVehicleMaxSpeed(vehicle, (vehiclemaxspeed / 15) * 1)
                        end
                    end
                    SetVehicleBodyHealth(vehicle, GetVehicleEngineHealth(vehicle))
                end
            end
        end
    end
end)