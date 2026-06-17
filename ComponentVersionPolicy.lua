--Script for finding the component policy of all connectors under any object

local CAT = require 'esi-catalog'
local T=require('esi-tool')
 
local connectors = {}
 
function get_coding_name(code, path)
    if code == 1 then return 'AUTOMATIC_RESTRICTIVE'
    elseif code == 2  then return 'AUTOMATIC_PERMISSIVE'
    elseif code == 3  then return 'MANUAL_RESTRICTIVE'
    elseif code == 4  then return 'MANUAL_PERMISSIVE'
    end
end
 
function getComponentVersionPolicy(path)
 
	local res = CAT:FIND_BYCLASSTYPEANDPATH(4,path,30000)	
	for _, val in pairs(res) do
		local v_policy = syslib.get(val:path() .. ".ComponentVersionPolicy")
		local temp = get_coding_name(v_policy,val:path())
		connectors[val.ObjectName] = temp
	end
	return connectors
end
return getComponentVersionPolicy("<<Core-Path>>")  --Give the Path of Site Core to find the component version policy of all the connectors present under the site core