DebugPrint("Starting test-harness.lua")
local addonName, addonTable = ...

local sha1 = LibStub("sha1")

DebugPrint("after Libstub call, sha1 is ", sha1)
if sha1 then
    
    DebugPrint("Dumping sha1")
    DumpTable(sha1)
else
    DebugPrint("Skipping validation of sha1.sha1")
end

-- Create a sample slash command to test the addon.
SLASH_SHA1 = "/sha"
SlashCmdList.SHA = function (...) print(sha1.sha1(...)) end
DebugPrint("Ending test-harness.lua")
