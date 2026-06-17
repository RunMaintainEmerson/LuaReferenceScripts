
--Script to disable the health monitoring of all the connectors present in the system. 
--The script will find all the connectors present in the system and then it will disable the health monitoring of all the connectors. 
--After disabling the health monitoring, it will check if the health monitoring is disabled or not and return the status of all the connectors.


--Later you can enable the health monitoring of all the connectors by replacing the "disableobject" function with "enableobject" function in the above script.

local CAT = require 'esi-catalog'
 
local res = CAT:FIND_BYCLASSTYPE(4, 1, 300000)
 
for _, val in pairs(res) do
	local path = val:path()
	syslib.disableobject(path .. "/Health Monitoring")
end
 
local status = {}
for _, val in pairs(res) do
       local path = val:path() .. "/Health Monitoring"
       local val1 = syslib.getObject(path)
	if val1:enabled() then
		status[val.ObjectName] = "Object is still enabled"
	end
end
 
if #status then return status else return "Health Monitoring of all connectors is disabled" end
