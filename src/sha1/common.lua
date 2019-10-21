DebugPrint("Starting common.lua")

local sha1
if WOW_PROJECT_ID then
   sha1 = LibStub("sha1")
   if not sha1 or sha1.common then return end
end
DebugPrint("Creating common functions")

local common = {}

-- Merges four bytes into a uint32 number.
function common.bytes_to_uint32(a, b, c, d)
   return a * 0x1000000 + b * 0x10000 + c * 0x100 + d
end

-- Splits a uint32 number into four bytes.
function common.uint32_to_bytes(a)
   local a4 = a % 256
   a = (a - a4) / 256
   local a3 = a % 256
   a = (a - a3) / 256
   local a2 = a % 256
   local a1 = (a - a2) / 256
   return a1, a2, a3, a4
end


-- unsigned 32 bit number (like bit.bxor returns) to hex
-- Derived with permission from https://github.com/mooreatv/MoLib/blob/master/MoLib.lua#L498
local ML_ToHex = function (num)
	local NumToHex = {"0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "A", "B", "C", "D", "E", "F"}
	local r = {}
	for x = 8, 1, -1 do
	  local v = num % 16
	  num = (num - v) / 16
	  r[x] = NumToHex[v + 1]
	end
	return table.concat(r, "")
  end


-- converting the number to a hexadecimal string
-- WoW's string.format will not work with 32-bit unsigned ints.
function common.w32_to_hexstring (w)
	if WOW_PROJECT_ID then
		return ML_ToHex(w)
	else
		return format("%08x",w)
	end
end

if WOW_PROJECT_ID then
   sha1.common = common
else
   return common
end
DebugPrint("At end of common.lua")
