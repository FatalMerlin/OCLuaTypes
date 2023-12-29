---@meta

---@class filesystem
local filesystem = {}

---The currently used capacity of the file system, in bytes.
--- @return number
function filesystem.spaceUsed() end

---Opens a new file descriptor and returns its handle.
--- @param path string
--- @param mode? string
--- @return number
function filesystem.open(path, mode) end

---Seeks in an open file descriptor with the specified handle. Returns the new pointer position.
--- @param handle number
--- @param whence string
--- @param offset number
--- @return number
function filesystem.seek(handle, whence, offset) end

---Creates a directory at the specified absolute path in the file system. Creates parent directories, if necessary.
--- @param path string
--- @return boolean
function filesystem.makeDirectory(path) end

---Returns whether an object exists at the specified absolute path in the file system.
--- @param path string
--- @return boolean
function filesystem.exists(path) end

---Returns whether the file system is read-only.
--- @return boolean
function filesystem.isReadOnly() end

---Writes the specified data to an open file descriptor with the specified handle.
--- @param handle number
--- @param value string
--- @return boolean
function filesystem.write(handle, value) end

---The overall capacity of the file system, in bytes.
--- @return number
function filesystem.spaceTotal() end

---Returns whether the object at the specified absolute path in the file system is a directory.
--- @param path string
--- @return boolean
function filesystem.isDirectory(path) end

---Renames/moves an object from the first specified absolute path in the file system to the second.
--- @param from string
--- @param to string
--- @return boolean
function filesystem.rename(from, to) end

---Returns a list of names of objects in the directory at the specified absolute path in the file system.
--- @param path string
--- @return table
function filesystem.list(path) end

---Returns the (real world) timestamp of when the object at the specified absolute path in the file system was modified.
--- @param path string
--- @return number
function filesystem.lastModified(path) end

---Get the current label of the file system.
--- @return string
function filesystem.getLabel() end

---Removes the object at the specified absolute path in the file system.
--- @param path string
--- @return boolean
function filesystem.remove(path) end

---Closes an open file descriptor with the specified handle.
--- @param handle number
function filesystem.close(handle) end

---Returns the size of the object at the specified absolute path in the file system.
--- @param path string
--- @return number
function filesystem.size(path) end

---Reads up to the specified amount of data from an open file descriptor with the specified handle. Returns nil when EOF is reached.
--- @param handle number
--- @param count number
--- @return string | nil
function filesystem.read(handle, count) end

---Sets the label of the file system. Returns the new value, which may be truncated.
--- @param value string
--- @return string
function filesystem.setLabel(value) end

return filesystem
