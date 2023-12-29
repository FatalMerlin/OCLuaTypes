---@meta

---@class debug
local debug = {}

---Changes the component network's energy buffer by the specified delta.
--- @param value number
--- @return number
function debug.changeBuffer(value) end

---Connect the debug card to an opencomputers-compatible block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return boolean
function debug.connectToBlock(x, y, z) end

---Get the entity of a player.
--- @param name string
--- @return userdata
function debug.getPlayer(name) end

---Get a list of currently logged-in players.
--- @return table
function debug.getPlayers() end

---Get the world object for the specified dimension ID, or the container's.
--- @param id number
--- @return userdata
function debug.getWorld(id) end

---Get a list of all world IDs, loaded and unloaded.
--- @return table
function debug.getWorlds() end

---Get the container's X position in the world.
--- @return number
function debug.getX() end

---Get the container's Y position in the world.
--- @return number
function debug.getY() end

---Get the container's Z position in the world.
--- @return number
function debug.getZ() end

---Get whether a mod or API is loaded.
--- @param name string
--- @return boolean
function debug.isModLoaded(name) end

---Runs an arbitrary command using a fake player. The first return value will be 1 if the command ran successfully, or 0 otherwise. The second return value will contain what the command returned, or an error message. If the command doesn't return anything, such as /me, the second value will be nil.
--- @param command string
--- @return number, string
function debug.runCommand(command) end

---Test method for user-data and general value conversion.
--- @return userdata
function debug.test() end

---Get the scoreboard object for the world
--- @return userdata
function debug.getScoreboard() end

---Sends data to the debug card with the specified address.
--- @param address string
function debug.sendToDebugCard(address) end

---Sends text to the specified player's clipboard if possible.
--- @param player string
--- @param text string
function debug.sendToClipboard(player, text) end

---Returns contents at the location in world by id (defaults to host world). This method behaves the same as the move check for the robot and drone. The first return value is a boolean indicating whether a robot or drone would be able to enter the location (true means it would be blocked and cannot move into that space). The second return is a string value short name of the type of obstruction. Possible values here include: EntityLivingBase, EntityMinecart, air, liquid, replaceable, passable, and solid.The final value returned is a serialized or table representation of the entity or block scanned at the location. The following code snippet can be used to debug what is possibly blocking the robot from moving forward, if the robot is facing in the negative x direction.
--- @param x number
--- @param y number
--- @param z number
--- @param worldId? number
--- @return boolean, string, table
function debug.scanContentsAt(x, y, z, worldId) end

---Get the metadata of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.getMetadata(x, y, z) end

---Get the ID of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.getBlockId(x, y, z) end

---Gets the numeric id of the current dimension.
--- @return number
function debug.getDimensionId() end

---Check whether the block at the specified coordinates is loaded.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.isLoaded(x, y, z) end

---Gets the seed of the world.
--- @return number
function debug.getSeed() end

---Remove some fluid from a tank at the specified location.
--- @param amount number
--- @param x number
--- @param y number
--- @param z number
--- @param side number
--- @return boolean
function debug.removeFluid(amount, x, y, z, side) end

---Insert some fluid into the tank at the specified location.
--- @param id string
--- @param amount number
--- @param x number
--- @param y number
--- @param z number
--- @param side number
--- @return boolean
function debug.insertFluid(id, amount, x, y, z, side) end

---Gets the name of the current dimension.
--- @return string
function debug.getDimensionName() end

---Get the current world time.
--- @return number
function debug.getTime() end

---Set the current world time.
--- @param value number
function debug.setTime(value) end

---Get the light value (emission) of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.getLightValue(x, y, z) end

---Returns whether it is currently raining.
--- @return boolean
function debug.isRaining() end

---Sets whether it is currently raining.
--- @param value boolean
function debug.setRaining(value) end

---Returns whether it is currently thundering.
--- @return boolean
function debug.isThundering() end

---Sets whether it is currently thundering.
--- @param value boolean
function debug.setThundering(value) end

---Set the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @param id number | string
--- @param meta number
--- @return number
function debug.setBlock(x, y, z, id, meta) end

---Set all blocks in the area defined by the two corner points (x1, y1, z1) and (x2, y2, z2).
--- @param x1 number
--- @param y1 number
--- @param z1 number
--- @param x2 number
--- @param y2 number
--- @param z2 number
--- @param id number | string
--- @param meta number
--- @return number
function debug.setBlocks(x1, y1, z1, x2, y2, z2, id, meta) end

