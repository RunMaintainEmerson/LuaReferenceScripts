--IIF(CONDITION,VALUE1, VALUE2)
--VALUE1 is returned when condition is true, else VALUE2 is returned. 

local T=require('esi-tool')
local str=T:IIF(12>11,"the logic works","oops!")
return str
