assert(LibStub, "LibStub is not loaded")
local sha1 = LibStub("LibSHA1")
assert(sha1, "LibSHA1 is not initialized. Please load using the LibSHA1.xml file (for use as a library) or LibSHA1.toc (if validating and benchmarking).")

sha1.DebugPrint("Starting benchmark.lua")


local Text = "The quick brown fox jumped over the lazy dogs."


local function bench_fn(label, fn, ...)
    local start_time = debugprofilestop()
    fn(...)
    local finish_time = debugprofilestop()
    print(("%s: %f ms"):format(label, finish_time - start_time))
 end


 local function RepeatHash(n, s)
    if not s then s = Text end
    for i = 1,n do
        local ret = sha1(s);
    end
 end


 local function RandomHash(n, length)
    if not length then length = 30 end
    for i = 1, n do

        -- Get a random string of desired length
        local chars = {}
        for j = 1, length do
            table.insert(chars, string.char(math.random(0, 255)))
        end

        -- hash it
        local ret = sha1(table.concat(chars))
    end
 end


local function BenchmarkSHA1() 
    sha1.DebugPrint("Starting full benchmark suite.")

    bench_fn("test one fixed hash", RepeatHash, 1)
    bench_fn("test ten fixed hashs", RepeatHash, 10)
    bench_fn("test 100 fixed hashs", RepeatHash, 100)
    
    bench_fn("test one random hash", RandomHash, 1)
    bench_fn("test ten random hashs", RandomHash, 10)
    bench_fn("test 100 random hashs", RandomHash, 100)

    sha1.DebugPrint("Ending full benchmark suite.")
end




-- Create a slash command to run the benchmark.
SLASH_BENCHSHA1 = "/benchsha"
SlashCmdList.BENCHSHA = function (...) BenchmarkSHA1() end
sha1.DebugPrint("Ending benchmark.lua")
