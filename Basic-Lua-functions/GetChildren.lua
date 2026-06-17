-- Finds all the children of an object.

local obj = syslib.getobject("/System/Core/ATVLA-Relay/ATVLA/ATVLA-MongoDB01-P")
local children = obj:children()
local paths = {}

for _, child in pairs(children) do
    table.insert(paths, child:path())
end

return paths
