--Script to check the existence of an object in the system by giving the path of that object. 
--The script will return the name of the object if it is present in the system otherwise it will return nil.

local O = require("esi-objects")
local obj = syslib.getobject("/System/Core/ATVIE-Relay/ATVIE")
local exists, obj = O: EXISTS ({path = obj:path()})
return obj.ObjectName

-------------------------------------------------------------------------------------

local O = require("esi-objects")
local obj = syslib.getobject("/System/Core/ATVIE-Relay/ATVIE")
local exists, obj = O: EXISTS ({parentpath = obj:parent():path(), objectname = obj.ObjectName})
return {exists, obj.ObjectName}

-------------------------------------------------------------------------------------