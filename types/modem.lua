--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class modem
---This component generates a signal named modem_message if a message from another network card is received.
---It has the signature localAddress: string, remoteAddress: string, port: number, distance: number, ....
---
---localAddress is the address of the modem component the message was received by.
---remoteAddress is the address of the network card the message was sent from.
---port is the port number the message was delivered to.
---distance is the distance to the modem that sent the message. This is only set for wireless messages. For normal messages this is always 0.
---All further values are values passed along by the sender (i.e. the ... in send and broadcast).
local modem = {}

---Returns whether this modem is capable of sending wireless messages.
--- @return boolean
function modem.isWireless() end

---Returns the maximum packet size for sending messages via network cards. Defaults to 8192. You can change this in the OpenComputers configuration file.
---Every value in a message adds two bytes of overhead. (Even if there's only one value.)
---Numbers add another 8 bytes, true/false/nil another 4 bytes, and strings exactly as many bytes as the string contains—though empty strings still count as one byte.
---Examples:
---"foo" is a 5-byte packet; two bytes of overhead and a three byte string.
---"currentStatus",300 is a 25-byte packet; four bytes overhead, a 13-byte string, and 8 bytes for a number.
--- @return number
function modem.maxPacketSize() end

---Returns whether the specified “port” is currently being listened on. Messages only trigger signals when they arrive on a port that is open.
--- @param port number
--- @return boolean
function modem.isOpen(port) end

---Opens the specified port number for listening. Returns true if the port was opened, false if it was already open. Note: maximum port is 65535
--- @param port number
--- @return boolean
function modem.open(port) end

---Closes the specified port (default: all ports). Returns true if ports were closed.
--- @param port number
--- @return boolean
function modem.close(port) end

---Sends a network message to the specified address. Returns true if the message was sent. This does not mean the message was received, only that it was sent. No port-sniffing for you.
---Any additional arguments are passed along as data. These arguments must be basic types: nil, boolean, number and string values are supported, tables and functions are not. See the serialization API for serialization of tables.
---The number of additional arguments is limited. The default limit is 8. It can be changed in the OpenComputers configuration file, but this is not recommended; higher limits can allow relatively weak computers to break relatively strong ones with no defense possible, while lower limits will prevent some protocols from working.
--- @param address string
--- @param port number
--- @return boolean
function modem.send(address, port) end

---Sends a broadcast message. This message is delivered to all reachable network cards. Returns true if the message was sent. Note that broadcast messages are not delivered to the modem that sent the message.
---All additional arguments are passed along as data. See send.
--- @param port number
--- @return boolean
function modem.broadcast(port) end

---The current signal strength to apply when sending messages. Wireless network cards only.
--- @return number
function modem.getStrength() end

---Sets the signal strength. If this is set to a value larger than zero, sending a message will also generate a wireless message. Also, calls to set the strength that exceed the installed modem's maximum strength will simply set the modem's strength to it's maximum. The higher the signal strength the more energy is required to send messages, though. Wireless network cards only.
--- @param value number
--- @return number
function modem.setStrength(value) end

---Gets the current wake-up message. When the network card detects the wake message (a string in the first argument of a network packet), on any port and the machine is off, the machine is started. Works for robots, cases, servers, drones, and tablets. Linked Cards provide this same functionality.
--- @return string
function modem.getWakeMessage() end

---Sets the wake-up message to the specified string. The message matching can be fuzzy (default is false). A fuzzy match ignores additional trailing arguments in the network packet.
--- @param message string
--- @param fuzzy boolean
--- @return string
function modem.setWakeMessage(message, fuzzy) end

return modem
