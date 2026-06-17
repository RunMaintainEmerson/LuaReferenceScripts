-- Gets the communication status of an object.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local communication_empty = obj:comm_empty()
local communication_error = obj:comm_error()
local communication_good = obj:comm_good()
local communication_neutral = obj:comm_neutral()
local communication_warning = obj:comm_warning()

return { communication_empty, communication_error, communication_good, communication_neutral, communication_warning }
