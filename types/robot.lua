--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

local sides = require('lib.sides')

---@class robot
local robot = {}

---Returns the robot's name.
---The name of a Robot is set initially during it's creation and cannot be changed programmatically. However you can change it using an anvil if you want.
---@return string
function robot.name() end

---Detects what is directly in front of the robot and returns if the robot could move through it as well as a generic description.
---
---
---@return boolean, string # true if the robot if whatever is in front of the robot would prevent him from moving forward (a block or an entity) (Note: Drones return true even if the block is passable), false otherwise. The second parameter describes what is in front in general and is one of either entity, solid, replaceable, liquid, passable or air.
function robot.detect() end

---@see robot.detect
---@return boolean, string
function robot.detectUp() end

---@see robot.detect
---@return boolean, string
function robot.detectDown() end

---Selects the given inventory slot (if specified) and returns the current inventory slot.
---@param slot number the slot to select. If this parameter is omitted, no slot is selected.
---@return number # the currently selected slot. Either the one specified (if successfully selected) or the one that was previously selected.
function robot.select(slot) end

--- @return number # the amount of select-able internal robot inventory slots. To get the number of inventory upgrade use: x = robot.inventorySize() / 16.
function robot.inventorySize() end

---Returns the amount of items currently in the specified or selected slot.
---@param slot number - specifies the slot to count the items in. If omitted the currently selected slot is counted instead.
---@return number # the amount of items in the slot specified or the currently selected slot if no slot was given.
function robot.count(slot) end

---Returns the amount of items that can still be added to the specified slot until it is filled up.
---This function helps to determine how many items of a type can be added to a specific slot. While for example cobblestone can pile up to 64 items per slot, empty buckets can only stack up to 16 and other blocks like doors can only take 1 item per slot.
---@param slot number specifies the slot to count the items in. If omitted the currently selected slot is counted instead.
---@return number # the amount of items that can still be added to the the slot specified or the currently selected slot until it is considered full.
function robot.space(slot) end

--- Moves all or up to count items from the currently selected slot to the specified slot.
--- @param slot number specifies the slot move the items from the currently selected slot to.
--- @param count? number if specified only up to this many items are moved, otherwise the entire stack is moved.
--- @return boolean # Returns true if exchanging the content between those slots was successful, false otherwise.
--- If there are items in the target slot then this function attempts to swap the items in those slots. This only succeeds if you move all items away from the current slot or if the current slot was empty anyways.
--- Note that this will always return true if the specified slot is the same as the currently selected slot, or if both slots are empty, even though no items are effectively moved.
function robot.transferTo(slot, count) end

--- Compares the item of the currently selected slot to the item of the slot specified and returns whether they are equal or not.
--- @param slot number specifies the slot to compare the current slot to.
--- @return boolean # Returns true if the item type in the specified slot and the currently selected slot are equal, false otherwise.
--- Two items are considered the 'same' if their item type and metadata are the same. Stack size or any additional mod-specific item informations (like for example the content of two floppy disks) are not checked.
function robot.compareTo(slot) end

--- Compares the block in front of the robot with the item in the currently selected slot and returns whether they are the same or not.
--- Blocks are considered the 'same' if their type and metadata are the same. Stack size or any additional informations (like for example the inventory of a container) are not checked.
--- Note that empty space in front of the robot is considered an 'air block' by the game, which cannot be put into an inventory slot and therefore compared by normal means. An empty slot and an air block are not the same. You can use robot.detect() beforehand to determine if there is actually a block in front of the robot.
--- Also keep in mind that blocks that drop items need to be compared to the actual same block that is in the world. For example stone blocks drop as cobblestone and diamond ores drop diamond items, which are not the same for this function. Use silk-touch items to retrieve the actual block in the world for comparison.
--- @return boolean # Returns true if the block in front of the robot is the same as the item in the currently selected slot, false otherwise.
function robot.compare() end

--- As robot.compare just for the block directly above the robot.
--- @return boolean
--- @see robot.compare
function robot.compareUp() end

--- As robot.compare just for the block directly below the robot.
--- @return boolean
--- @see robot.compare
function robot.compareDown() end

