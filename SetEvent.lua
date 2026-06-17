
--Standard attributes: Severity, Message, Timestamp,Type etc
--Link for Standard Attributes: https://docs.inmation.com/api/1.108/lua/functions.html#setevent
local standard_attrs = {
    Severity = 500,
    Message = "script event",
    Timestamp = syslib.now()
}

--Custom attributesare user defined attributes which can be added to the event. 
--You can add as many custom attributes as you want. 
--The first value in the table is the name of the attribute and the second value is the value of the attribute. You can change the value of the custom attributes as per your requirement.

local custom_attrs = {
    { "key1", "str" },
    { "key2", 35 },
    { "key3", {1, 2, 3} }
}

return syslib.setevent(syslib.createevent(standard_attrs, custom_attrs))

--Create the object at specific path
--You can change the path as per your requirement.

--First Argument- Path
--Second Argument - Type

local obj = syslib.createobject("/System/Core/ATVLA-Relay/ATVLA/OBJECT_NAME", "MODEL_CLASS_CONNECTOR")



--Delete the object at specific path
--You can change the path as per your requirement.

--First Argument - Path
syslib.deleteobject("/System/localhost/object")

