-- test_easylua.lua
local EasyLua = require("easy")

---------------------
-- Helper Functions
---------------------

local function printTestHeader(name)
    print("\n=== " .. name .. " ===")
end

---------------------
-- I/O Tests
---------------------

printTestHeader("I/O Tests")

-- Write to a file
local writeSuccess = EasyLua.writeFile("test.txt", "Hello, EasyLua!")
EasyLua.assert(writeSuccess, "Failed to write to file.")

-- Read from a file
local content = EasyLua.readFile("test.txt")
EasyLua.assert(content == "Hello, EasyLua!", "Failed to read from file.")

-- Append to a file
local appendSuccess = EasyLua.appendFile("test.txt", "\nAppended text!")
EasyLua.assert(appendSuccess, "Failed to append to file.")

-- Check if file exists
local fileExists = EasyLua.fileExists("test.txt")
EasyLua.assert(fileExists, "File does not exist.")

-- Rename a file
local renameSuccess = EasyLua.renameFile("test.txt", "test_renamed.txt")
EasyLua.assert(renameSuccess, "Failed to rename file.")

-- Delete a file
local deleteSuccess = EasyLua.deleteFile("test_renamed.txt")
EasyLua.assert(deleteSuccess, "Failed to delete file.")

print("All I/O tests passed!")

---------------------
-- JSON Tests
---------------------

printTestHeader("JSON Tests")

-- Encode a table to JSON
local data = { name = "Lua", version = "5.4", features = { "lightweight", "fast" } }
local json = EasyLua.toJSON(data, true)
EasyLua.assert(json ~= nil, "Failed to encode table to JSON.")

-- Decode JSON to a table
local decoded = EasyLua.fromJSON(json)
EasyLua.assert(decoded.name == "Lua", "Failed to decode JSON to table.")

print("All JSON tests passed!")

---------------------
-- Integer Tests
---------------------

printTestHeader("Integer Tests")

-- Check if a number is an integer
EasyLua.assert(EasyLua.isInteger(42), "42 should be an integer.")
EasyLua.assert(not EasyLua.isInteger(42.5), "42.5 should not be an integer.")

-- Generate a random integer
local random = EasyLua.randomInt(1, 100)
EasyLua.assert(random >= 1 and random <= 100, "Random integer out of range.")

-- Convert a string to an integer
local num = EasyLua.toInt("42")
EasyLua.assert(num == 42, "Failed to convert string to integer.")

-- Check if a number is even
EasyLua.assert(EasyLua.isEven(4), "4 should be even.")
EasyLua.assert(not EasyLua.isEven(5), "5 should not be even.")

-- Check if a number is odd
EasyLua.assert(EasyLua.isOdd(5), "5 should be odd.")
EasyLua.assert(not EasyLua.isOdd(4), "4 should not be odd.")

-- Get the absolute value
EasyLua.assert(EasyLua.abs(-10) == 10, "Absolute value of -10 should be 10.")

-- Calculate the factorial
EasyLua.assert(EasyLua.factorial(5) == 120, "Factorial of 5 should be 120.")

print("All integer tests passed!")

---------------------
-- String Tests
---------------------

printTestHeader("String Tests")

-- Trim whitespace
local trimmed = EasyLua.trim("  hello  ")
EasyLua.assert(trimmed == "hello", "Failed to trim whitespace.")

