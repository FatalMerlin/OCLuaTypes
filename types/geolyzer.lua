---@meta

---@class geolyzer
local geolyzer = {}

---Analyzes the density of an area at the specified relative coordinates x, z and y. This will return a list of hardness values for the blocks in the specified range. The coordinates are relative to the location of the geolyzer. Size of the analyzed area can be optionally given with parameters w, d and h which stand for width, depth and height, otherwise the area is assumed to be a single block at the specified offset.
---Hardness values for blocks further away from the geolyzer are more noisy than those for blocks nearby. The exact formula for calculating how much a single value can deviate from the real hardness value of a specific block is: euclidean distance to block * 1/33 * geolyzerNoise where geolyzerNoise is a mod config option with a default value of 2.
---Table with multiple results is linear, but results represent an area in a 3D world. Area starts at a block defined by offset from the geolyzer block (x, z and y), and size (w, d and h) defines how many blocks it extends towards respectively: positive x, positive z and positive y coordinates. To figure out what elements in results table correspond to which coordinates, it should be interpreted as follows: first, values go towards positive x, then towards positive z, then towards positive y. In other words, if the result was a 3D nested table which got converted to a linear table, innermost table would contain values going in the positive x direction, middle table going in the positive z direction, and the outermost going in the positive y direction. See the code snippet at the bottom for an example.
---
---Note that the offset is always absolute in terms of facing direction. In other words if the geolyzer is installed in a robot, offset won't be affected by the robot's facing.
---
---Note that the amount of values returned is always 64, even if the scan volume is only part of that. If 10 blocks are scanned, the first 10 values in the result represent those blocks scanned. The remaining values in the result should be ignored.
--- @param x number
--- @param z number
--- @param y? number
--- @param w number
--- @param d number
--- @param h number
--- @param ignoreReplaceable? boolean|options
--- @return table
function geolyzer.scan(x, z, y, w, d, h, ignoreReplaceable) end

---Get some information on a directly adjacent block. By default the returned table returns the string ID of the block (e.g. minecraft:dirt, metadata, hardness and some more information). Note that a single call to this consumes the same amount of energy a call to scan does!
---This method can be disabled with the misc.allowItemStackInspection setting in the config.
--- @param side number
--- @param options? table
--- @return table
function geolyzer.analyze(side, options) end

---Stores an item stack representation of the block on the specified side of the geolyzer to the specified slot of a database component with the specified address. Do not expect this to work (well) for every block in existence, in particular not for mod's blocks that are differentiated by NBT data (such as robots).
--- @param side number
--- @param dbAddress string
--- @param dbSlot number
--- @return boolean
function geolyzer.store(side, dbAddress, dbSlot) end

---Same as robot.detect (from the robot component). Detects the block on the given side, relative to the robot, and returns whether or not the robot can move into the block, as well as a general description of the block.
---Returns: true if the robot if whatever is in front of the robot would prevent him from moving forward (a block or an entity) (Note: Drones return true even if the block is passable), false otherwise. The second parameter describes what is in front in general and is one of either entity, solid, replaceable, liquid, passable or air.
--- @param side number
--- @return boolean, string
function geolyzer.detect(side) end

---canSeeSky():boolean Returns whether there is a clear line of sight to the sky directly above. Transparent blocks, e.g. glass don't affect the line of sight.
--- @return boolean
function geolyzer.canSeeSky() end

---isSunVisible():boolean Returns whether the sun is currently visible directly above. The result is affected by possible blocks blocking the line of sight directly above (which can be checked with canSeeSky()) and whether it's night or day.
--- @return boolean
function geolyzer.isSunVisible() end

return geolyzer
