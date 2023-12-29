---@meta

---@class drone
local drone = {}

---Get the status text currently being displayed in the GUI.
--- @return string
function drone.getStatusText() end

---Set the status text to display in the GUI, returns new value.
--- @param value string
--- @return string
function drone.setStatusText(value) end

---Change the target position by the specified offset.
--- @param dx number
--- @param dy number
--- @param dz number
function drone.move(dx, dy, dz) end

---Get the current distance to the target position.
--- @return number
function drone.getOffset() end

---Get the current velocity in m/s.
--- @return number
function drone.getVelocity() end

---Get the maximum velocity, in m/s.
--- @return number
function drone.getMaxVelocity() end

---Get the currently set acceleration.
--- @return number
function drone.getAcceleration() end

---Try to set the acceleration to the specified value and return the new acceleration.
--- @param value number
--- @return number
function drone.setAcceleration(value) end

---Get the name of the robot.
--- @return string
function drone.name() end

---Lets the robot use the currently equipped item in the tool slot against the block or space directly in front of the robot. Returns true if successful (may take time depending on block being interacted with - e.g.. Obsidian takes time to mine). Returns false if the operation fails with a description of why it failed.
--- @param side number
--- @return boolean, string?
function drone.swing(side) end

---Attempts to use the item currently equipped in the tool slot in the same way as if the player would make a right-click.
---side - if given the robot will try to 'right-click' only on the surface as specified by side, otherwise the robot will try all possible sides. See the Sides API for a list of possible sides.
---sneaky - if set to true the robot will simulate a sneak-right-click (like if the player would be using shift during a right-click). Some items (like buckets) will behave differently if this is set to true.
---duration - how long the item is used. This is useful when using charging items like a bow.
---Returns: true if the robot could interact with the block or entity in front of it, false otherwise. If successful the secondary parameter describes what the robot interacted with and will be one of 'blockactivated', 'itemplaced', 'iteminteracted' or 'itemused'.
---This function drone.has a very broad use as the robot can simulate right-clicks with most items. The only difference to players is that the robot cannot use items that specifically require the user to be an entity as the robot is a block. So drinking potions, eating food or throwing an ender pearl will fail.
---This functions secondary return value can be used to determine what the result of the right-click caused. Which of the item results is returned is not always obvious and requires some testing beforehand. Also note that while robots are not affected by harmful potions they can be destroyed by explosions, so be careful when you place, throw or activate any form of explosives with this function. Possible values for the second return value:
--- @param side number
--- @param sneaky? boolean
--- @param duration? number
--- @return boolean, string?
function drone.use(side, sneaky, duration) end

---Tries to place the block in the currently selected inventory slot on the specified side of the robot (if the side is supported). If sneaky is set to true, the robot will simulate a sneak-placement (shift-click). Returns true if successfully placed. Returns false if the operation fails. If an unsupported value is provided as a parameter, the operation will fail with a description of why it failed.
--- @param side number
--- @param sneaky? boolean
--- @return boolean, string?
function drone.place(side, sneaky) end

---Get the current color of the activity(robot) or flap(drone) light as an integer encoded RGB value (0xRRGGBB).
--- @return number
function drone.getLightColor() end

---Set the color of the activity(robot) or flap(drone) light to the specified integer encoded RGB value (0xRRGGBB).
--- @param value number
--- @return number
function drone.setLightColor(value) end

---Returns the size of the device's internal inventory.
--- @return number
function drone.inventorySize() end

---Get the currently selected slot; set the selected slot if specified.
--- @param slot number
--- @return number
function drone.select(slot) end

---Get the number of items in the specified slot, otherwise in the selected slot.
--- @param slot number
--- @return number
function drone.count(slot) end

---Get the remaining space in the specified slot, otherwise in the selected slot.
--- @param slot number
--- @return number
function drone.space(slot) end

---Compare the contents of the selected slot (in the robot inventory) to the contents of the specified slot (also in the robot inventory).
--- @param otherSlot number
--- @return boolean
function drone.compareTo(otherSlot) end

