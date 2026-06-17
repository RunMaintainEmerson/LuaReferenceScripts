
--syslib.digest() function can be used to calculate the hash of a script library. 
--You can use this function to validate if the script library has been changed or not by comparing the calculated hash with the expected hash value.


local name_path = "/System/Core/ATVLA-Relay/ATVLA.ScriptLibrary.LuaModuleName"
local script_path = "/System/Core/ATVLA-Relay/ATVLA.ScriptLibrary.AdvancedLuaScript"

local names = syslib.get(name_path)
local scripts = syslib.get(script_path)

local library = "atvla-simaticbatch-cs1137_xml"


for no, name in pairs(names) do
	if name == library then return syslib.digest(scripts[no]) end
end
return "no library of that name found"
