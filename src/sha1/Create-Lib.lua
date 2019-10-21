-- Check whether we're in World of Warcraft or not.
DebugPrint("Starting Create-Lib.lua")
local MAJOR, MINOR = "sha1", 1
assert(LibStub, MAJOR .. " requires LibStub")

sha1 = LibStub:NewLibrary(MAJOR, MINOR)
if sha1 then 
    DebugPrint("sha1 created")
else
    return 
end
