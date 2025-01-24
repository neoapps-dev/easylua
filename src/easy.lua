-- EasyLua Framework
local EasyLua = {}

---------------------
-- Dependencies
---------------------
local json = require("dkjson") -- Robust JSON library

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

---------------------
-- JSON (using dkjson)
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

return EasyLua
