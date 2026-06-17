
--Script for validating the hash of a script library.

local name_path = "/System/Core/USJTO-Relay/USJTO.ScriptLibrary.LuaModuleName"  
local script_path = "/System/Core/USJTO-Relay/USJTO.ScriptLibrary.AdvancedLuaScript"

local ScriptLibraryName = "tak-site-msi-config-setparameters-common"                --NANME OF SCRIPT LIBRARY WHOSE HASH YOU WANT TO VALIDATE. You can change the name as per your requirement.
local expected = "95d33359aa419b8f8d11b5dbb1a99f344848daa49bc36c15f6a75422df6d80ed" --EXPECTED HASH VALUE OF THE SCRIPT LIBRARY. You can change the hash value as per your requirement.

local names = syslib.get(name_path)
local scripts = syslib.get(script_path)
for i, name in pairs(names) do
    if name == ScriptLibraryName then
        local hash = syslib.digest(scripts[i])
        return { hash == expected, hash }
    end
end

return "Script Library not found"