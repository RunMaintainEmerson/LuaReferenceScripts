-- Returns the model type in which the object is present.
-- You can change the path as per your requirement.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local status = obj:model()

return status
