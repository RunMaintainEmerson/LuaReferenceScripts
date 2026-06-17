
--Script to delete the object at specified location



----------------------------------------------- TEMPLATE------------------------------------------------

-- <<PATH OF OBJECT TO DELETE>> is the path of the object which you want to delete. You can give the path of any object present in the system. The script will check if the object is present or not and if it is present then it will delete that object.

for _, c0 in ipairs(syslib.getobject('/System/Core'):children()) do
    if c0:type() == 'MODEL_CLASS_RELAY' then
        for _, c1 in ipairs(c0:children()) do
            if c1:type() == 'MODEL_CLASS_CORE' then
				if syslib.getobject(<<PATH OF OBJECT TO DELETE>) then
                	local temp = syslib.deleteobject(<<PATH OF OBJECT TO DELETE>> ,42)
				end
            end
        end
    end
end
return true


----------------------------------------------- EXAMPLE------------------------------------------------

for _, c0 in ipairs(syslib.getobject('/System/Core'):children()) do
    if c0:type() == 'MODEL_CLASS_RELAY' then
        for _, c1 in ipairs(c0:children()) do
            if c1:type() == 'MODEL_CLASS_CORE' then
				if syslib.getobject(c1:path() .. "/Health Monitoring/MongoDB Monitoring/RS Status") then
                	local temp = syslib.deleteobject(c1:path() .. "/Health Monitoring/MongoDB Monitoring/RS Status" ,42)
				end
            end
        end
    end
end
return true