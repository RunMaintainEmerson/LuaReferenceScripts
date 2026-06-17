local corePath = syslib.getcorepath('.')
local core = syslib.getobject(corePath)



local connStr = syslib.getmongoconnectionstring(('%s/Data Stores/%s/%s-local-GxP-TS-1'):format(corePath, core.ObjectName, core.ObjectName))

local mongo = require 'mongo'

local client = mongo.Client(connStr)


--Check if the connection to MongoDB is successful by running a command. You can replace the command with any other command as per your requirement.
local result, err = client:command('admin', '{"replSetGetStatus":1}') 


return tostring(result or err)

