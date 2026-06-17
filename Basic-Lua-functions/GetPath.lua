-- Returns the path of an object.
-- You can change the path as per your requirement.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local status = obj:path()

return status
