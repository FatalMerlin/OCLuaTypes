---@meta

---@class database
local database = {}

---Get the representation of the item stack stored in the specified slot.
--- @param slot number
--- @return table
function database.get(slot) end

---Computes a hash value for the item stack in the specified slot. This value is guaranteed to be the same for identical item stacks, allowing comparison of item stacks across a network (by comparing the hash values).
--- @param slot number
--- @return string
function database.computeHash(slot) end

---Get the index of an item stack with the specified hash. Returns a negative value if no such stack was found.
--- @param hash string
--- @return number
function database.indexOf(hash) end

---Clears the specified slot. Returns true if there was something in the slot before.
--- @param slot number
--- @return boolean
function database.clear(slot) end

---Copies an entry to another slot, optionally to another database. Returns true if something was overwritten.
--- @param fromSlot number
--- @param toSlot number
--- @param address? string
--- @return boolean
function database.copy(fromSlot, toSlot, address) end

---Copies the data stored in this database to another database with the specified address.
--- @param address string
--- @return number
function database.clone(address) end

return database
