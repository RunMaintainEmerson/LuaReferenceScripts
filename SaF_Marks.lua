local function chunk()
return syslib.saf_marks()
end
 
return syslib.execute("/System/Core/Local Con", string.dump(chunk))