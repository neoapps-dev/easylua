-- test_easylua.lua
local Easy = require("easy")

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
local writeSuccess = Easy.Lua.writeFile("test.txt", "Hello, EasyLua!")
Easy.Lua.assert(writeSuccess, "Failed to write to file.")

-- Read from a file
local content = Easy.Lua.readFile("test.txt")
Easy.Lua.assert(content == "Hello, EasyLua!", "Failed to read from file.")

-- Append to a file
local appendSuccess = Easy.Lua.appendFile("test.txt", "\nAppended text!")
Easy.Lua.assert(appendSuccess, "Failed to append to file.")

-- Check if file exists
local fileExists = Easy.Lua.fileExists("test.txt")
Easy.Lua.assert(fileExists, "File does not exist.")

-- Rename a file
local renameSuccess = Easy.Lua.renameFile("test.txt", "test_renamed.txt")
Easy.Lua.assert(renameSuccess, "Failed to rename file.")

-- Delete a file
local deleteSuccess = Easy.Lua.deleteFile("test_renamed.txt")
Easy.Lua.assert(deleteSuccess, "Failed to delete file.")

print("All I/O tests passed!")

---------------------
-- JSON Tests
---------------------

printTestHeader("JSON Tests")

-- Encode a table to JSON
local data = { name = "Lua", version = "5.4", features = { "lightweight", "fast" } }
local json = Easy.Lua.toJSON(data, true)
Easy.Lua.assert(json ~= nil, "Failed to encode table to JSON.")

-- Decode JSON to a table
local decoded = Easy.Lua.fromJSON(json)
Easy.Lua.assert(decoded.name == "Lua", "Failed to decode JSON to table.")

print("All JSON tests passed!")

---------------------
-- Integer Tests
---------------------

printTestHeader("Integer Tests")

-- Check if a number is an integer
Easy.Lua.assert(Easy.Lua.isInteger(42), "42 should be an integer.")
Easy.Lua.assert(not Easy.Lua.isInteger(42.5), "42.5 should not be an integer.")

-- Generate a random integer
local random = Easy.Lua.randomInt(1, 100)
Easy.Lua.assert(random >= 1 and random <= 100, "Random integer out of range.")

-- Convert a string to an integer
local num = Easy.Lua.toInt("42")
Easy.Lua.assert(num == 42, "Failed to convert string to integer.")

-- Check if a number is even
Easy.Lua.assert(Easy.Lua.isEven(4), "4 should be even.")
Easy.Lua.assert(not Easy.Lua.isEven(5), "5 should not be even.")

-- Check if a number is odd
Easy.Lua.assert(Easy.Lua.isOdd(5), "5 should be odd.")
Easy.Lua.assert(not Easy.Lua.isOdd(4), "4 should not be odd.")

-- Get the absolute value
Easy.Lua.assert(Easy.Lua.abs(-10) == 10, "Absolute value of -10 should be 10.")

-- Calculate the factorial
Easy.Lua.assert(Easy.Lua.factorial(5) == 120, "Factorial of 5 should be 120.")

print("All integer tests passed!")

---------------------
-- String Tests
---------------------

printTestHeader("String Tests")

-- Trim whitespace
local trimmed = Easy.Lua.trim("  hello  ")
Easy.Lua.assert(trimmed == "hello", "Failed to trim whitespace.")

