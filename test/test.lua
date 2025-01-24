-- test_easylua.lua
local EasyLua = require("easy")

---------------------
-- Helper Functions
---------------------

local function printTestHeader(name)
    print("\n=== " .. name .. " ===")
end

local function assert(condition, message)
    if not condition then
        error("Test failed: " .. message)
    end
end

---------------------
-- I/O Tests
---------------------

printTestHeader("I/O Tests")

-- Write to a file
local writeSuccess = EasyLua.writeFile("test.txt", "Hello, EasyLua!")
assert(writeSuccess, "Failed to write to file.")

-- Read from a file
local content = EasyLua.readFile("test.txt")
assert(content == "Hello, EasyLua!", "Failed to read from file.")

-- Append to a file
local appendSuccess = EasyLua.appendFile("test.txt", "\nAppended text!")
assert(appendSuccess, "Failed to append to file.")

-- Check if file exists
local fileExists = EasyLua.fileExists("test.txt")
assert(fileExists, "File does not exist.")

-- Rename a file
local renameSuccess = EasyLua.renameFile("test.txt", "test_renamed.txt")
assert(renameSuccess, "Failed to rename file.")

-- Delete a file
local deleteSuccess = EasyLua.deleteFile("test_renamed.txt")
assert(deleteSuccess, "Failed to delete file.")

print("All I/O tests passed!")

---------------------
-- JSON Tests
---------------------

printTestHeader("JSON Tests")

-- Encode a table to JSON
local data = { name = "Lua", version = "5.4", features = { "lightweight", "fast" } }
local json = EasyLua.toJSON(data, true)
assert(json ~= nil, "Failed to encode table to JSON.")

-- Decode JSON to a table
local decoded = EasyLua.fromJSON(json)
assert(decoded.name == "Lua", "Failed to decode JSON to table.")

print("All JSON tests passed!")

---------------------
-- Integer Tests
---------------------

printTestHeader("Integer Tests")

-- Check if a number is an integer
assert(EasyLua.isInteger(42), "42 should be an integer.")
assert(not EasyLua.isInteger(42.5), "42.5 should not be an integer.")

-- Generate a random integer
local random = EasyLua.randomInt(1, 100)
assert(random >= 1 and random <= 100, "Random integer out of range.")

-- Convert a string to an integer
local num = EasyLua.toInt("42")
assert(num == 42, "Failed to convert string to integer.")

-- Check if a number is even
assert(EasyLua.isEven(4), "4 should be even.")
assert(not EasyLua.isEven(5), "5 should not be even.")

-- Check if a number is odd
assert(EasyLua.isOdd(5), "5 should be odd.")
assert(not EasyLua.isOdd(4), "4 should not be odd.")

-- Get the absolute value
assert(EasyLua.abs(-10) == 10, "Absolute value of -10 should be 10.")

-- Calculate the factorial
assert(EasyLua.factorial(5) == 120, "Factorial of 5 should be 120.")

print("All integer tests passed!")

---------------------
-- String Tests
---------------------

printTestHeader("String Tests")

-- Trim whitespace
local trimmed = EasyLua.trim("  hello  ")
assert(trimmed == "hello", "Failed to trim whitespace.")

