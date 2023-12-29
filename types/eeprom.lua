--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class eeprom
local eeprom = {}

---Get the currently stored byte array.
--- @return string
function eeprom.get() end

---Overwrite the currently stored byte array.
--- @param data string
function eeprom.set(data) end

---Get the label of the EEPROM.
--- @return string
function eeprom.getLabel() end

---Set the label of the EEPROM.
--- @param data string
function eeprom.setLabel(data) end

---Gets the maximum storage capacity of the EEPROM.
--- @return number
function eeprom.getSize() end

---Gets the maximum data storage capacity of the EEPROM.
--- @return number
function eeprom.getDataSize() end

---Gets currently stored byte-array (usually the component address of the main boot device).
--- @return string
function eeprom.getData() end

---Overwrites currently stored byte-array with specified string.
--- @param data string
function eeprom.setData(data) end

---Gets Checksum of data on EEPROM.
--- @return string
function eeprom.getChecksum() end

---Makes the EEPROM Read-only if it isn't. This process cannot be reversed.
--- @param checksum string
--- @return boolean
function eeprom.makeReadonly(checksum) end

return eeprom