-- Split a string
local parts = Easy.Lua.split("one,two,three", ",")
Easy.Lua.assert(#parts == 3 and parts[2] == "two", "Failed to split string.")

-- Check if a string starts with a prefix
Easy.Lua.assert(Easy.Lua.startsWith("hello world", "hello"), "String should start with 'hello'.")

-- Check if a string ends with a suffix
Easy.Lua.assert(Easy.Lua.endsWith("hello world", "world"), "String should end with 'world'.")

-- Convert to uppercase
Easy.Lua.assert(Easy.Lua.toUpper("hello") == "HELLO", "Failed to convert to uppercase.")

-- Convert to lowercase
Easy.Lua.assert(Easy.Lua.toLower("HELLO") == "hello", "Failed to convert to lowercase.")

-- Capitalize the first letter
Easy.Lua.assert(Easy.Lua.capitalize("easy") == "Easy", "Failed to capitalize string.")

-- Reverse a string
Easy.Lua.assert(Easy.Lua.reverse("hello") == "olleh", "Failed to reverse string.")

-- Count occurrences of a substring
Easy.Lua.assert(Easy.Lua.countSubstring("hello hello", "hello") == 2, "Failed to count substrings.")

-- Replace all occurrences of a substring
Easy.Lua.assert(Easy.Lua.replace("hello world", "world", "Lua") == "hello Lua", "Failed to replace substring.")

-- Check if a string is blank
Easy.Lua.assert(Easy.Lua.isBlank("   "), "String should be blank.")

-- Generate a random string
local randomStr = Easy.Lua.randomString(10)
Easy.Lua.assert(#randomStr == 10, "Random string should have length 10.")

print("All string tests passed!")

---------------------
-- Table Tests
---------------------

printTestHeader("Table Tests")

-- Deep copy a table
local original = { a = 1, b = { c = 2 } }
local copy = Easy.Lua.deepCopy(original)
Easy.Lua.assert(copy.b.c == 2, "Failed to deep copy table.")

-- Merge two tables
local t1 = { a = 1, b = 2 }
local t2 = { b = 3, c = 4 }
local merged = Easy.Lua.mergeTables(t1, t2)
Easy.Lua.assert(merged.b == 3 and merged.c == 4, "Failed to merge tables.")

-- Sort a table
local sorted = Easy.Lua.sortTable({ 3, 1, 2 }, function(a, b) return a < b end)
Easy.Lua.assert(sorted[1] == 1 and sorted[3] == 3, "Failed to sort table.")

-- Check if a table contains a value
Easy.Lua.assert(Easy.Lua.tableContains({ 1, 2, 3 }, 2), "Table should contain value 2.")

-- Get the size of a table
Easy.Lua.assert(Easy.Lua.tableSize({ a = 1, b = 2 }) == 2, "Table size should be 2.")

-- Flatten a nested table
local nested = { 1, { 2, { 3, 4 } } }
local flat = Easy.Lua.flattenTable(nested)
Easy.Lua.assert(#flat == 4, "Failed to flatten table.")

print("All table tests passed!")

---------------------
-- Math Tests
---------------------

printTestHeader("Math Tests")

-- Clamp a number
Easy.Lua.assert(Easy.Lua.clamp(10, 1, 5) == 5, "Clamped value should be 5.")

-- Round a number
Easy.Lua.assert(Easy.Lua.round(3.6) == 4, "Rounded value should be 4.")

-- Check if a number is prime
Easy.Lua.assert(Easy.Lua.isPrime(29), "29 should be prime.")

-- Calculate the sum of a table
Easy.Lua.assert(Easy.Lua.sum({ 1, 2, 3, 4, 5 }) == 15, "Sum should be 15.")

-- Calculate the average of a table
Easy.Lua.assert(Easy.Lua.average({ 1, 2, 3, 4, 5 }) == 3, "Average should be 3.")

-- Calculate the GCD
Easy.Lua.assert(Easy.Lua.gcd(12, 18) == 6, "GCD should be 6.")

-- Calculate the LCM
Easy.Lua.assert(Easy.Lua.lcm(12, 18) == 36, "LCM should be 36.")

print("All math tests passed!")

---------------------
-- Date/Time Tests
---------------------

printTestHeader("Date/Time Tests")

-- Get the current date and time
local datetime = Easy.Lua.currentDateTime()
Easy.Lua.assert(datetime ~= nil, "Failed to get current date and time.")

-- Format a timestamp
local formatted = Easy.Lua.formatTimestamp(os.time(), "%Y-%m-%d")
Easy.Lua.assert(formatted ~= nil, "Failed to format timestamp.")

print("All date/time tests passed!")

---------------------
-- File System Tests
---------------------

printTestHeader("File System Tests")

-- Create a directory
local createDirSuccess = Easy.Lua.createDir("test_dir")
Easy.Lua.assert(createDirSuccess, "Failed to create directory.")

-- List files in a directory
local files = Easy.Lua.listFiles(".")
Easy.Lua.assert(#files > 0, "Failed to list files in directory.")

-- Delete a directory
local deleteDirSuccess = Easy.Lua.deleteDir("test_dir")
Easy.Lua.assert(deleteDirSuccess, "Failed to delete directory.")

print("All file system tests passed!")

---------------------
-- System Tests
---------------------

printTestHeader("System Tests")

-- Execute a shell command
local output = Easy.Lua.execute("echo Hello")
Easy.Lua.assert(output:match("Hello"), "Failed to execute shell command.")

-- Get the current working directory
local cwd = Easy.Lua.getCurrentDir()
Easy.Lua.assert(cwd ~= nil, "Failed to get current working directory.")

-- Get the operating system
local osName = Easy.Lua.getOS()
Easy.Lua.assert(osName == "Windows" or osName == "Unix-like", "Failed to detect OS.")

-- Get the current username
local username = Easy.Lua.getUsername()
Easy.Lua.assert(username ~= nil, "Failed to get username.")

-- Get the system's hostname
local hostname = Easy.Lua.getHostname()
Easy.Lua.assert(hostname ~= nil, "Failed to get hostname.")

-- Get the system's uptime
local uptime = Easy.Lua.getUptime()
Easy.Lua.assert(uptime ~= nil, "Failed to get uptime.")

-- Get the local IP address
local ip = Easy.Lua.getLocalIP()
Easy.Lua.assert(ip ~= nil, "Failed to get local IP address.")

-- Check internet connectivity
local internet = Easy.Lua.checkInternet()
Easy.Lua.assert(internet == true or internet == false, "Failed to check internet connectivity.")

-- Send a desktop notification
Easy.Lua.notify("EasyLua Test", "Test", "This is a test notification.")

-- Get the current timestamp
local timestamp = Easy.Lua.getTimestamp()
Easy.Lua.assert(timestamp ~= nil, "Failed to get timestamp.")

-- Get the system's timezone
local timezone = Easy.Lua.getTimezone()
Easy.Lua.assert(timezone ~= nil, "Failed to get timezone.")

print("All system tests passed!")

---------------------
-- Advanced Tests
---------------------

printTestHeader("Advanced Tests")

-- Generate a UUID
local uuid = Easy.Lua.generateUUID()
Easy.Lua.assert(#uuid == 36, "Failed to generate UUID.")

-- Hash a string
local hash = Easy.Lua.hashString("hello")
Easy.Lua.assert(hash ~= nil, "Failed to hash string.")

-- Try-catching in a custom way.

local function riskyOperation()
    error("Something went wrong!") -- This will trigger the error
end

local function handleException(exception)
    print("Caught an exception: " .. exception)
    print("Don't worry, this means that it passed :)")
end

Easy.Lua.try(riskyOperation, handleException) -- try-catch

local counter = Easy.Lua.Reactive(0)

counter:subscribe(function(value)
    if value == 9 then
        print("Counter reached 9!")
    else
    print("Counter value: " .. value)
    end
end)

counter:set(1)
counter:set(9)

print("All advanced tests passed!")

---------------------
-- Final Message
---------------------

print("\n=== All normal tests passed! ===")

---------------------
-- OOP Tests
---------------------

printTestHeader("OOP Tests")

local Person = Easy.OOP.class("Person")
function Person:constructor(name, age)
    self.name = name
    self.age = age
end

function Person:greet()
    if self.grade then
        print("Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old." .. " My grade is " .. self.grade)
    else
        print("Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
    end
end

local Student = Easy.OOP.class("Student", Person)
function Student:constructor(name, age, grade)
    Person.constructor(self, name, age)
    self.grade = grade
end

function Student:study()
    print(self.name .. " is studying.")
end

local person = Person:new("John", 30)
person:greet()

local student = Student:new("Alex", 20, "A")
student:greet()  -- Inherited from Person
student:study()  -- Specific to Student

print("\n=== All OOP tests done! ===\n")

---------------------
-- Queue Tests
---------------------

printTestHeader("Queue Tests")

local queue = Easy.Queue.new()

queue:addTask(function() print("Task 1") end)
queue:addTask(function() print("Task 2") end)
queue:addTask(function() print("Task 3") end)
queue:startWorker() -- do task 1
queue:startWorker() -- do task 2
queue:startWorker() -- do task 3

print("\n=== All queue tests done! ===\n")

---------------------
-- DB Tests
---------------------

printTestHeader("DB Tests")

local db = Easy.DB.new()

db:set("name", "John")
db:set("age", 30)

local name = db:get("name")
local age = db:get("age")

print("Name: " .. name)
print("Age: " .. age)

db:delete("name")

Easy.Lua.try(function()
    print("Name: " .. db:get("name"))
end, function(exception)
    print("Caught an exception: " .. exception)
    print("Don't worry, this means that it passed :)")
end)

print("\n=== All DB tests done! ===\n")

---------------------
-- Final Messages
---------------------

Easy.Log.log(Easy.Log.levels["INFO"], "All tests passed!") -- syntax 1
Easy.Log.trace("This is a trace message") -- syntax 2
Easy.Log.debug("This is a debug message")
Easy.Log.info("This is an info message")
Easy.Log.warn("This is a warning message")
Easy.Log.error("This is an error message")
Easy.Log.fatal("This is a fatal message")

print("\n=== DONE ===\n")