-- Split a string
local parts = EasyLua.split("one,two,three", ",")
EasyLua.assert(#parts == 3 and parts[2] == "two", "Failed to split string.")

-- Check if a string starts with a prefix
EasyLua.assert(EasyLua.startsWith("hello world", "hello"), "String should start with 'hello'.")

-- Check if a string ends with a suffix
EasyLua.assert(EasyLua.endsWith("hello world", "world"), "String should end with 'world'.")

-- Convert to uppercase
EasyLua.assert(EasyLua.toUpper("hello") == "HELLO", "Failed to convert to uppercase.")

-- Convert to lowercase
EasyLua.assert(EasyLua.toLower("HELLO") == "hello", "Failed to convert to lowercase.")

-- Capitalize the first letter
EasyLua.assert(EasyLua.capitalize("easy") == "Easy", "Failed to capitalize string.")

-- Reverse a string
EasyLua.assert(EasyLua.reverse("hello") == "olleh", "Failed to reverse string.")

-- Count occurrences of a substring
EasyLua.assert(EasyLua.countSubstring("hello hello", "hello") == 2, "Failed to count substrings.")

-- Replace all occurrences of a substring
EasyLua.assert(EasyLua.replace("hello world", "world", "Lua") == "hello Lua", "Failed to replace substring.")

-- Check if a string is blank
EasyLua.assert(EasyLua.isBlank("   "), "String should be blank.")

-- Generate a random string
local randomStr = EasyLua.randomString(10)
EasyLua.assert(#randomStr == 10, "Random string should have length 10.")

print("All string tests passed!")

---------------------
-- Table Tests
---------------------

printTestHeader("Table Tests")

-- Deep copy a table
local original = { a = 1, b = { c = 2 } }
local copy = EasyLua.deepCopy(original)
EasyLua.assert(copy.b.c == 2, "Failed to deep copy table.")

-- Merge two tables
local t1 = { a = 1, b = 2 }
local t2 = { b = 3, c = 4 }
local merged = EasyLua.mergeTables(t1, t2)
EasyLua.assert(merged.b == 3 and merged.c == 4, "Failed to merge tables.")

-- Sort a table
local sorted = EasyLua.sortTable({ 3, 1, 2 }, function(a, b) return a < b end)
EasyLua.assert(sorted[1] == 1 and sorted[3] == 3, "Failed to sort table.")

-- Check if a table contains a value
EasyLua.assert(EasyLua.tableContains({ 1, 2, 3 }, 2), "Table should contain value 2.")

-- Get the size of a table
EasyLua.assert(EasyLua.tableSize({ a = 1, b = 2 }) == 2, "Table size should be 2.")

-- Flatten a nested table
local nested = { 1, { 2, { 3, 4 } } }
local flat = EasyLua.flattenTable(nested)
EasyLua.assert(#flat == 4, "Failed to flatten table.")

print("All table tests passed!")

---------------------
-- Math Tests
---------------------

printTestHeader("Math Tests")

-- Clamp a number
EasyLua.assert(EasyLua.clamp(10, 1, 5) == 5, "Clamped value should be 5.")

-- Round a number
EasyLua.assert(EasyLua.round(3.6) == 4, "Rounded value should be 4.")

-- Check if a number is prime
EasyLua.assert(EasyLua.isPrime(29), "29 should be prime.")

-- Calculate the sum of a table
EasyLua.assert(EasyLua.sum({ 1, 2, 3, 4, 5 }) == 15, "Sum should be 15.")

-- Calculate the average of a table
EasyLua.assert(EasyLua.average({ 1, 2, 3, 4, 5 }) == 3, "Average should be 3.")

-- Calculate the GCD
EasyLua.assert(EasyLua.gcd(12, 18) == 6, "GCD should be 6.")

-- Calculate the LCM
EasyLua.assert(EasyLua.lcm(12, 18) == 36, "LCM should be 36.")

print("All math tests passed!")

---------------------
-- Date/Time Tests
---------------------

printTestHeader("Date/Time Tests")

-- Get the current date and time
local datetime = EasyLua.currentDateTime()
EasyLua.assert(datetime ~= nil, "Failed to get current date and time.")

-- Format a timestamp
local formatted = EasyLua.formatTimestamp(os.time(), "%Y-%m-%d")
EasyLua.assert(formatted ~= nil, "Failed to format timestamp.")

print("All date/time tests passed!")

---------------------
-- File System Tests
---------------------

printTestHeader("File System Tests")

-- Create a directory
local createDirSuccess = EasyLua.createDir("test_dir")
EasyLua.assert(createDirSuccess, "Failed to create directory.")

-- List files in a directory
local files = EasyLua.listFiles(".")
EasyLua.assert(#files > 0, "Failed to list files in directory.")

-- Delete a directory
local deleteDirSuccess = EasyLua.deleteDir("test_dir")
EasyLua.assert(deleteDirSuccess, "Failed to delete directory.")

print("All file system tests passed!")

---------------------
-- System Tests
---------------------

printTestHeader("System Tests")

-- Execute a shell command
local output = EasyLua.execute("echo Hello")
EasyLua.assert(output:match("Hello"), "Failed to execute shell command.")

-- Get the current working directory
local cwd = EasyLua.getCurrentDir()
EasyLua.assert(cwd ~= nil, "Failed to get current working directory.")

-- Get the operating system
local osName = EasyLua.getOS()
EasyLua.assert(osName == "Windows" or osName == "Unix-like", "Failed to detect OS.")

-- Get the current username
local username = EasyLua.getUsername()
EasyLua.assert(username ~= nil, "Failed to get username.")

-- Get the system's hostname
local hostname = EasyLua.getHostname()
EasyLua.assert(hostname ~= nil, "Failed to get hostname.")

-- Get the system's uptime
local uptime = EasyLua.getUptime()
EasyLua.assert(uptime ~= nil, "Failed to get uptime.")

-- Get the local IP address
local ip = EasyLua.getLocalIP()
EasyLua.assert(ip ~= nil, "Failed to get local IP address.")

-- Check internet connectivity
local internet = EasyLua.checkInternet()
EasyLua.assert(internet == true or internet == false, "Failed to check internet connectivity.")

-- Send a desktop notification
EasyLua.notify("Test", "This is a test notification.")

-- Get the current timestamp
local timestamp = EasyLua.getTimestamp()
EasyLua.assert(timestamp ~= nil, "Failed to get timestamp.")

-- Get the system's timezone
local timezone = EasyLua.getTimezone()
EasyLua.assert(timezone ~= nil, "Failed to get timezone.")

print("All system tests passed!")

---------------------
-- Advanced Tests
---------------------

printTestHeader("Advanced Tests")

-- Generate a UUID
local uuid = EasyLua.generateUUID()
EasyLua.assert(#uuid == 36, "Failed to generate UUID.")

-- Hash a string
local hash = EasyLua.hashString("hello")
EasyLua.assert(hash ~= nil, "Failed to hash string.")

-- Try-catching in a custom way.

local function riskyOperation()
    error("Something went wrong!") -- This will trigger the error
end

local function handleException(exception)
    print("Caught an exception: " .. exception)
    print("Don't worry, this means that it passed :)")
end

EasyLua.try(riskyOperation, handleException) -- try-catch

print("All advanced tests passed!")

---------------------
-- Final Message
---------------------

print("\n=== All tests passed! ===")