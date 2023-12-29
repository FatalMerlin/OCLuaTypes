---@meta

---@class microcontroller
local microcontroller = {}

---Set whether network messages are sent via the specified side.
--- @param side number
--- @param open boolean
--- @return boolean
function microcontroller.setSideOpen(side, open) end

---Starts the microcontroller. Returns true if the state changed.
--- @return boolean
function microcontroller.start() end

---Returns whether the microcontroller is running.
--- @return boolean
function microcontroller.isRunning() end

---isSideOpen(side: number): boolean Get whether network messages are sent via the specified side.
--- @param side number
--- @return boolean
function microcontroller.isSideOpen(side) end

---lastError(): string Returns the reason the microcontroller crashed, if applicable. Returns nil if no crash has occurred.
--- @return string
function microcontroller.lastError() end

---stop(): boolean Stops the microcontroller. Returns true if the state changed.
--- @return boolean
function microcontroller.stop() end

return microcontroller
