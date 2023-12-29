--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class chunkloader
local chunkloader = {}

---Returns whether the chunkloader is currently active.
--- @return boolean
function chunkloader.isActive() end

---Enables or disables the chunkloader. Returns the new state, which may be false if no chunk loading ticket could be acquired.
--- @param enabled boolean
--- @return boolean
function chunkloader.setActive(enabled) end

return chunkloader
