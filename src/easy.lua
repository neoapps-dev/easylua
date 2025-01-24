-- EasyLua Framework
local EasyLua = {}

---------------------
-- Cross-platform I/O
---------------------

-- Read a file
function EasyLua.readFile(path)
    local file, err = io.open(path, "r")
    if not file then return nil, err end
    local content = file:read("*a")
    file:close()
    return content
end

-- Write to a file
function EasyLua.writeFile(path, content)
    local file, err = io.open(path, "w")
    if not file then return nil, err end
    file:write(content)
    file:close()
    return true
end

-- Append to a file
function EasyLua.appendFile(path, content)
    local file, err = io.open(path, "a")
    if not file then return nil, err end
    file:write(content)
    file:close()
    return true
end

-- Check if a file exists
function EasyLua.fileExists(path)
    local file = io.open(path, "r")
    if file then
        file:close()
        return true
    end
    return false
end

-- Delete a file
function EasyLua.deleteFile(path)
    return os.remove(path)
end

-- Rename a file
function EasyLua.renameFile(oldPath, newPath)
    return os.rename(oldPath, newPath)
end

---------------------
-- JSON Utilities
-- Uses dkjson library
---------------------

-- Encode a table to JSON
function EasyLua.toJSON(tbl, pretty)
    return json.encode(tbl, { indent = pretty and true or false })
end

-- Decode JSON to a table
function EasyLua.fromJSON(jsonStr)
    local tbl, pos, err = json.decode(jsonStr, 1, nil)
    if err then return nil, err end
    return tbl
end

---------------------
-- Integer Utilities
---------------------

-- Check if a number is an integer
function EasyLua.isInteger(num)
    return type(num) == "number" and math.floor(num) == num
end

-- Generate a random integer in a range
function EasyLua.randomInt(min, max)
    return math.random(min, max)
end

-- Convert a string to an integer
function EasyLua.toInt(str, base)
    base = base or 10
    return tonumber(str, base)
end

-- Check if a number is even
function EasyLua.isEven(num)
    return num % 2 == 0
end

-- Check if a number is odd
function EasyLua.isOdd(num)
    return num % 2 ~= 0
end

-- Get the absolute value of a number
function EasyLua.abs(num)
    return math.abs(num)
end

-- Get the factorial of a number
function EasyLua.factorial(num)
    if num < 0 then return nil end
    if num == 0 then return 1 end
    return num * EasyLua.factorial(num - 1)
end

---------------------
-- String Utilities
---------------------

-- Trim whitespace from a string
function EasyLua.trim(str)
    return str:match("^%s*(.-)%s*$")
end

-- Split a string by a delimiter
function EasyLua.split(str, delimiter)
    local result = {}
    for part in string.gmatch(str, "[^" .. delimiter .. "]+") do
        table.insert(result, part)
    end
    return result
end