--- Tries to drop items from the currently selected inventory slot in front of the robot. Note that if you are trying to drop items into an inventory below you, this is the wrong method. Use dropDown for that case. This method, drop, will drop the items to the front.
--- @param count? number specifies how many items to drop. If omitted or if count exceeds the amount of items in the currently selected slot, then all items in the currently selected slot are dropped.
--- @return boolean # Returns true if at least one item was dropped, false otherwise.
--- If the block or entity (like chests or mine-carts with a chest) immediately in front of the robot has an accessible item inventory, the robot will try to put those items into this inventory instead of throwing them into the world. If the block in front has an inventory but the item could not be moved into it for any reason, then this function returns false and does not move any items. Where the item will be put on depends on the inventory and the side the robot is facing. Furnaces for example receive items to smelt from the top side. Also note that robots are considered “blocks with an inventory” as well and therefore items can be moved into robot slots as with any other inventory as well.
--- This function cannot interact with non-item inventories (like for example fluid tanks) and will not consider them an inventory and therefore items will be thrown into the world instead. You need to use the robot.use function to interact with those types of blocks.
--- Note that this will always return false, if the currently selected slot contains no items at all.
function robot.drop(count) end

--- As robot.drop just for the block directly above the robot.
--- @return boolean
--- @see robot.drop
function robot.dropUp(count) end

--- As robot.drop just for the block directly below the robot.
--- @return boolean
--- @see robot.drop
function robot.dropDown(count) end

--- Tries to pick up items from directly in front of the robot and puts it into the selected slot or (if occupied) first possible slot.
--- @param count number limits the amount of items to pick up by this many. If omitted a maximum of one stack is taken.
--- @return boolean # Returns true if at least one item was picked up, false otherwise.
--- This is basically the inverse of robot.drop and will interact with item inventories in the same way. However this will only take the first item available in that inventory. For more precise inventory management you need to install an inventory controller upgrade into the robot.
--- If there are multiple items in front of the robot, this will pick them up based on the distance to the robot. This will skip items that cannot be picked up for whatever reason and try other items first before returning false.
--- If the currently selected slot contains a different item than the one the robot tries to pick up, the robot will attempt to place the item in the next possible slots after the selected one that are either free or contain identical items with less than the maximum stack size for those items. This will distribute the items to pick up over several slots if necessary. If no slot after the selected one is able to contain the items the robot tries to put up, this function will fail, even if there are slots before the currently selected slot that could hold those items.
function robot.suck(count) end

--- As robot.suck just for the block directly above the robot.
--- @return boolean
--- @see robot.suck
function robot.suckUp(count) end

--- As robot.suck just for the block directly below the robot.
--- @return boolean
--- @see robot.suck
function robot.suckDown(count) end

--- Tries to place the block in the currently selected inventory slot in front of the robot.
--- @param side? sides if specified this determines the surface on which the robot attempts to place the block for example to place torches to a specific side. If omitted the robot will try all possible sides. See the Sides API for a list of possible sides.
--- @param sneaky? boolean if set to true the robot will simulate a sneak-placement (like if the player would be using shift during placement), which is usually not necessary and only included for compatibility to other mods.
--- @return boolean, string? # Returns: true if an item could be placed, false otherwise. If placement failed, the secondary return parameter will describe why the placement failed.
--- A robot can only place blocks to the side of another solid block, they cannot place blocks “into the air” without an Angel upgrade. This can be changed in the config file.
--- Note that trying to place an empty inventory slot will always fail.
function robot.place(side, sneaky) end

--- As robot.place just for the block directly above the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @return boolean, string?
--- @see robot.place
function robot.placeUp(side, sneaky) end

--- As robot.place just for the block directly below the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @return boolean, string?
--- @see robot.place
function robot.placeDown(side, sneaky) end

---Returns the durability of the item currently in the tool slot, followed by its current durability, followed by its maximum durability.
---If no item is equipped or the item has no durability this returns nil and an error message describing why no durability could be returned. The error message is one of no tool equipped or tool cannot be damaged.
---@return number, number, number | nil, string
function robot.durability() end

