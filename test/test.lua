-- main.lua
local EasyLua = require("/../deps/easy")

-- I/O Example
EasyLua.writeFile("test.txt", "Hello, EasyLua!")
local content = EasyLua.readFile("test.txt")
print(content) -- Output: Hello, EasyLua!

-- JSON Example
local data = { name = "Lua", version = "5.4", features = { "lightweight", "fast" } }
local json = EasyLua.toJSON(data, true) -- Pretty-print JSON
print(json)

local decoded = EasyLua.fromJSON(json)
print(decoded.name) -- Output: Lua

-- Integer Example
print(EasyLua.isInteger(42)) -- Output: true
print(EasyLua.randomInt(1, 100)) -- Random integer between 1 and 100

-- String Example
local str = "  hello, world!  "
print(EasyLua.trim(str)) -- Output: hello, world!
print(EasyLua.capitalize("easy")) -- Output: Easy

-- Table Example
local t1 = { a = 1, b = { c = 2 } }
local t2 = { b = { d = 3 }, e = 4 }
local merged = EasyLua.mergeTables(t1, t2)
print(merged.b.d) -- Output: 3

-- Math Example
print(EasyLua.clamp(10, 1, 5)) -- Output: 5
print(EasyLua.isPrime(29)) -- Output: true
