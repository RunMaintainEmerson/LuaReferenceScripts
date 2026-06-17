
--3653 - GTSB Class Code: Check from inmation docs
--"/System/Core/Global-Node01" - Path: Under which we need to search for objects of class GTSB. 
--You can change the path as per your requirement.


-- Link for Code of Classes- https://docs.inmation.com/system-model/1.110/class/index.html

local CAT = require 'esi-catalog'

local res = CAT:FIND_BYCLASSTYPEANDPATH(3653,"/System/Core/Global-Node01",30000)
local gtsb = {}
for _, val in pairs(res) do
	table.insert(gtsb,val.ObjectName)
end

return gtsb


----------------------------------------------------------------------------------------------

-- 3653 - GTSB Class COde

local CAT = require("esi-catalog")

local res = CAT:FIND_BYCLASSTYPE(3653, 1, 300000)

local out = {}

for _,val in pairs(res) do

	out[#out + 1] = {
	["name"] = val.ObjectName,
	["path"] = val:path()
}

end

------------------------------------------------------------------------------------------------