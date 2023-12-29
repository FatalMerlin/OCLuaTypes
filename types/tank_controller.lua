---@meta

---@class tank_controller
local tank_controller = {}

---Get the capacity of the tank on the specified side of the robot. Back refers to the robot's own selected tank.
--- @param side number
--- @return number | nil, string?
function tank_controller.getTankCapacity(side) end

---Gets amount of fluid in tank on specified side.
--- @param side number
--- @return number | nil, string?
function tank_controller.getTankLevel(side) end

---Get a description of the fluid in the the tank on the specified side of the robot. Note: sides.back deprecated, use getFluidInInternalTank()
--- @param side number
--- @return table
function tank_controller.getFluidInTank(side) end

---getFluidInInternalTank(slot):table Get a description of fluid in the specified or selected slot of robot inventory.
--- @return table
function tank_controller.getFluidInInternalTank() end

---Transfers fluid from a tank in the selected inventory slot to the selected tank. If the amount of fluid that would be generated from the item is too large to fit into the tank (for example buckets will usually generate 1000) nothing will happen, that is no fluid is lost.
--- @param amount number
--- @return boolean
function tank_controller.drain(amount) end

---Transfers fluid from the selected tank to a tank in the selected inventory slot. If the specified amount is too low (for example for buckets the minimum amount will usually be 1000) nothing will happen, that is no fluid is lost.
--- @param amount number
--- @return boolean
function tank_controller.fill(amount) end

---Gets capacity of tank in specified or selected slot of the robot inventory.
--- @param slot number
--- @return number
function tank_controller.getTankCapacityInSlot(slot) end

---Gets amount of fluid tank item in specified or selected slot of the robot inventory.
--- @param slot number
--- @return number
function tank_controller.getTankLevelInSlot(slot) end

---Gets description of fluid in tank item in the specified or selected slot of the robot inventory.
--- @param slot number
--- @return table
function tank_controller.getFluidInTankInSlot(slot) end

return tank_controller
