--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class navigation
local navigation = {}

---Gets the current relative position of the robot. This is the position relative to the center of the map item that was used to craft the upgrade. Note that the upgrade can be re-crafted with another map to change it's point of reference. Returns nil and the string out of range if the robot is too far away from the point of reference (i.e. when it is out of bounds of the map that was used to craft the upgrade).
--- @return number, number, number | nil, string
function navigation.getPosition() end

---Gets the current facing of the robot, as one of the sides constants.
--- @return number
function navigation.getFacing() end

---Gets the effective range of the upgrade. If the absolute value of the relative X or Z coordinate becomes larger than this, getPosition() will fail.
--- @return number
function navigation.getRange() end

---findWaypoints(range: number): table Note: Requires version 1.5.9 of OpenComputers.
---
---Finds all waypoint blocks within the specified range.
---This returns a table that contains other tables. The top table has only numbered indices corresponding to each detected beacon. In each of this entries is another table, each row various aspects of the specified beacon: “position”, “redstone”, “label”.
--- @param range number
--- @return table
function navigation.findWaypoints(range) end

return navigation
