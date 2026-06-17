-- Finds the child object of the given parent object.
-- You can change the path and child name as per your requirement.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA")
local child = obj:child("ATVLA-MongoDB01-P")

return child
