---@meta

---@class net_splitter
local net_splitter = {}

---Open the side, returns true if it changed to open.
--- @param side number
--- @return number
function net_splitter.open(side) end

---Close the side, returns true if it changed to close.
--- @return number
function net_splitter.close() end

---Returns current open/close state of all sides in an array, indexed by direction.
--- @return table
function net_splitter.getSides() end

---set open state (true/false) of all sides in an array; index by direction. Returns previous states.
--- @param settings table
--- @return table
function net_splitter.setSides(settings) end

return net_splitter