---Makes the robot use the item currently in the tool slot against the block or space immediately in front of the robot in the same way as if a player would make a left-click.
---@param side? sides if given the robot will try to 'left-click' only on the surface as specified by side, otherwise the robot will try all possible sides. See the Sides API for a list of possible sides.
---@param sneaky? boolean if set to true the robot will simulate a sneak-left-click (like if the player would be using shift during a left-click).
---@return boolean, string? # Returns: true if the robot could interact with the block or entity in front of it, false otherwise. If successful the secondary parameter describes what the robot interacted with and will be one of 'entity', 'block' or 'fire'.
---This can be used to mine blocks or fight entities in the same way as if the player did a left-click. Note that tools and weapons do lose durability in the same way as if a player would use them and need to be replaced eventually. Items mined or dropped of mobs will be put into the inventory if possible, otherwise they will be dropped to the ground.
---Note that even though the action is performed immediately (like a block being destroyed) this function will wait for a while appropriate to the action performed to simulate the time it would take a player to do the same action. This is most noticeable if you try to mine obsidian blocks: they are destroyed and put into the inventory immediately, but the function will wait for a few seconds.
---If this is used to mine blocks, then the tool equipped needs to be sufficient to actually mine the block in front. If for example a wooden pick-axe is used on an obsidian block this will return false. Everything (including an empty slot) can be used to fight mobs, but the damage will be based on the item used. Equally everything can be used to extinguish fire, and items with durability will not lose any if done so.
function robot.swing(side, sneaky) end

--- As robot.swing just for the block directly above the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @return boolean, string?
--- @see robot.swing
function robot.swingUp(side, sneaky) end

--- As robot.swing just for the block directly below the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @return boolean, string?
--- @see robot.swing
function robot.swingDown(side, sneaky) end

---Attempts to use the item currently equipped in the tool slot in the same way as if the player would make a right-click.
---@param side? sides if given the robot will try to 'right-click' only on the surface as specified by side, otherwise the robot will try all possible sides. See the Sides API for a list of possible sides.
---@param sneaky? boolean if set to true the robot will simulate a sneak-right-click (like if the player would be using shift during a right-click). Some items (like buckets) will behave differently if this is set to true.
---@param duration? number how long the item is used. This is useful when using charging items like a bow.
---@return boolean, string? # Returns: true if the robot could interact with the block or entity in front of it, false otherwise. If successful the secondary parameter describes what the robot interacted with and will be one of 'blockactivated', 'itemplaced', 'iteminteracted' or 'itemused'.
---This function has a very broad use as the robot can simulate right-clicks with most items. The only difference to players is that the robot cannot use items that specifically require the user to be an entity as the robot is a block. So drinking potions, eating food or throwing an ender pearl will fail.
---This functions secondary return value can be used to determine what the result of the right-click caused. Which of the item results is returned is not always obvious and requires some testing beforehand. Also note that while robots are not affected by harmful potions they can be destroyed by explosions, so be careful when you place, throw or activate any form of explosives with this function. Possible values for the second return value:
--- - block_activated - a block was activated (like levers, switches or doors).
--- - item_interacted - the equipped tool interacted with the world, for example sheers when used on a sheep.
--- - item_placed - something was placed into the world. This is not only caused by placeable blocks, but as well by items that cause blocks or entities to appear in the world (like flint and stone or mob eggs).
--- - item_used - the equipped was activated, like a splash-potion.
--- - air - the equipped item requires a target but there was none. Note that if your robot has an Angel upgrade, this will never be returned, however some actions might still cause no effect.
function robot.use(side, sneaky, duration) end

--- As robot.use just for the block directly above the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @param duration? number
--- @return boolean, string?
--- @see robot.use
function robot.useUp(side, sneaky, duration) end

--- As robot.use just for the block directly below the robot.
--- @param side? sides
--- @param sneaky? boolean
--- @param duration? number
--- @return boolean, string?
--- @see robot.use
function robot.useDown(side, sneaky, duration) end

--- Tries to move the robot forward.
--- @return true|nil, string? # Returns: true if the robot successfully moved, nil otherwise. If movement fails a secondary result will be returned describing why it failed, which will either be 'impossible move', 'not enough energy' or the description of the obstacle as robot.detect would return.
--- The result 'not enough energy' is rarely returned as being low on energy usually causes the robot to shut down beforehand.
--- The result 'impossible move' is kind of a fall-back result and will be returned for example if the robot tries to move into an area of the world that is currently not loaded.
function robot.forward() end

