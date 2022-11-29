# qb-garages



**ATENTION: THIS SCRIPT USES THE LATEST VERSION OF THE [RADIALMENU](https://github.com/qbcore-framework/qb-radialmenu) AND [QB-CORE](https://github.com/qbcore-framework/qb-core)**

This is a qb-garages script that uses the radialmenu to retrieve and park vehicles.
Almost everything is fully customizable to the last bit!

**For screenshots scroll down**

## Dependencies
 - [qb-radialmenu](https://github.com/qbcore-framework/qb-radialmenu)
 - [qb-core](https://github.com/qbcore-framework/qb-core)

## Installation

Drag 'n Drop replace for qb-garages.

- Delete qb-garages.
- Drag the downloaded qb-garages folder into the [qb] folder.

## Features

* Public Garages
* House Garages
* Gang Garages
* Job Garages
* Depot Garages
* Blips and names
* Custom DrawText
* Water Garages
* Aircraft Garages

## Screenshots

![image](https://user-images.githubusercontent.com/25738474/161191185-5bfa6805-1e89-44ef-902a-11f60ed68ea8.png)

![image](https://user-images.githubusercontent.com/25738474/161191275-2ca930fe-5583-4caa-a159-0c239b404abe.png)

![image](https://user-images.githubusercontent.com/25738474/161191330-9270f95d-182f-4709-988a-ef13f0723ba5.png)

![image](https://user-images.githubusercontent.com/25738474/161191354-057ca8d9-ee6d-4f92-8dd7-657d3bf26274.png)

### parking vehicle using target
```
local garageName = 'pdgarage'
    exports['qb-target']:AddBoxZone(garageName, vector3(469.51, -992.35, 26.27), 0.2, 0.2, {
        name = garageName,
        debugPoly = true,
        minZ = 26.80,
        maxZ = 27.10,
    }, {
        options = {
            {
                type = "client",
                action = function ()
                    TriggerEvent('qb-garages:client:ParkLastVehicle', garageName)
                end,
                icon = 'parking',
                label = 'Park Vehicle',
            },
        },
        distance = 3
    })
```
### !!! OUTDATED !!! improved phone tracking (requires SQL patch to be applied, NOT RECOMMENDED UNLESS YOU KNOW WHAT YOU ARE DOING)

Replace:

```
RegisterNUICallback('track-vehicle', function(data, cb)
    local veh = data.veh
    if findVehFromPlateAndLocate(veh.plate) then
        QBCore.Functions.Notify("Your vehicle has been marked", "success")
    else
        QBCore.Functions.Notify("This vehicle cannot be located", "error")
    end
    cb("ok")
end)
```

With:

```
RegisterNUICallback('track-vehicle', function(data, cb)
    local veh = data.veh
    if veh.state == 'In' then
        if veh.parkingspot then
            SetNewWaypoint(veh.parkingspot.x, veh.parkingspot.y)
            QBCore.Functions.Notify("Your vehicle has been marked", "success")
        end
    elseif veh.state == 'Out' and findVehFromPlateAndLocate(veh.plate) then
        QBCore.Functions.Notify("Your vehicle has been marked", "success")
    else
        QBCore.Functions.Notify("This vehicle cannot be located", "error")
    end
    cb("ok")
end)
```

## Credits

* [ARSSANTO](https://github.com/ARSSANTO) - For making code style suggestions and helping me improve the performance.
* [JustLazzy](https://github.com/JustLazzy) - I used part of his qb-garages script.
* [bamablood94](https://github.com/bamablood94) - I used part of his qb-garages script.
* [QBCore Devs](https://github.com/qbcore-framework/) - For making an awesome framework and enabling me to do this.
* QBCore Community - Thank you so much for everyone who's been testing this!

## Support

Join my Discord server: https://discord.gg/pqcug3XSQx

# License

    QBCore Framework
    Copyright (C) 2021 Joshua Eger

    This program is free software: you can redistribute it and/or modify
    it under the terms of the GNU General Public License as published by
    the Free Software Foundation, either version 3 of the License, or
    (at your option) any later version.

    This program is distributed in the hope that it will be useful,
    but WITHOUT ANY WARRANTY; without even the implied warranty of
    MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
    GNU General Public License for more details.

    You should have received a copy of the GNU General Public License
    along with this program.  If not, see <https://www.gnu.org/licenses/>

