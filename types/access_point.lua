--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class access_point
local access_point = {}

---Get the signal strength (range) used when relaying messages.
--- @return number
function access_point.getStrength() end

---Set the signal strength (range) used when relaying messages.
--- @param strength number
--- @return number
function access_point.setStrength(strength) end

---Check whether Access Point is acting as a repeater (re-send received wireless messages).
--- @return boolean
function access_point.isRepeater() end

---Sets whether Access Point should act as a repeater (re-send received wireless messages).
--- @param enabled boolean
--- @return boolean
function access_point.setRepeater(enabled) end

return access_point