---Reduce the size of an item stack in the inventory at the specified location.
--- @param x number
--- @param y number
--- @param z number
--- @param slot number
--- @param count? number
--- @return number
function debug.removeItem(x, y, z, slot, count) end

---Insert an item stack into the inventory at the specified location. NBT tag is expected in JSON format.
--- @param id string
--- @param count number
--- @param damage number
--- @param nbt string
--- @param x number
--- @param y number
--- @param z number
--- @param side number
--- @return boolean
function debug.insertItem(id, count, damage, nbt, x, y, z, side) end

---Get the current spawn point coordinates.
--- @return number, number, number
function debug.getSpawnPoint() end

---Set the spawn point coordinates.
--- @param x number
--- @param y number
--- @param z number
function debug.setSpawnPoint(x, y, z) end

---Get whether the block at the specified coordinates is directly under the sky.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.canSeeSky(x, y, z) end

---Get the light opacity of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.getLightOpacity(x, y, z) end

---Check whether the block at the specified coordinates has a tile entity.
--- @param x number
--- @param y number
--- @param z number
--- @return number
function debug.hasTileEntity(x, y, z) end

---Play a sound at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @param sound string
--- @param range number
function debug.playSoundAt(x, y, z, sound, range) end

---Get the NBT of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @return table
function debug.getTileNBT(x, y, z) end

---Set the NBT of the block at the specified coordinates.
--- @param x number
--- @param y number
--- @param z number
--- @param nbt table
--- @return boolean
function debug.setTileNBT(x, y, z, nbt) end

---Gets the block state for the block at the specified position, optionally getting additional display related data
--- @param x number
--- @param y number
--- @param z number
--- @param actualState? boolean
function debug.getBlockState(x, y, z, actualState) end

---Get the player's world object.
--- @return userdata
function debug.getWorld() end

---Get the player's game type.
--- @return string
function debug.getGameType() end

---Set the player's game type (survival, creative, adventure).
--- @param gametype string
function debug.setGameType(gametype) end

---Get the player's health.
--- @return number
function debug.getHealth() end

---Set the player's health.
--- @param health number
function debug.setHealth(health) end

---Get the player's max health.
--- @return number
function debug.getMaxHealth() end

---Get the player's position.
--- @return number, number, number
function debug.getPosition() end

---Set the player's position.
--- @param x number
--- @param y number
--- @param z number
function debug.setPosition(x, y, z) end

---Get the player's total experience
--- @return number
function debug.getExperienceTotal() end

---Get the player's level
--- @return number
function debug.getLevel() end

---Add a level to the player's experience level
--- @param level number
function debug.addExperienceLevel(level) end

---Remove a level from the player's experience level
--- @param level number
function debug.removeExperienceLevel(level) end

---Adds the item stack to the players inventory
--- @param id string
--- @param amount number
--- @param meta number
--- @param nbt? string
--- @return number
function debug.insertItem(id, amount, meta, nbt) end

---Clear the players inventory
function debug.clearInventory() end

---Create a new objective for the scoreboard
--- @param objectiveName string
--- @param objectiveCriteria string
function debug.addObjective(objectiveName, objectiveCriteria) end

---Remove an objective from the scoreboard
--- @param objectiveName string
function debug.removeObjective(objectiveName) end

---Increases the score of a player for a certain objective
--- @param playerName string
--- @param objectiveName string
--- @param score int
function debug.increasePlayerScore(playerName, objectiveName, score) end

---Decrease the score of a player for a certain objective
--- @param playerName string
--- @param objectiveName string
--- @param score int
function debug.decreasePlayerScore(playerName, objectiveName, score) end

---Add a player to a team
--- @param player string
--- @param team string
--- @return boolean
function debug.addPlayerToTeam(player, team) end

---Remove a player from a specific team
--- @param player string
--- @param team string
--- @return boolean
function debug.removePlayerFromTeam(player, team) end

---Remove a player from their team
--- @param player string
--- @return boolean
function debug.removePlayerFromTeams(player) end

---Add a team to the scoreboard
--- @param team string
function debug.addTeam(team) end

---Remove a team from the scoreboard
--- @param teamName string
function debug.removeTeam(teamName) end

---Gets the score of a player for a certain objective
--- @param playerName string
--- @param objectiveName string
--- @return int
function debug.getPlayerScore(playerName, objectiveName) end

---Sets the score of a player for a certain objective
--- @param playerName string
--- @param objectiveName string
--- @param score int
function debug.setPlayerScore(playerName, objectiveName, score) end

return debug
