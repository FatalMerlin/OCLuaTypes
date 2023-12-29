--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class world_sensor
local world_sensor = {}

---Gets whether the world the device is currently in has the specified gas.
--- @param gas string
--- @return boolean
function world_sensor.isGasPresent(gas) end

---Gets the gravity of the world that the device is currently in.
--- @return number
function world_sensor.getGravity() end

---Gets whether the world that the device is in has a breathable atmosphere.
--- @return boolean
function world_sensor.hasBreathableAtmosphere() end

---Gets the wind level of the world that the device is currently in.
--- @return number
function world_sensor.getWindLevel() end

return world_sensor
