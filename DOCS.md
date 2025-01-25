# EasyLua Documentation

**EasyLua** is a lightweight, cross-platform Lua module designed to simplify common tasks like file I/O, JSON handling, string manipulation, table operations, math utilities, and more. It’s perfect for Lua developers who want to save time and avoid reinventing the wheel.

---

## Table of Contents

1. [Installation](#installation)
2. [I/O Utilities](#io-utilities)
3. [JSON Utilities](#json-utilities)
4. [Integer Utilities](#integer-utilities)
5. [String Utilities](#string-utilities)
6. [Table Utilities](#table-utilities)
7. [Math Utilities](#math-utilities)
8. [Date/Time Utilities](#datetime-utilities)
9. [File System Utilities](#file-system-utilities)
10. [System Utilities](#system-utilities)
11. [Advanced Utilities](#advanced-utilities)
12. [Examples](#examples)

---

## Installation

To use **EasyLua**, simply include the `easy.lua` file in your project:

```lua
local EasyLua = require("easy")
```

---

## I/O Utilities

### `EasyLua.readFile(path)`

Reads the contents of a file.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - The file content as a string, or `nil` and an error message if the file cannot be read.

```lua
local content = EasyLua.readFile("test.txt")
```

---

### `EasyLua.writeFile(path, content)`

Writes content to a file.

- **Parameters**:
  - `path` (string): The path to the file.
  - `content` (string): The content to write.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
EasyLua.writeFile("test.txt", "Hello, EasyLua!")
```

---

### `EasyLua.appendFile(path, content)`

Appends content to a file.

- **Parameters**:
  - `path` (string): The path to the file.
  - `content` (string): The content to append.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
EasyLua.appendFile("test.txt", "\nAppended text!")
```

---

### `EasyLua.fileExists(path)`

Checks if a file exists.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - `true` if the file exists, otherwise `false`.

```lua
if EasyLua.fileExists("test.txt") then
    print("File exists!")
end
```

---

### `EasyLua.deleteFile(path)`

Deletes a file.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
EasyLua.deleteFile("test.txt")
```

---

### `EasyLua.renameFile(oldPath, newPath)`

Renames a file.

- **Parameters**:
  - `oldPath` (string): The current path of the file.
  - `newPath` (string): The new path of the file.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
EasyLua.renameFile("test.txt", "test_renamed.txt")
```

---

## JSON Utilities

### `EasyLua.toJSON(tbl, pretty)`

Encodes a Lua table to a JSON string.

- **Parameters**:
  - `tbl` (table): The table to encode.
  - `pretty` (boolean, optional): Whether to pretty-print the JSON.
- **Returns**:
  - The JSON string.

```lua
local json = EasyLua.toJSON({ name = "Lua", version = "5.4" }, true)
```

---

### `EasyLua.fromJSON(jsonStr)`

Decodes a JSON string to a Lua table.

- **Parameters**:
  - `jsonStr` (string): The JSON string to decode.
- **Returns**:
  - The decoded table, or `nil` and an error message on failure.

```lua
local tbl = EasyLua.fromJSON('{"name":"Lua","version":"5.4"}')
```

---

## Integer Utilities

### `EasyLua.isInteger(num)`

Checks if a number is an integer.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is an integer, otherwise `false`.

```lua
print(EasyLua.isInteger(42)) -- true
```

---

### `EasyLua.randomInt(min, max)`

Generates a random integer between `min` and `max`.

- **Parameters**:
  - `min` (number): The minimum value.
  - `max` (number): The maximum value.
- **Returns**:
  - A random integer.

```lua
print(EasyLua.randomInt(1, 100))
```

---

### `EasyLua.toInt(str, base)`

Converts a string to an integer.

- **Parameters**:
  - `str` (string): The string to convert.
  - `base` (number, optional): The base for conversion (default is 10).
- **Returns**:
  - The converted integer, or `nil` if the conversion fails.

```lua
print(EasyLua.toInt("42")) -- 42
```

---

### `EasyLua.isEven(num)`

Checks if a number is even.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is even, otherwise `false`.

```lua
print(EasyLua.isEven(4)) -- true
```

---

### `EasyLua.isOdd(num)`

Checks if a number is odd.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is odd, otherwise `false`.

```lua
print(EasyLua.isOdd(5)) -- true
```

---

### `EasyLua.abs(num)`

Returns the absolute value of a number.

- **Parameters**:
  - `num` (number): The number.
- **Returns**:
  - The absolute value.

```lua
print(EasyLua.abs(-10)) -- 10
```

---

### `EasyLua.factorial(num)`

Calculates the factorial of a number.

- **Parameters**:
  - `num` (number): The number.
- **Returns**:
  - The factorial, or `nil` if the number is negative.

```lua
print(EasyLua.factorial(5)) -- 120
```

---

## String Utilities

### `EasyLua.trim(str)`

Trims whitespace from the beginning and end of a string.

- **Parameters**:
  - `str` (string): The string to trim.
- **Returns**:
  - The trimmed string.

```lua
print(EasyLua.trim("  hello  ")) -- "hello"
```

---

### `EasyLua.split(str, delimiter)`

Splits a string by a delimiter.

- **Parameters**:
  - `str` (string): The string to split.
  - `delimiter` (string): The delimiter.
- **Returns**:
  - A table of substrings.

```lua
local parts = EasyLua.split("one,two,three", ",")
```

---

### `EasyLua.startsWith(str, prefix)`

Checks if a string starts with a prefix.

- **Parameters**:
  - `str` (string): The string to check.
  - `prefix` (string): The prefix.
- **Returns**:
  - `true` if the string starts with the prefix, otherwise `false`.

```lua
print(EasyLua.startsWith("hello world", "hello")) -- true
```

---

### `EasyLua.endsWith(str, suffix)`

Checks if a string ends with a suffix.

- **Parameters**:
  - `str` (string): The string to check.
  - `suffix` (string): The suffix.
- **Returns**:
  - `true` if the string ends with the suffix, otherwise `false`.

```lua
print(EasyLua.endsWith("hello world", "world")) -- true
```

---

### `EasyLua.toUpper(str)`

Converts a string to uppercase.

- **Parameters**:
  - `str` (string): The string to convert.
- **Returns**:
  - The uppercase string.

```lua
print(EasyLua.toUpper("hello")) -- "HELLO"
```

---

### `EasyLua.toLower(str)`

Converts a string to lowercase.

- **Parameters**:
  - `str` (string): The string to convert.
- **Returns**:
  - The lowercase string.

```lua
print(EasyLua.toLower("HELLO")) -- "hello"
```

---

### `EasyLua.capitalize(str)`

Capitalizes the first letter of a string.

- **Parameters**:
  - `str` (string): The string to capitalize.
- **Returns**:
  - The capitalized string.

```lua
print(EasyLua.capitalize("easy")) -- "Easy"
```

---

### `EasyLua.reverse(str)`

Reverses a string.

- **Parameters**:
  - `str` (string): The string to reverse.
- **Returns**:
  - The reversed string.

```lua
print(EasyLua.reverse("hello")) -- "olleh"
```

---

### `EasyLua.countSubstring(str, substring)`

Counts occurrences of a substring in a string.

- **Parameters**:
  - `str` (string): The string to search.
  - `substring` (string): The substring to count.
- **Returns**:
  - The number of occurrences.

```lua
print(EasyLua.countSubstring("hello hello", "hello")) -- 2
```

---

### `EasyLua.replace(str, old, new)`

Replaces all occurrences of a substring in a string.

- **Parameters**:
  - `str` (string): The string to modify.
  - `old` (string): The substring to replace.
  - `new` (string): The replacement substring.
- **Returns**:
  - The modified string.

```lua
print(EasyLua.replace("hello world", "world", "Lua")) -- "hello Lua"
```

---

### `EasyLua.isBlank(str)`

Checks if a string is empty or consists only of whitespace.

- **Parameters**:
  - `str` (string): The string to check.
- **Returns**:
  - `true` if the string is blank, otherwise `false`.

```lua
print(EasyLua.isBlank("   ")) -- true
```

---

### `EasyLua.randomString(length)`

Generates a random string of a given length.

- **Parameters**:
  - `length` (number): The length of the string.
- **Returns**:
  - The random string.

```lua
print(EasyLua.randomString(10)) -- e.g., "aB3dEfG7hI"
```

---

## Table Utilities

### `EasyLua.deepCopy(tbl)`

Creates a deep copy of a table.

- **Parameters**:
  - `tbl` (table): The table to copy.
- **Returns**:
  - The copied table.

```lua
local copy = EasyLua.deepCopy(original)
```

---

### `EasyLua.mergeTables(t1, t2)`

Merges two tables (deep merge).

- **Parameters**:
  - `t1` (table): The first table.
  - `t2` (table): The second table.
- **Returns**:
  - The merged table.

```lua
local merged = EasyLua.mergeTables({ a = 1 }, { b = 2 })
```

---

### `EasyLua.sortTable(tbl, comparator)`

Sorts a table by values.

- **Parameters**:
  - `tbl` (table): The table to sort.
  - `comparator` (function, optional): A comparison function.
- **Returns**:
  - The sorted table.

```lua
local sorted = EasyLua.sortTable({ 3, 1, 2 }, function(a, b) return a < b end)
```

---

### `EasyLua.tableContains(tbl, value)`

Checks if a table contains a value.

- **Parameters**:
  - `tbl` (table): The table to search.
  - `value` (any): The value to find.
- **Returns**:
  - `true` if the value is found, otherwise `false`.

```lua
print(EasyLua.tableContains({ 1, 2, 3 }, 2)) -- true
```

---

### `EasyLua.tableSize(tbl)`

Returns the size of a table.

- **Parameters**:
  - `tbl` (table): The table.
- **Returns**:
  - The number of elements in the table.

```lua
print(EasyLua.tableSize({ a = 1, b = 2 })) -- 2
```

---

### `EasyLua.flattenTable(tbl)`

Flattens a nested table into a single-level table.

- **Parameters**:
  - `tbl` (table): The table to flatten.
- **Returns**:
  - The flattened table.

```lua
local flat = EasyLua.flattenTable({ 1, { 2, { 3, 4 } } })
```

---

## Math Utilities

### `EasyLua.clamp(num, min, max)`

Clamps a number between `min` and `max`.

- **Parameters**:
  - `num` (number): The number to clamp.
  - `min` (number): The minimum value.
  - `max` (number): The maximum value.
- **Returns**:
  - The clamped value.

```lua
print(EasyLua.clamp(10, 1, 5)) -- 5
```

---

### `EasyLua.round(num)`

Rounds a number to the nearest integer.

- **Parameters**:
  - `num` (number): The number to round.
- **Returns**:
  - The rounded value.

```lua
print(EasyLua.round(3.6)) -- 4
```

---

### `EasyLua.isPrime(num)`

Checks if a number is prime.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is prime, otherwise `false`.

```lua
print(EasyLua.isPrime(29)) -- true
```

---

### `EasyLua.sum(tbl)`

Calculates the sum of a table of numbers.

- **Parameters**:
  - `tbl` (table): The table of numbers.
- **Returns**:
  - The sum.

```lua
print(EasyLua.sum({ 1, 2, 3, 4, 5 })) -- 15
```

---

### `EasyLua.average(tbl)`

Calculates the average of a table of numbers.

- **Parameters**:
  - `tbl` (table): The table of numbers.
- **Returns**:
  - The average.

```lua
print(EasyLua.average({ 1, 2, 3, 4, 5 })) -- 3
```

---

### `EasyLua.gcd(a, b)`

Calculates the greatest common divisor (GCD) of two numbers.

- **Parameters**:
  - `a` (number): The first number.
  - `b` (number): The second number.
- **Returns**:
  - The GCD.

```lua
print(EasyLua.gcd(12, 18)) -- 6
```

---

### `EasyLua.lcm(a, b)`

Calculates the least common multiple (LCM) of two numbers.

- **Parameters**:
  - `a` (number): The first number.
  - `b` (number): The second number.
- **Returns**:
  - The LCM.

```lua
print(EasyLua.lcm(12, 18)) -- 36
```

---

## Date/Time Utilities

### `EasyLua.currentDateTime()`

Returns the current date and time as a string.

- **Returns**:
  - The date and time in `YYYY-MM-DD HH:MM:SS` format.

```lua
print(EasyLua.currentDateTime()) -- e.g., "2023-10-05 14:30:00"
```

---

### `EasyLua.formatTimestamp(timestamp, format)`

Formats a timestamp into a custom string.

- **Parameters**:
  - `timestamp` (number): The timestamp.
  - `format` (string, optional): The format string (default is `"%Y-%m-%d %H:%M:%S"`).
- **Returns**:
  - The formatted string.

```lua
print(EasyLua.formatTimestamp(os.time(), "%Y-%m-%d")) -- e.g., "2023-10-05"
```

---

## File System Utilities

### `EasyLua.listFiles(dir)`

Lists files in a directory.

- **Parameters**:
  - `dir` (string): The directory path.
- **Returns**:
  - A table of file names.

```lua
local files = EasyLua.listFiles(".")
```

---

### `EasyLua.createDir(path)`

Creates a directory.

- **Parameters**:
  - `path` (string): The directory path.
- **Returns**:
  - `true` on success, otherwise `false`.

```lua
EasyLua.createDir("test_dir")
```

---

### `EasyLua.deleteDir(path)`

Deletes a directory.

- **Parameters**:
  - `path` (string): The directory path.
- **Returns**:
  - `true` on success, otherwise `false`.

```lua
EasyLua.deleteDir("test_dir")
```

---

## System Utilities

### `EasyLua.execute(command)`

Executes a shell command and returns the output.

- **Parameters**:
  - `command` (string): The command to execute.
- **Returns**:
  - The command output as a string.

```lua
print(EasyLua.execute("echo Hello")) -- "Hello"
```

---

### `EasyLua.getCurrentDir()`

Returns the current working directory.

- **Returns**:
  - The current directory path.

```lua
print(EasyLua.getCurrentDir()) -- e.g., "/home/user"
```

---

### `EasyLua.getOS()`

Returns the operating system name.

- **Returns**:
  - `"Windows"` or `"Unix-like"`.

```lua
print(EasyLua.getOS()) -- e.g., "Unix-like"
```

---

### `EasyLua.getEnv(var)`

Returns the operating system name.

- **Parameters**:
  - `var` (string): The environment variable name.

- **Returns**:
  - The value of the enviroment variable.

```lua
print(EasyLua.getEnv("USER")) -- e.g., "neo"
```

---

### `EasyLua.setEnv(var, value)`

Sets the value of an enviroment variable.

- **Parameters**:
  - `var` (string): The environment variable name.
  - `value` (string): The value to set.

---

### `EasyLua.isProcessRunning(process)`

Check if a process is running.

- **Parameters**:
  - `process` (string): The name or PID of the process to check.

- **Returns**:
  - `true` if the process is running, `false` otherwise.

---

### `EasyLua.killProcess(process)`

Check if a process is running.

- **Parameters**:
  - `process` (string): The name or PID of the process to kill.

---

### `EasyLua.getUsername()`

Get the current user's username.

- **Returns**:
  - (string) The username.

---

### `EasyLua.getHostname()`

Get the current machine hostname.

- **Returns**:
  - (string) The hostname.

---

### `EasyLua.getUptime()`

Get the uptime of the current machine.

- **Returns**:
  - (string) Uptime of the machine.

---

### `EasyLua.getLocalIP()`

Get the local IP address of the system.

- **Returns**:
  - (string) The local IP address.

---

### `EasyLua.checkInternet()`

Check if a true internet connection is available.

- **Returns**:
  - `true` if there is, `false` otherwise.

---

### `EasyLua.notify(title, message)`

Sends a desktop notification on Unix-Like systems. and a dialog box on Windows.

- **Parameters**:
  - `title` (string): The title of the notification.
  - `message` (string): The message of the notification.

---

### `EasyLua.getTimestamp()`

Get the system current timestamp.

- **Returns**:
  - (string) The timestamp in format `YYYY-MM-DD HH:MM:SS`.

---

### `EasyLua.getTimezone()`

Get the timezone of the system.

- **Returns**:
  - (string) The timezone of the system.

---

### `EasyLua.shutdown()`

Shutdown the system.

---

### `EasyLua.restart()`

Reboot the system.

---

### `EasyLua.getCPUUsage()` (BASIC)

Get the CPU Usage of the system (in percentage, without the percent symbol)

- **Returns**:
  - (number) The CPU usage of the system.

---

### `EasyLua.getMemoryUsage()` (BASIC)

Get the Memory Usage of the system (in percentage, without the percent symbol)

- **Returns**:
  - (number) The Memory usage of the system.

---

## Advanced Utilities

### `EasyLua.generateUUID()`

Generates a UUID (v4).

- **Returns**:
  - A UUID string.

```lua
print(EasyLua.generateUUID()) -- e.g., "f47ac10b-58cc-4372-a567-0e02b2c3d479"
```

---

### `EasyLua.hashString(str)`

Hashes a string using a simple algorithm.

- **Parameters**:
  - `str` (string): The string to hash.
- **Returns**:
  - The hash value.

```lua
print(EasyLua.hashString("hello")) -- e.g., 99162322
```

---

### `EasyLua.assert(condition, message)`

Assert a condition is true, otherwise raise an error.

- **Parameters**:
  - `condition` (boolean): The condition to check.
  - `message` (string): The error message to display if the condition is false.
- **Raises**:
  - An error if the condition is false.

### `EasyLua.try(f, catch_f)`

Try-catching in a new syntax!

- **Parameters**:
  - `f` (function): Function to try
  - `catch_f` (function(exception)): Catching function (with the exception)

## Examples

### Example 1: Reading and Writing Files

```lua
EasyLua.writeFile("test.txt", "Hello, EasyLua!")
local content = EasyLua.readFile("test.txt")
print(content) -- "Hello, EasyLua!"
```

### Example 2: JSON Encoding and Decoding

```lua
local data = { name = "Lua", version = "5.4" }
local json = EasyLua.toJSON(data, true)
print(json) -- Pretty-printed JSON

local decoded = EasyLua.fromJSON(json)
print(decoded.name) -- "Lua"
```

### Example 3: String Manipulation

```lua
local str = "  hello world  "
print(EasyLua.trim(str)) -- "hello world"
print(EasyLua.reverse(str)) -- "dlrow olleh"
```