-- Check if a string starts with a prefix
function EasyLua.startsWith(str, prefix)
    return str:sub(1, #prefix) == prefix
end

-- Check if a string ends with a suffix
function EasyLua.endsWith(str, suffix)
    return str:sub(-#suffix) == suffix
end

-- Convert a string to uppercase
function EasyLua.toUpper(str)
    return str:upper()
end

-- Convert a string to lowercase
function EasyLua.toLower(str)
    return str:lower()
end

-- Capitalize the first letter of a string
function EasyLua.capitalize(str)
    return str:sub(1, 1):upper() .. str:sub(2)
end

-- Reverse a string
function EasyLua.reverse(str)
    return str:reverse()
end

-- Count occurrences of a substring in a string
function EasyLua.countSubstring(str, substring)
    local count = 0
    for _ in str:gmatch(substring) do
        count = count + 1
    end
    return count
end

-- Replace all occurrences of a substring in a string
function EasyLua.replace(str, old, new)
    return str:gsub(old, new)
end

-- Check if a string is empty or whitespace
function EasyLua.isBlank(str)
    return str:match("^%s*$") ~= nil
end

-- Generate a random string of a given length
function EasyLua.randomString(length)
    local chars = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
    local result = ""
    for i = 1, length do
        local rand = math.random(#chars)
        result = result .. chars:sub(rand, rand)
    end
    return result
end

---------------------
-- Table Utilities
---------------------

-- Deep copy a table
function EasyLua.deepCopy(tbl)
    local copy = {}
    for k, v in pairs(tbl) do
        if type(v) == "table" then
            copy[k] = EasyLua.deepCopy(v)
        else
            copy[k] = v
        end
    end
    return copy
end

-- Merge two tables (deep merge)
function EasyLua.mergeTables(t1, t2)
    local result = EasyLua.deepCopy(t1)
    for k, v in pairs(t2) do
        if type(v) == "table" and type(result[k]) == "table" then
            result[k] = EasyLua.mergeTables(result[k], v)
        else
            result[k] = v
        end
    end
    return result
end

-- Sort a table by values
function EasyLua.sortTable(tbl, comparator)
    local sorted = {}
    for k, v in pairs(tbl) do table.insert(sorted, v) end
    table.sort(sorted, comparator)
    return sorted
end

-- Check if a table contains a value
function EasyLua.tableContains(tbl, value)
    for _, v in pairs(tbl) do
        if v == value then
            return true
        end
    end
    return false
end

-- Get the size of a table
function EasyLua.tableSize(tbl)
    local count = 0
    for _ in pairs(tbl) do count = count + 1 end
    return count
end

-- Flatten a nested table into a single-level table
function EasyLua.flattenTable(tbl)
    local result = {}
    local function flatten(t)
        for _, v in pairs(t) do
            if type(v) == "table" then
                flatten(v)
            else
                table.insert(result, v)
            end
        end
    end
    flatten(tbl)
    return result
end

---------------------
-- Math Utilities
---------------------

-- Clamp a number between min and max
function EasyLua.clamp(num, min, max)
    return math.max(min, math.min(max, num))
end

-- Round a number to the nearest integer
function EasyLua.round(num)
    return math.floor(num + 0.5)
end

-- Check if a number is prime
function EasyLua.isPrime(num)
    if num < 2 then return false end
    for i = 2, math.sqrt(num) do
        if num % i == 0 then
            return false
        end
    end
    return true
end

-- Calculate the sum of a table of numbers
function EasyLua.sum(tbl)
    local total = 0
    for _, v in pairs(tbl) do
        total = total + v
    end
    return total
end

-- Calculate the average of a table of numbers
function EasyLua.average(tbl)
    return EasyLua.sum(tbl) / EasyLua.tableSize(tbl)
end

-- Calculate the greatest common divisor (GCD) of two numbers
function EasyLua.gcd(a, b)
    while b ~= 0 do
        a, b = b, a % b
    end
    return a
end

-- Calculate the least common multiple (LCM) of two numbers
function EasyLua.lcm(a, b)
    return (a * b) / EasyLua.gcd(a, b)
end

---------------------
-- Date/Time Utilities
---------------------

-- Get the current date and time as a string
function EasyLua.currentDateTime()
    return os.date("%Y-%m-%d %H:%M:%S")
end

-- Format a timestamp into a custom string
function EasyLua.formatTimestamp(timestamp, format)
    return os.date(format or "%Y-%m-%d %H:%M:%S", timestamp)
end

---------------------
-- File System Utilities
---------------------

-- List files in a directory
function EasyLua.listFiles(dir)
    local files = {}
    local command = (package.config:sub(1,1) == '\\') and 'dir /b ' .. dir or 'ls ' .. dir .. ' 2>/dev/null';
    local pfile = io.popen(command)
    if pfile then
        for file in pfile:lines() do
            table.insert(files, file)
        end
        pfile:close()
    end
    return files
end

-- Create a directory
function EasyLua.createDir(path)
    if os.execute("mkdir " .. path) then
        return true
    end
    return false
end

-- Delete a directory
function EasyLua.deleteDir(path)
    if os.execute("rm -rf " .. path) then -- Unix-like systems
        return true
    elseif os.execute("rmdir /s /q " .. path) then -- Windows
        return true
    end
    return false
end

---------------------
-- System Utilities
---------------------

-- Execute a shell command and return the output
function EasyLua.execute(command)
    local handle = io.popen(command)
    local result = handle:read("*a")
    handle:close()
    return result
end

-- Get the current working directory
function EasyLua.getCurrentDir()
    return EasyLua.execute("cd"):gsub("\n", "")
end

-- Get the operating system name
function EasyLua.getOS()
    return package.config:sub(1, 1) == "\\" and "Windows" or "Unix-like"
end

---------------------
-- Advanced Utilities
---------------------

-- Generate a UUID (v4)
function EasyLua.generateUUID()
    local template = "xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx"
    return string.gsub(template, "[xy]", function(c)
        local v = (c == "x") and math.random(0, 15) or math.random(8, 11)
        return string.format("%x", v)
    end)
end

-- Hash a string using a simple algorithm (for lightweight use)
function EasyLua.hashString(str)
    local hash = 5381
    for i = 1, #str do
        hash = hash * 33 + str:byte(i)
    end
    return hash
end

return EasyLua