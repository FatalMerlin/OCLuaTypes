--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class printer3d
local printer3d = {}

---Commit and begin printing the current configuration.
--- @param count number
--- @return boolean
function printer3d.commit(count) end

---Set the label for the volume being printed.
--- @param value string
function printer3d.setLabel(value) end

---Get the current label for the volume being printed.
--- @return string
function printer3d.getLabel() end

---Sets the tooltip for the volume being printed.
--- @param value string
function printer3d.setTooltip(value) end

---Gets the current tooltip of the volume being printed.
--- @return string
function printer3d.getTooltip() end

---Set whether the printed block should automatically return to its off state.
--- @param value boolean
function printer3d.setButtonMode(value) end

---Gets whether the printed block should automatically return to its off state.
--- @return boolean
function printer3d.isButtonMode() end

---Sets whether the printed block should emit a redstone signal while in its active state.
--- @param value boolean
function printer3d.setRedstoneEmitter(value) end

---Gets whether the printed block should emit a redstone signal while in its active state.
--- @return boolean
function printer3d.isRedstoneEmitter() end

---Adds the shape to the printer's current configuration, optionally specifying whether it is for the off or on state.
--- @param minX number
--- @param minY number
--- @param minZ number
--- @param maxX number
--- @param maxY number
--- @param maxZ number
--- @param texture string
--- @param state? boolean
--- @param tint? number
function printer3d.addShape(minX, minY, minZ, maxX, maxY, maxZ, texture, state, tint) end

---Gets the number of shapes in the current configuration.
--- @return number
function printer3d.getShapeCount() end

---Gets the maximum allowed number of shapes.
--- @return number
function printer3d.getMaxShapeCount() end

---The current state of the printer, 'busy' or 'idle' (string), followed by the progress (number) or model validity (boolean), respectively.
--- @return string, number | boolean
function printer3d.status() end

---Resets the current job for the printer and stops printing (current job being printed will finish).
function printer3d.reset() end

return printer3d
