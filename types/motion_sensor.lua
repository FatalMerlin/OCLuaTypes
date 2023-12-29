--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class motion_sensor
local motion_sensor = {}

---Gets the current sensitivity of the sensor, i.e. at which speed threshold of distance / second it triggers.
--- @return number
function motion_sensor.getSensitivity() end

---Sets the sensor's sensitivity to the specified value, returns the old value.
--- @param value number
--- @return number
function motion_sensor.setSensitivity(value) end

return motion_sensor
