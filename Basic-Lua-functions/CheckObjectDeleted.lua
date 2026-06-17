-- Checks whether the object exists or has been deleted.

-----------------------------------------------TEMPLATE------------------------------------------------
local obj = syslib.getobject("<<PATH TO OBJECT>>")
local status = obj:deleted()

return status


-----------------------------------------------EXAMPLE USAGE------------------------------------------------
local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local status = obj:deleted()

return status