--- As robot.forward except that the robot tries to move backward.
--- @return true|nil, string? # Returns: true if the robot successfully moved, nil otherwise.
--- @see robot.forward
function robot.back() end

--- As robot.forward except that the robot tries to move upwards.
--- @return true|nil, string? # Returns: true if the robot successfully moved, nil otherwise.
--- @see robot.forward
function robot.up() end

--- As robot.forward except that the robot tries to move downwards.
--- @return true|nil, string? # Returns: true if the robot successfully moved, nil otherwise.
--- @see robot.forward
function robot.down() end

--- Turns the robot 90° to the left.
--- Note that this can only fail if the robot has not enough energy to perform the turn but has not yet shut down because of it.
function robot.turnLeft() end

--- Turns the robot 90° to the right.
--- Note that this can only fail if the robot has not enough energy to perform the turn but has not yet shut down because of it.
function robot.turnRight() end

--- Turns the robot around.
--- This is the same as calling robot.turnRight twice.
function robot.turnAround() end

--- The number of tanks installed in the robot.
---@return number # The number of tanks installed in the robot.
function robot.tankCount() end

--- Select the specified tank. This determines which tank most operations operate on.
---@param tank number # The number of the tank to select.
function robot.selectTank(tank) end

---The current fluid level in the specified tank, or, if none is specified, the selected tank.
---@param tank? number # The number of the tank to check.
---@return number # The current fluid level in the specified tank, or, if none is specified, the selected tank.
function robot.tankLevel(tank) end

---The the remaining fluid capacity in the specified tank, or, if none is specified, the selected tank.
---@param tank? number # The number of the tank to check.
---@return number # The the remaining fluid capacity in the specified tank, or, if none is specified, the selected tank.
function robot.tankSpace(tank) end

---Tests whether the fluid in the selected tank is the same as in the specified tank.
---@param tank number # The number of the tank to check.
---@return boolean # Whether the fluid in the selected tank is the same as in the specified tank.
function robot.compareFluidTo(tank, count) end

---Transfers the specified amount of fluid from the selected tank into the specified tank. If no volume is specified, tries to transfer 1000 mB.
---@param tank number # The number of the tank to transfer fluid into.
---@param count? number # The amount of fluid to transfer in millibuckets.
---@return boolean # Whether the transfer was successful.
function robot.transferFluidTo(tank, count) end

--- Tests whether the fluid in the selected tank is the same as in the world or the tank in front of the robot.
---@return boolean # Whether the fluid in the selected tank is the same as in the world or the tank in front of the robot.
function robot.compareFluid() end

--- Like robot.compareFluid but for the tank above the robot.
---@return boolean # Whether the fluid in the tank above the robot is the same as in the world or the tank in front of the robot.
---@see robot.compareFluid
function robot.compareFluidUp() end

--- Like robot.compareFluid but for the tank below the robot.
---@return boolean # Whether the fluid in the tank below the robot is the same as in the world or the tank in front of the robot.
---@see robot.compareFluid
function robot.compareFluidDown() end

--- Extracts the specified amount of fluid from the world or the tank in front of the robot. When no amount is specified, will try to drain 1000 mB. When the drained fluid is in the world and it cannot be fully stored in the selected tank, the operation fails, i.e. no fluid is lost.
---@param count? number # The amount of fluid to drain in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.drain(count) end

--- Like robot.drain but for the tank above the robot.
---@param count? number # The amount of fluid to drain in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.drainUp(count) end

--- Like robot.drain but for the tank below the robot.
---@param count? number # The amount of fluid to drain in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.drainDown(count) end

---Injects the specified amount of fluid from the selected tank into the the world or the tank in front of the robot. When no amount is specified, will try to eject 1000 mB. When there is not enough fluid to fill a block, or the target tank does not have enough room, the operation fails, i.e. no fluid is lost.
---@param count? number # The amount of fluid to eject in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.fill(count) end

--- Like robot.fill but for the tank above the robot.
---@param count? number # The amount of fluid to eject in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.fillUp(count) end

--- Like robot.fill but for the tank below the robot.
---@param count? number # The amount of fluid to eject in millibuckets.
---@return boolean # Whether the operation was successful.
function robot.fillDown(count) end

return robot