-- Split a string
local parts = EasyLua.split("one,two,three", ",")
assert(#parts == 3 and parts[2] == "two", "Failed to split string.")

-- Check if a string starts with a prefix
assert(EasyLua.startsWith("hello world", "hello"), "String should start with 'hello'.")

-- Check if a string ends with a suffix
assert(EasyLua.endsWith("hello world", "world"), "String should end with 'world'.")

-- Convert to uppercase
assert(EasyLua.toUpper("hello") == "HELLO", "Failed to convert to uppercase.")

-- Convert to lowercase
assert(EasyLua.toLower("HELLO") == "hello", "Failed to convert to lowercase.")

-- Capitalize the first letter
assert(EasyLua.capitalize("easy") == "Easy", "Failed to capitalize string.")

-- Reverse a string
assert(EasyLua.reverse("hello") == "olleh", "Failed to reverse string.")

-- Count occurrences of a substring
assert(EasyLua.countSubstring("hello hello", "hello") == 2, "Failed to count substrings.")

-- Replace all occurrences of a substring
assert(EasyLua.replace("hello world", "world", "Lua") == "hello Lua", "Failed to replace substring.")

-- Check if a string is blank
assert(EasyLua.isBlank("   "), "String should be blank.")

-- Generate a random string
local randomStr = EasyLua.randomString(10)
assert(#randomStr == 10, "Random string should have length 10.")

print("All string tests passed!")

---------------------
-- Table Tests
---------------------

printTestHeader("Table Tests")

-- Deep copy a table
local original = { a = 1, b = { c = 2 } }
local copy = EasyLua.deepCopy(original)
assert(copy.b.c == 2, "Failed to deep copy table.")

-- Merge two tables
local t1 = { a = 1, b = 2 }
local t2 = { b = 3, c = 4 }
local merged = EasyLua.mergeTables(t1, t2)
assert(merged.b == 3 and merged.c == 4, "Failed to merge tables.")

-- Sort a table
local sorted = EasyLua.sortTable({ 3, 1, 2 }, function(a, b) return a < b end)
assert(sorted[1] == 1 and sorted[3] == 3, "Failed to sort table.")

-- Check if a table contains a value
assert(EasyLua.tableContains({ 1, 2, 3 }, 2), "Table should contain value 2.")

-- Get the size of a table
assert(EasyLua.tableSize({ a = 1, b = 2 }) == 2, "Table size should be 2.")

-- Flatten a nested table
local nested = { 1, { 2, { 3, 4 } } }
local flat = EasyLua.flattenTable(nested)
assert(#flat == 4, "Failed to flatten table.")

print("All table tests passed!")

---------------------
-- Math Tests
---------------------

printTestHeader("Math Tests")

-- Clamp a number
assert(EasyLua.clamp(10, 1, 5) == 5, "Clamped value should be 5.")

-- Round a number
assert(EasyLua.round(3.6) == 4, "Rounded value should be 4.")

-- Check if a number is prime
assert(EasyLua.isPrime(29), "29 should be prime.")

-- Calculate the sum of a table
assert(EasyLua.sum({ 1, 2, 3, 4, 5 }) == 15, "Sum should be 15.")

-- Calculate the average of a table
assert(EasyLua.average({ 1, 2, 3, 4, 5 }) == 3, "Average should be 3.")

-- Calculate the GCD
assert(EasyLua.gcd(12, 18) == 6, "GCD should be 6.")

-- Calculate the LCM
assert(EasyLua.lcm(12, 18) == 36, "LCM should be 36.")

print("All math tests passed!")

---------------------
-- Date/Time Tests
---------------------

printTestHeader("Date/Time Tests")

-- Get the current date and time
local datetime = EasyLua.currentDateTime()
assert(datetime ~= nil, "Failed to get current date and time.")

-- Format a timestamp
local formatted = EasyLua.formatTimestamp(os.time(), "%Y-%m-%d")
assert(formatted ~= nil, "Failed to format timestamp.")

print("All date/time tests passed!")

---------------------
-- File System Tests
---------------------

printTestHeader("File System Tests")

-- Create a directory
local createDirSuccess = EasyLua.createDir("test_dir")
assert(createDirSuccess, "Failed to create directory.")

-- List files in a directory
local files = EasyLua.listFiles(".")
assert(#files > 0, "Failed to list files in directory.")

-- Delete a directory
local deleteDirSuccess = EasyLua.deleteDir("test_dir")
assert(deleteDirSuccess, "Failed to delete directory.")

print("All file system tests passed!")

---------------------
-- System Tests
---------------------

printTestHeader("System Tests")

-- Execute a shell command
local output = EasyLua.execute("echo Hello")
assert(output:match("Hello"), "Failed to execute shell command.")

-- Get the current working directory
local cwd = EasyLua.getCurrentDir()
assert(cwd ~= nil, "Failed to get current working directory.")

-- Get the operating system
local osName = EasyLua.getOS()
assert(osName == "Windows" or osName == "Unix-like", "Failed to detect OS.")

print("All system tests passed!")

---------------------
-- Advanced Tests
---------------------

printTestHeader("Advanced Tests")

-- Generate a UUID
local uuid = EasyLua.generateUUID()
assert(#uuid == 36, "Failed to generate UUID.")

-- Hash a string
local hash = EasyLua.hashString("hello")
assert(hash ~= nil, "Failed to hash string.")

print("All advanced tests passed!")

---------------------
-- Final Message
---------------------

print("\n=== All tests passed! ===")