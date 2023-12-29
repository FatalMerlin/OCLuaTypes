---@meta

---@class crafting
local crafting = {}

---Crafts up to count numbers or a full stack.
---@param count number How many items to craft. I f omitted then the robot will craft as many items as possible. In any case the robot will never craft more than one full stack of crafting result items at once.
---@return boolean # Returns true if crafting was successful, false otherwise.
---Note that if you specify an amount of items to be crafted that is lower than the minimum resulting stack size (i.E. order to craft 1 stick, but minimum result stack size is 4), then nothing will be crafted, however this will still return true.
---If successful the crafting result will be placed in the currently selected slot, or (if occupied by something else) will be placed into the next slot containing similar items or in the next free slot. This can be one of the slots of the crafting area, which would make it impossible to craft the same item again until that area is cleared.
function crafting.craft(count) end

return crafting
