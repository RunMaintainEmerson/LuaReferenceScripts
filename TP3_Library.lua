-- TAK-IEBRA-Generate-Event-TS-Tag

local V = require("esi-variables")
local lib = {}
local pathEventCatcher = "/System/Core/IEBRA-Relay/IEBRA/Local Core Logic/IEBRA-TP3-Event-Catcher"

function lib.INFO(_)
    return {
        version = {major = 1,minor = 0,patch = 0},
        contacts = {
            {name = "Umakant Kulkarni",email = "umakant.kulkarni@emerson.com"}
        },
        library = {
            modulename = "TAK-IEBRA-Generate-Event-TS-Tag",
            description = "generating events based on time series tag values"
                  },
    }
end

function lib.eventGeneratorChangeMessageText()
	
	local triggerV, triggerQ, triggerT = get("Trigger")
	local currV, currQ, currT = syslib.getvalue(syslib.getself())
	local User, MsgDesc
	
	if triggerV then
		User, MsgDesc = triggerV:match("^(.-)%s*:%s*(.*)$")
	end

	if triggerV == currV then
		return currV, currQ, currT
	else
		
		local event = {      
			["TimestampUTC"] = triggerT,
			["User"] = User,
			["MsgDescription"] = MsgDesc,
			["GMPCritical"] = "Yes",
			["MsgType"] = "Audit"
		}
		if User ~= nil and MsgDesc ~= nil then 
			V:SET(pathEventCatcher, event)
		else
			V:SET("Error_ChangeMessageText", string.format("Message Format is not correct:: Message Received is '%s'",triggerV))
		end
		V:SET("Event_for_ChangeMessageText", event)
		V:SET("User", User)
		V:SET("Message_for_ChangeMessageText", MsgDesc)
		return triggerV, triggerQ, triggerT
	end
end

function lib.eventGeneratorTabletPressAlarm()
	
	local triggerV, triggerQ, triggerT = get("Trigger")
	local currV, currQ, currT = syslib.getvalue(syslib.getself())
	local Code, MsgDesc
	
	if triggerV then
		Code, MsgDesc = triggerV:match("^%s*(%d+)%s+(.*)$")
	end

	if triggerV == currV then
		return currV, currQ, currT
	else
		local objName = syslib.getself().ObjectName
		local event = {      
			["TimestampUTC"] = triggerT,
			["MsgID"] = Code,
			["MsgDescription"] = MsgDesc,
			["GMPCritical"] = "Yes",
			["MsgType"] = "Alarms"
		}
		if Code ~= nil  and MsgDesc ~= nil then
			V:SET(pathEventCatcher, event)
		else
			V:SET("Error_TabletPressAlarm", string.format("Message Format is not correct:: Message Received is '%s'",triggerV))
		end
		V:SET("Event_for_TabletPressAlarm", event)
		V:SET("Code", Code)
		V:SET("Message_for_TabletPressAlarm", MsgDesc)
		return triggerV, triggerQ, triggerT
	end
end

return lib