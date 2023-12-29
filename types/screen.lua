--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class screen
local screen = {}

---Returns whether the screen is currently on.
--- @return boolean
function screen.isOn() end

---Turns the screen on. Returns true if it was off.
--- @return boolean
function screen.turnOn() end

---Turns off the screen. Returns true if it was on.
--- @return boolean
function screen.turnOff() end

---The aspect ratio of the screen. For multi-block screens this is the number of blocks, horizontal and vertical.
--- @return number, number
function screen.getAspectRatio() end

---The list of keyboards attached to the screen.
--- @return table
function screen.getKeyboards() end

---setPrecise(enabled:boolean):boolean Set whether to use high-precision mode (sub-pixel mouse event position).
---Requires Screen (Tier 3).
--- @param enabled boolean
--- @return boolean
function screen.setPrecise(enabled) end

---Check whether high-precision mode is enabled (sub-pixel mouse event position).
---Requires Screen (Tier 3).
--- @return boolean
function screen.isPrecise() end

---Sets Inverted Touch mode (Sneak-activate opens GUI if set to true).
--- @param enabled boolean
--- @return boolean
function screen.setTouchModeInverted(enabled) end

---Check to see if Inverted Touch mode is enabled (Sneak-activate opens GUI is set to true).
--- @return boolean
function screen.isTouchModeInverted() end

return screen
