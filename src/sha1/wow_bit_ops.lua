DebugPrint("Starting wow-bit-ops.lua")

sha1 = LibStub("sha1")
if not sha1 or sha1.ops then return end
DebugPrint("Creatig ops")

local bit = bit

local ops = {}

local band = bit.band
local bor = bit.bor
local bxor = bit.bxor

-- bit.rol is not defined in WoW - it's not documented in the Wiki, and verified not to exist in game:
-- https://wow.gamepedia.com/Lua_functions#Bit_Functions
ops.uint32_lrot = bit.rol or function(a, bits)
      local power = 2 ^ bits
      local inv_power = 4294967296 / power
      local lower_bits = a % inv_power
      return (lower_bits * power) + ((a - lower_bits) / inv_power)
   end
ops.byte_xor = bxor
ops.uint32_xor_3 = bxor
ops.uint32_xor_4 = bxor

function ops.uint32_ternary(a, b, c)
   -- c ~ (a & (b ~ c)) has less bitwise operations than (a & b) | (~a & c).
   return bxor(c, band(a, bxor(b, c)))
end

function ops.uint32_majority(a, b, c)
   -- (a & (b | c)) | (b & c) has less bitwise operations than (a & b) | (a & c) | (b & c).
   return bor(band(a, bor(b, c)), band(b, c))
end

sha1.ops = ops
DebugPrint("Ending wow-bit-ops.lua")