---Move the specified amount of items from the selected slot into the specified slot. If no amount is specified, the entire stack is moved to the target slot.
--- @param toSlot number
--- @param amount? number
--- @return boolean
function drone.transferTo(toSlot, amount) end

---Returns the number of tanks installed in the robot.
--- @return number
function drone.tankCount() end

---Selects the specified tank (if robot contains more than one Tank upgrade). Any tank operations will use this tank.
--- @param tank number
function drone.selectTank(tank) end

---Returns the fluid level in the specified tank. If no tank specified, returns the fluid level in the selected tank (using selectTank()).
--- @param tank number
--- @return number
function drone.tankLevel(tank) end

---Returns the remaining fluid capacity (empty space) in the specified tank. If not tank specified, returns the remaining capacity in the selected tank.
--- @param tank number
--- @return number
function drone.tankSpace(tank) end

---Tests whether the fluid in the selected tank (in the robot inventory) is the same as in the specified tank (requires Tank upgrade).
--- @param tank number
--- @return boolean
function drone.compareFluidTo(tank) end

---Transfer the specified amount of fluid in the selected tank into the specified tank. If no volume is specified, the robot will attempt to transfer 1000mB.
--- @param tank number
--- @param count? number
--- @return boolean
function drone.transferFluidTo(tank, count) end

---Detects the block on the given side, relative to the robot, and returns whether or not the robot can move into the block, as well as a general description of the block. Returns true if the block will prevent the robot from moving forward, false otherwise. Drones return true even if the block is passable.
---
---side - See the Sides API for a list of possible sides.
--- @param side number
--- @return boolean
function drone.detect(side) end

---compareFluid(side:number):boolean Compares fluid in the selected tank (requires a Tank upgrade) to fluid in the world or in an external tank on the specified side of the robot.
--- @param side number
--- @return boolean
function drone.compareFluid(side) end

---Extracts the specified amount of fluid from the world or a tank on the specified side of the robot. If no amount is specified, the robot will try to drain 1000mB. If the tank is unable to store the specified amount of fluid, the operation will fail (no fluid is lost in the process).
--- @param side number
--- @param count? number
--- @return boolean
function drone.drain(side, count) end

---Fills the specified amount of fluid from the selected tank (requires a Tank upgrade) into the world or a tank in front of the robot. If no amount is specified, the robot will try to fill the target tank with 1000mB of fluid. If there is not enough fluid to fill a block, or not enough space in the target tank, the operation will fail with no fluids lost.
--- @param side number
--- @param count? number
--- @return boolean
function drone.fill(side, count) end

---compare(side:number[, fuzzy:boolean=false]):boolean Compares the block on the specified side of the robot with the item in the currently selected slot and returns whether they are the same or not. Blocks are considered identical if the type and metadata match; additional ItemStack information is not checked. Empty blocks are considered as air blocks, which cannot be compared to an empty inventory slot; the detect() function drone.can be used to determine if there is a block in front of the robot. For blocks that drop a different item, the compare() method won't work (eg: Diamond block dropping diamond items); for these cases, use silk-touch to obtain a block for comparison.
--- @param side number
--- @param fuzzy? boolean
--- @return boolean
function drone.compare(side, fuzzy) end

---Drops the specified number of items from the currently selected slot. Returns true if at least one item is dropped, false otherwise. If the block in front of the robot is an inventory, the robot will try to place the item into the inventory. If the inventory doesn't accept the item, the item is not dropped into the world (the operation will fail and return false). Robots themselves are considered blocks with an inventory, and items can be moved into them using the drop() function. The drop() function drone.will not work on non-item inventories, such as fluid tanks (the use() function drone.works for these cases).
--- @param side number
--- @param count? number
--- @return boolean
function drone.drop(side, count) end

---Tries to pick up the specified number of items and place it in the selected slot. If the selected slot is occupied, items will be placed in the first available slot. Returns the number of items sucked else false.
--- @param side number
--- @param count? number
--- @return boolean
function drone.suck(side, count) end

return drone
