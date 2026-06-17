local STR = require('esi-string')
 
local MongoCreds = {}
local P_Conn
for _, c0 in ipairs(syslib.getobject('/System/Core'):children()) do
    if c0:type() == 'MODEL_CLASS_RELAY' then
        for _, c1 in ipairs(c0:children()) do
            if c1:type() == 'MODEL_CLASS_CORE' then
				local dets = {}
                local site = c1.ObjectName
                local SitePassword = syslib.getvalue(c1:path() .. '/Data Stores/' .. site .. '/' .. site .. '-local-GxP-EV-1.CustomEventStore.MongoDBConnection.Password')
				local Primary = syslib.getvalue(c1:path() .. '/' .. site .. '-MongoDB01-P.HostInformation.HostSystemName')
				local S1 = syslib.getvalue(c1:path() .. '/' .. site .. '-MongoDB01-S1.HostInformation.HostSystemName')
				local S2 = syslib.getvalue(c1:path() .. '/' .. site .. '-MongoDB01-S2.HostInformation.HostSystemName')
				local P_Conn = ('.\\mongosh.exe --host %s:27017 --username dbadmin --password %s --authenticationDatabase admin'):format(Primary, SitePassword)
				local S1_Conn = ('.\\mongosh.exe --host %s:27017 --username dbadmin --password  %s --authenticationDatabase admin'):format(S1, SitePassword)
				local S2_Conn = ('.\\mongosh.exe --host %s:27017 --username dbadmin --password  %s --authenticationDatabase admin'):format(S2, SitePassword)
				MongoCreds[site] = {P_Conn, S1_Conn, S2_Conn}
            end
        end
    end
end
 
return MongoCreds