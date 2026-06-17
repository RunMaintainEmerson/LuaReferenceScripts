-- Returns true if the object is in warning state, otherwise false.
-- You can change the path as per your requirement.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local status = obj:warning()

return status
