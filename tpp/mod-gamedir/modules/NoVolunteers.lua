--NoVolunteers.lua
--DEBUGNOW
local this={}

if true then return{} end--DEBUGNOW

function this.PostAllModulesLoad()
	--tex since IH currently doesnt modify AddVolunteerStaffs, 
	--and the function does nothing else but, patching it out should be fine
	TppTerminal.AddVolunteerStaffs=function()end
end

return this