-- Returns the type of an object and its class code.
-- You can change the path as per your requirement.
-- Link for Class Code: https://docs.inmation.com/system-model/1.110/class/index.html

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local type_meaning, type_code = obj:type()

return type_meaning, type_code
