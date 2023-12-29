--- Copyright (c) 2023, FatalMerlin
--- All rights reserved.
---
--- This source code is licensed under the BSD-style license found in the
--- LICENSE file in the root directory of this source tree.

---@meta

---@class internet
local internet = {}

---Returns whether TCP connections can be made (config setting).
--- @return boolean
function internet.isTcpEnabled() end

---Returns whether HTTP requests can be made (config setting).
--- @return boolean
function internet.isHttpEnabled() end

---Opens a new TCP connection. Returns the handle of the connection.
--- @param address string
--- @param port? number
--- @return userdata
function internet.connect(address, port) end

---Sends a new HTTP request. Returns the handle of the connection.
--- @param url string
--- @param postData? string
--- @param headers? table
--- @return userdata
function internet.request(url, postData, headers) end

---Tries to read data from the socket stream. Returns the read byte array.
--- @param n number
--- @return string
function internet.read(n) end

---Closes an open socket stream.
function internet.close() end

---Tries to write data to the socket stream. Returns the number of bytes written.
--- @param data string
--- @return number
function internet.write(data) end

---Ensures a socket is connected. Errors if the connection failed.
--- @return boolean
function internet.finishConnect() end

---id():string Returns the id for this socket.
--- @return string
function internet.id() end

---Tries to read data from the response. Returns the read byte array.
--- @param n number
--- @return string
function internet.read(n) end

---Get response code, message and headers.
--- @return number, string, table
function internet.response() end

---Closes an open socket stream.
function internet.close() end

---Ensures a response is available. Errors if the connection failed.
--- @return boolean
function internet.finishConnect() end

return internet
