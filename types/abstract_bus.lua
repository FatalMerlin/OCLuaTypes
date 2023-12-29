--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class abstract_bus
--- The abstract bus generates a signal named bus_message if a message is received. See the signals reference.
local abstract_bus = {}

---Returns whether the local bus interface is enabled.
--- @return boolean
function abstract_bus.getEnabled() end

---Sets whether the local bus interface should be enabled
--- @param enabled boolean
function abstract_bus.setEnabled(enabled) end

---Returns the local interface address. number is a 16 bit hexadecimal number (0xFFFF being a broadcast). Returns 0 if an address has not yet been set.
--- @return number
function abstract_bus.getAddress() end

---Sets the local interface address. number is a 16bit hexadecimal number.
--- @param address number
function abstract_bus.setAddress(address) end

---Scans the abstract bus for attached devices and returns them in a list.
--- @param mask number
--- @return table
function abstract_bus.scan(mask) end

---Sends data across the abstract bus. The table data is in the form of key-value pairs, e.g.
---lua> component.abstract_bus.send(0xFFFF, { ["action"]="dial", ["address"]="Losomdeh Salothirt Erpac" })
--- @param address number
--- @param data table
--- @return boolean
function abstract_bus.send(address, data) end

---Returns the maximum size a packet can be sent over the bus.
--- @return number
function abstract_bus.maxPacketSize() end

return abstract_bus
