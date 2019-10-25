include_files = {"src", "spec", "bench.lua", ".luacheckrc", "*.rockspec"}
std = "min"


ignore = {
	"11./SLASH_.*", -- Setting an undefined (Slash handler) global variable
}

globals = {
	"bit", -- global bit.* object
	"LibStub", -- dependency
}