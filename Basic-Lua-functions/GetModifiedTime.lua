-- Returns the epoch time of when the object was last modified.
-- You can change the path as per your requirement.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local status = obj:modified()

return status
