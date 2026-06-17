
-------------------------------------------------TEMPLATE------------------------------------------------

-- Script to traverse thorugh all the site cores present below "System/Core"


local ok = {}
local errors = {}

for _, c0 in ipairs(syslib.getobject('/System/Core'):children()) do
    if c0:type() == 'MODEL_CLASS_RELAY' then
        for _, c1 in ipairs(c0:children()) do
            if c1:type() == 'MODEL_CLASS_CORE' then
                        --<<ADD YOUR LOGIC HERE>>
            end
        end
    end
end

return require 'rapidjson'.encode({ ok = ok, errors = errors })


-------------------------------------------------EXAMPLE------------------------------------------------

local ok = {}
local errors = {}

for _, c0 in ipairs(syslib.getobject('/System/Core'):children()) do
    if c0:type() == 'MODEL_CLASS_RELAY' then
        for _, c1 in ipairs(c0:children()) do
            if c1:type() == 'MODEL_CLASS_CORE' then
                local site = c1.ObjectName
                ok[site] = syslib.getvalue(c1:path() .. '/Health Monitoring/MongoDB Monitoring/RS OK')
                if not ok[site] then
                    table.insert(errors, site)
                end
            end
        end
    end
end

return require 'rapidjson'.encode({ ok = ok, errors = errors })



