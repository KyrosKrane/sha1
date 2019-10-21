-- Yes, this is all globals
DEBUGMODE = true

function DebugPrint(...)
    if not DEBUGMODE then return end
    print (...)
end



-- Dumps a table into chat. Not intended for production use.
function DumpTable(tab, indent)
	if not indent then indent = 0 end
	if indent > 10 then
		DebugPrint("Recursion is at 11 already; aborting.")
		return
	end
	for k, v in pairs(tab) do
		local s = ""
		if indent > 0 then
			for i = 0, indent do
				s = s .. "    "
			end
		end
		if "table" == type(v) then
			s = s .. "Item " .. k .. " is sub-table."
			DebugPrint(s)
			indent = indent + 1
			DumpTable(v, indent)
			indent = indent - 1
		else
			s = s .. "Item " .. k .. " is " .. tostring(v)
			DebugPrint(s)
		end
	end
end -- DumpTable()
