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

### `Easy.Lua.readFile(path)`

Reads the contents of a file.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - The file content as a string, or `nil` and an error message if the file cannot be read.

```lua
local content = Easy.Lua.readFile("test.txt")
```

---

### `Easy.Lua.writeFile(path, content)`

Writes content to a file.

- **Parameters**:
  - `path` (string): The path to the file.
  - `content` (string): The content to write.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
Easy.Lua.writeFile("test.txt", "Hello, EasyLua!")
```

---

### `Easy.Lua.appendFile(path, content)`

Appends content to a file.

- **Parameters**:
  - `path` (string): The path to the file.
  - `content` (string): The content to append.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
Easy.Lua.appendFile("test.txt", "\nAppended text!")
```

---

### `Easy.Lua.fileExists(path)`

Checks if a file exists.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - `true` if the file exists, otherwise `false`.

```lua
if Easy.Lua.fileExists("test.txt") then
    print("File exists!")
end
```

---

### `Easy.Lua.deleteFile(path)`

Deletes a file.

- **Parameters**:
  - `path` (string): The path to the file.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
Easy.Lua.deleteFile("test.txt")
```

---

### `Easy.Lua.renameFile(oldPath, newPath)`

Renames a file.

- **Parameters**:
  - `oldPath` (string): The current path of the file.
  - `newPath` (string): The new path of the file.
- **Returns**:
  - `true` on success, or `nil` and an error message on failure.

```lua
Easy.Lua.renameFile("test.txt", "test_renamed.txt")
```

---

## JSON Utilities

### `Easy.Lua.toJSON(tbl, pretty)`

Encodes a Lua table to a JSON string.

- **Parameters**:
  - `tbl` (table): The table to encode.
  - `pretty` (boolean, optional): Whether to pretty-print the JSON.
- **Returns**:
  - The JSON string.

```lua
local json = Easy.Lua.toJSON({ name = "Lua", version = "5.4" }, true)
```

---

### `Easy.Lua.fromJSON(jsonStr)`

Decodes a JSON string to a Lua table.

- **Parameters**:
  - `jsonStr` (string): The JSON string to decode.
- **Returns**:
  - The decoded table, or `nil` and an error message on failure.

```lua
local tbl = Easy.Lua.fromJSON('{"name":"Lua","version":"5.4"}')
```

---

## Integer Utilities

### `Easy.Lua.isInteger(num)`

Checks if a number is an integer.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is an integer, otherwise `false`.

```lua
print(Easy.Lua.isInteger(42)) -- true
```

---

### `Easy.Lua.randomInt(min, max)`

Generates a random integer between `min` and `max`.

- **Parameters**:
  - `min` (number): The minimum value.
  - `max` (number): The maximum value.
- **Returns**:
  - A random integer.

```lua
print(Easy.Lua.randomInt(1, 100))
```

---

### `Easy.Lua.toInt(str, base)`

Converts a string to an integer.

- **Parameters**:
  - `str` (string): The string to convert.
  - `base` (number, optional): The base for conversion (default is 10).
- **Returns**:
  - The converted integer, or `nil` if the conversion fails.

```lua
print(Easy.Lua.toInt("42")) -- 42
```

---

### `Easy.Lua.isEven(num)`

Checks if a number is even.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is even, otherwise `false`.

```lua
print(Easy.Lua.isEven(4)) -- true
```

---

### `Easy.Lua.isOdd(num)`

Checks if a number is odd.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is odd, otherwise `false`.

```lua
print(Easy.Lua.isOdd(5)) -- true
```

---

### `Easy.Lua.abs(num)`

Returns the absolute value of a number.

- **Parameters**:
  - `num` (number): The number.
- **Returns**:
  - The absolute value.

```lua
print(Easy.Lua.abs(-10)) -- 10
```

---

### `Easy.Lua.factorial(num)`

Calculates the factorial of a number.

- **Parameters**:
  - `num` (number): The number.
- **Returns**:
  - The factorial, or `nil` if the number is negative.

```lua
print(Easy.Lua.factorial(5)) -- 120
```

---

## String Utilities

### `Easy.Lua.trim(str)`

Trims whitespace from the beginning and end of a string.

- **Parameters**:
  - `str` (string): The string to trim.
- **Returns**:
  - The trimmed string.

```lua
print(Easy.Lua.trim("  hello  ")) -- "hello"
```

---

### `Easy.Lua.split(str, delimiter)`

Splits a string by a delimiter.

- **Parameters**:
  - `str` (string): The string to split.
  - `delimiter` (string): The delimiter.
- **Returns**:
  - A table of substrings.

```lua
local parts = Easy.Lua.split("one,two,three", ",")
```

---

### `Easy.Lua.startsWith(str, prefix)`

Checks if a string starts with a prefix.

- **Parameters**:
  - `str` (string): The string to check.
  - `prefix` (string): The prefix.
- **Returns**:
  - `true` if the string starts with the prefix, otherwise `false`.

```lua
print(Easy.Lua.startsWith("hello world", "hello")) -- true
```

---

### `Easy.Lua.endsWith(str, suffix)`

Checks if a string ends with a suffix.

- **Parameters**:
  - `str` (string): The string to check.
  - `suffix` (string): The suffix.
- **Returns**:
  - `true` if the string ends with the suffix, otherwise `false`.

```lua
print(Easy.Lua.endsWith("hello world", "world")) -- true
```

---

### `Easy.Lua.toUpper(str)`

Converts a string to uppercase.

- **Parameters**:
  - `str` (string): The string to convert.
- **Returns**:
  - The uppercase string.

```lua
print(Easy.Lua.toUpper("hello")) -- "HELLO"
```

---

### `Easy.Lua.toLower(str)`

Converts a string to lowercase.

- **Parameters**:
  - `str` (string): The string to convert.
- **Returns**:
  - The lowercase string.

```lua
print(Easy.Lua.toLower("HELLO")) -- "hello"
```

---

### `Easy.Lua.capitalize(str)`

Capitalizes the first letter of a string.

- **Parameters**:
  - `str` (string): The string to capitalize.
- **Returns**:
  - The capitalized string.

```lua
print(Easy.Lua.capitalize("easy")) -- "Easy"
```

---

### `Easy.Lua.reverse(str)`

Reverses a string.

- **Parameters**:
  - `str` (string): The string to reverse.
- **Returns**:
  - The reversed string.

```lua
print(Easy.Lua.reverse("hello")) -- "olleh"
```

---

### `Easy.Lua.countSubstring(str, substring)`

Counts occurrences of a substring in a string.

- **Parameters**:
  - `str` (string): The string to search.
  - `substring` (string): The substring to count.
- **Returns**:
  - The number of occurrences.

```lua
print(Easy.Lua.countSubstring("hello hello", "hello")) -- 2
```

---

### `Easy.Lua.replace(str, old, new)`

Replaces all occurrences of a substring in a string.

- **Parameters**:
  - `str` (string): The string to modify.
  - `old` (string): The substring to replace.
  - `new` (string): The replacement substring.
- **Returns**:
  - The modified string.

```lua
print(Easy.Lua.replace("hello world", "world", "Lua")) -- "hello Lua"
```

---

### `Easy.Lua.isBlank(str)`

Checks if a string is empty or consists only of whitespace.

- **Parameters**:
  - `str` (string): The string to check.
- **Returns**:
  - `true` if the string is blank, otherwise `false`.

```lua
print(Easy.Lua.isBlank("   ")) -- true
```

---

### `Easy.Lua.randomString(length)`

Generates a random string of a given length.

- **Parameters**:
  - `length` (number): The length of the string.
- **Returns**:
  - The random string.

```lua
print(Easy.Lua.randomString(10)) -- e.g., "aB3dEfG7hI"
```

---

## Table Utilities

### `Easy.Lua.deepCopy(tbl)`

Creates a deep copy of a table.

- **Parameters**:
  - `tbl` (table): The table to copy.
- **Returns**:
  - The copied table.

```lua
local copy = Easy.Lua.deepCopy(original)
```

---

### `Easy.Lua.mergeTables(t1, t2)`

Merges two tables (deep merge).

- **Parameters**:
  - `t1` (table): The first table.
  - `t2` (table): The second table.
- **Returns**:
  - The merged table.

```lua
local merged = Easy.Lua.mergeTables({ a = 1 }, { b = 2 })
```

---

### `Easy.Lua.sortTable(tbl, comparator)`

Sorts a table by values.

- **Parameters**:
  - `tbl` (table): The table to sort.
  - `comparator` (function, optional): A comparison function.
- **Returns**:
  - The sorted table.

```lua
local sorted = Easy.Lua.sortTable({ 3, 1, 2 }, function(a, b) return a < b end)
```

---

### `Easy.Lua.tableContains(tbl, value)`

Checks if a table contains a value.

- **Parameters**:
  - `tbl` (table): The table to search.
  - `value` (any): The value to find.
- **Returns**:
  - `true` if the value is found, otherwise `false`.

```lua
print(Easy.Lua.tableContains({ 1, 2, 3 }, 2)) -- true
```

---

### `Easy.Lua.tableSize(tbl)`

Returns the size of a table.

- **Parameters**:
  - `tbl` (table): The table.
- **Returns**:
  - The number of elements in the table.

```lua
print(Easy.Lua.tableSize({ a = 1, b = 2 })) -- 2
```

---

### `Easy.Lua.flattenTable(tbl)`

Flattens a nested table into a single-level table.

- **Parameters**:
  - `tbl` (table): The table to flatten.
- **Returns**:
  - The flattened table.

```lua
local flat = Easy.Lua.flattenTable({ 1, { 2, { 3, 4 } } })
```

---

## Math Utilities

### `Easy.Lua.clamp(num, min, max)`

Clamps a number between `min` and `max`.

- **Parameters**:
  - `num` (number): The number to clamp.
  - `min` (number): The minimum value.
  - `max` (number): The maximum value.
- **Returns**:
  - The clamped value.

```lua
print(Easy.Lua.clamp(10, 1, 5)) -- 5
```

---

### `Easy.Lua.round(num)`

Rounds a number to the nearest integer.

- **Parameters**:
  - `num` (number): The number to round.
- **Returns**:
  - The rounded value.

```lua
print(Easy.Lua.round(3.6)) -- 4
```

---

### `Easy.Lua.isPrime(num)`

Checks if a number is prime.

- **Parameters**:
  - `num` (number): The number to check.
- **Returns**:
  - `true` if the number is prime, otherwise `false`.

```lua
print(Easy.Lua.isPrime(29)) -- true
```

---

### `Easy.Lua.sum(tbl)`

Calculates the sum of a table of numbers.

- **Parameters**:
  - `tbl` (table): The table of numbers.
- **Returns**:
  - The sum.

```lua
print(Easy.Lua.sum({ 1, 2, 3, 4, 5 })) -- 15
```

---

### `Easy.Lua.average(tbl)`

Calculates the average of a table of numbers.

- **Parameters**:
  - `tbl` (table): The table of numbers.
- **Returns**:
  - The average.

```lua
print(Easy.Lua.average({ 1, 2, 3, 4, 5 })) -- 3
```

---

### `Easy.Lua.gcd(a, b)`

Calculates the greatest common divisor (GCD) of two numbers.

- **Parameters**:
  - `a` (number): The first number.
  - `b` (number): The second number.
- **Returns**:
  - The GCD.

```lua
print(Easy.Lua.gcd(12, 18)) -- 6
```

---

### `Easy.Lua.lcm(a, b)`

Calculates the least common multiple (LCM) of two numbers.

- **Parameters**:
  - `a` (number): The first number.
  - `b` (number): The second number.
- **Returns**:
  - The LCM.

```lua
print(Easy.Lua.lcm(12, 18)) -- 36
```

---

## Date/Time Utilities

### `Easy.Lua.currentDateTime()`

Returns the current date and time as a string.

- **Returns**:
  - The date and time in `YYYY-MM-DD HH:MM:SS` format.

```lua
print(Easy.Lua.currentDateTime()) -- e.g., "2023-10-05 14:30:00"
```

---

### `Easy.Lua.formatTimestamp(timestamp, format)`

Formats a timestamp into a custom string.

- **Parameters**:
  - `timestamp` (number): The timestamp.
  - `format` (string, optional): The format string (default is `"%Y-%m-%d %H:%M:%S"`).
- **Returns**:
  - The formatted string.

```lua
print(Easy.Lua.formatTimestamp(os.time(), "%Y-%m-%d")) -- e.g., "2023-10-05"
```

---

## File System Utilities

### `Easy.Lua.listFiles(dir)`

Lists files in a directory.

- **Parameters**:
  - `dir` (string): The directory path.
- **Returns**:
  - A table of file names.

```lua
local files = Easy.Lua.listFiles(".")
```

---

### `Easy.Lua.createDir(path)`

Creates a directory.

- **Parameters**:
  - `path` (string): The directory path.
- **Returns**:
  - `true` on success, otherwise `false`.

```lua
Easy.Lua.createDir("test_dir")
```

---

### `Easy.Lua.deleteDir(path)`

Deletes a directory.

- **Parameters**:
  - `path` (string): The directory path.
- **Returns**:
  - `true` on success, otherwise `false`.

```lua
Easy.Lua.deleteDir("test_dir")
```

---

## System Utilities

### `Easy.Lua.execute(command)`

Executes a shell command and returns the output.

- **Parameters**:
  - `command` (string): The command to execute.
- **Returns**:
  - The command output as a string.

```lua
print(Easy.Lua.execute("echo Hello")) -- "Hello"
```

---

### `Easy.Lua.getCurrentDir()`

Returns the current working directory.

- **Returns**:
  - The current directory path.

```lua
print(Easy.Lua.getCurrentDir()) -- e.g., "/home/user"
```

---

### `Easy.Lua.getOS()`

Returns the operating system name.

- **Returns**:
  - `"Windows"` or `"Unix-like"`.

```lua
print(Easy.Lua.getOS()) -- e.g., "Unix-like"
```

---

### `Easy.Lua.getEnv(var)`

Returns the operating system name.

- **Parameters**:
  - `var` (string): The environment variable name.

- **Returns**:
  - The value of the enviroment variable.

```lua
print(Easy.Lua.getEnv("USER")) -- e.g., "neo"
```

---

### `Easy.Lua.setEnv(var, value)`

Sets the value of an enviroment variable.

- **Parameters**:
  - `var` (string): The environment variable name.
  - `value` (string): The value to set.

---

### `Easy.Lua.isProcessRunning(process)`

Check if a process is running.

- **Parameters**:
  - `process` (string): The name or PID of the process to check.

- **Returns**:
  - `true` if the process is running, `false` otherwise.

---

### `Easy.Lua.killProcess(process)`

Check if a process is running.

- **Parameters**:
  - `process` (string): The name or PID of the process to kill.

---

### `Easy.Lua.getUsername()`

Get the current user's username.

- **Returns**:
  - (string) The username.

---

### `Easy.Lua.getHostname()`

Get the current machine hostname.

- **Returns**:
  - (string) The hostname.

---

### `Easy.Lua.getUptime()`

Get the uptime of the current machine.

- **Returns**:
  - (string) Uptime of the machine.

---

### `Easy.Lua.getLocalIP()`

Get the local IP address of the system.

- **Returns**:
  - (string) The local IP address.

---

### `Easy.Lua.checkInternet()`

Check if a true internet connection is available.

- **Returns**:
  - `true` if there is, `false` otherwise.

---

### `Easy.Lua.notify(name, title, message)`

Sends a desktop notification on Unix-Like and Windows systems.

- **Parameters**:
  - `name` (string): The name/tag of the app
  - `title` (string): The title of the notification.
  - `message` (string): The message of the notification.

---

### `Easy.Lua.getTimestamp()`

Get the system current timestamp.

- **Returns**:
  - (string) The timestamp in format `YYYY-MM-DD HH:MM:SS`.

---

### `Easy.Lua.getTimezone()`

Get the timezone of the system.

- **Returns**:
  - (string) The timezone of the system.

---

### `Easy.Lua.shutdown()`

Shutdown the system.

---

### `Easy.Lua.restart()`

Reboot the system.

---

### `Easy.Lua.getCPUUsage()` (BASIC)

Get the CPU Usage of the system (in percentage, without the percent symbol)

- **Returns**:
  - (number) The CPU usage of the system.

---

### `Easy.Lua.getMemoryUsage()` (BASIC)

Get the Memory Usage of the system (in percentage, without the percent symbol)

- **Returns**:
  - (number) The Memory usage of the system.

---

## Advanced Utilities

### `Easy.Lua.generateUUID()`

Generates a UUID (v4).

- **Returns**:
  - A UUID string.

```lua
print(Easy.Lua.generateUUID()) -- e.g., "f47ac10b-58cc-4372-a567-0e02b2c3d479"
```

---

### `Easy.Lua.hashString(str)`

Hashes a string using a simple algorithm.

- **Parameters**:
  - `str` (string): The string to hash.
- **Returns**:
  - The hash value.

```lua
print(Easy.Lua.hashString("hello")) -- e.g., 99162322
```

---

### `Easy.Lua.assert(condition, message)`

Assert a condition is true, otherwise raise an error.

- **Parameters**:
  - `condition` (boolean): The condition to check.
  - `message` (string): The error message to display if the condition is false.
- **Raises**:
  - An error if the condition is false.

### `Easy.Lua.try(f, catch_f)`

Try-catching in a new syntax!

- **Parameters**:
  - `f` (function): Function to try
  - `catch_f` (function(exception)): Catching function (with the exception)

### `Easy.Lua.Reactive(value)`

Reactive objects with subscribing to changes, changing value and more!

- **Parameters**:
  - `value` (any): The initial value of the reactive object

- **Returns**:
  - A reactive object with the following:
    - object:subscribe(function(value)): Subscribe to changes in value.
    - object:set(value): Changes the value of the object.
    - object:get(): Gets the current latest value.

### `Easy.Log.%s(message)`, %s = Log level

Logs a message with the log level and the message.

- **Parameters**:
  - `message` (string): The message to log.

```lua
Easy.Log.log(Easy.Log.levels["INFO"], "All tests passed!") -- syntax 1
Easy.Log.trace("This is a trace message") -- syntax 2
Easy.Log.debug("This is a debug message")
Easy.Log.info("This is an info message")
Easy.Log.warn("This is a warning message")
Easy.Log.error("This is an error message")
Easy.Log.fatal("This is a fatal message")
```

Output: (colored inside the terminal)

```lua
2025-01-25 16:29:55 [INFO] All tests passed!
2025-01-25 16:29:55 [TRACE] This is a trace message
2025-01-25 16:29:55 [DEBUG] This is a debug message
2025-01-25 16:29:55 [INFO] This is an info message
2025-01-25 16:29:55 [WARN] This is a warning message
2025-01-25 16:29:55 [ERROR] This is an error message
2025-01-25 16:29:55 [FATAL] This is a fatal message
```

## Examples

### Example 1: Reading and Writing Files

```lua
Easy.Lua.writeFile("test.txt", "Hello, EasyLua!")
local content = Easy.Lua.readFile("test.txt")
print(content) -- "Hello, EasyLua!"
```

### Example 2: JSON Encoding and Decoding

```lua
local data = { name = "Lua", version = "5.4" }
local json = Easy.Lua.toJSON(data, true)
print(json) -- Pretty-printed JSON

local decoded = Easy.Lua.fromJSON(json)
print(decoded.name) -- "Lua"
```

### Example 3: String Manipulation

```lua
local str = "  hello world  "
print(Easy.Lua.trim(str)) -- "hello world"
print(Easy.Lua.reverse(str)) -- "dlrow olleh"
```

---

## `EasyOOP`

This module simplifies the OOP usage in Lua. Integrated into EasyLua.

### Functions

#### `class(name, base)`

Creates a new class with the specified `name`. Optionally, you can specify a `base` class to inherit from. This function returns a new class table.

**Arguments:**

- `name` (string): The name of the class (e.g., `"Person"`).
- `base` (table, optional): The parent class from which the new class will inherit.

**Returns:**

- A new class table with a `new()` method for creating instances and a `constructor()` method for custom initialization (optional).

**Example Usage:**

```lua
-- Define a base class 'Person'
local Person = Easy.OOP.class("Person")
function Person:constructor(name, age)
    self.name = name
    self.age = age
end

function Person:greet()
    print("Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end
```

#### `extends(child_class, parent_class)`

Sets up inheritance, allowing the `child_class` to inherit from `parent_class`.

**Arguments:**

- `child_class` (table): The class that will inherit from the parent.
- `parent_class` (table): The class from which `child_class` will inherit.

**Returns:**

- This function modifies the `child_class` to inherit from `parent_class`. It does not return a value.

**Example Usage:**

```lua
-- Define a subclass 'Student' that extends 'Person'
local Student = Easy.OOP.class("Student", Person)
function Student:constructor(name, age, grade)
    Person.constructor(self, name, age)  -- Call the parent class's constructor
    self.grade = grade
end

function Student:study()
    print(self.name .. " is studying.")
end
```

### Class Structure

Each class created with the `class` function has:

1. **A constructor (`constructor`)**: Initializes instance properties (optional, can be customized in each class).
2. **Methods**: Functions that are defined in the class and can be called on instances (e.g., `greet()` in the `Person` class).

### Instance Creation

To create an instance of a class, use the `new()` method defined on each class:

```lua
local person = Person:new("John", 30)
person:greet()

local student = Student:new("Alice", 20, "A")
student:greet()  -- Inherited from Person
student:study()  -- Specific to Student
```

### Example: Full Usage

```lua
local Easy = require("easy")

-- Define a base class 'Person'
local Person = Easy.OOP.class("Person")
function Person:constructor(name, age)
    self.name = name
    self.age = age
end

function Person:greet()
    print("Hello, my name is " .. self.name .. " and I am " .. self.age .. " years old.")
end

-- Define a subclass 'Student' that extends 'Person'
local Student = Easy.OOP.class("Student", Person)
function Student:constructor(name, age, grade)
    Person.constructor(self, name, age)  -- Call the parent class's constructor
    self.grade = grade
end

function Student:study()
    print(self.name .. " is studying.")
end

-- Create instances
local person = Person:new("John", 30)
person:greet()

local student = Student:new("Alice", 20, "A")
student:greet()  -- Inherited from Person
student:study()  -- Specific to Student
```

### Notes

- **`constructor`**: The constructor is a method you can define in your classes to initialize instance properties. It is optional and can be customized for each class.
- **Inheritance**: Classes that inherit from other classes automatically have access to the methods and properties of the parent class. Use `OOP.extends(child_class, parent_class)` to enable inheritance.
- **Instance Creation**: The `new()` function creates instances of classes and can be used with `OOP.class`-created classes. Instances can then access methods defined in their class.

## `EasyQueue`

A simple Queue system integrated into EasyLua.

### `Easy.Queue.new()`

Makes a new EasyQueue.

- **Returns:**
  - A new EasyQueue

### `Easy.Queue.addTask(task)`

Adds a task to EasyQueue

- **Parameters:**
  - `task` (function): The task to execute.

### `Easy.Queue.startWorker()`

Starts a worker for the task in index 1.

### Full Usage

```lua
local Easy = require("easy")
local queue = Easy.Queue.new()
queue:addTask(function() print("Task 1 executed") end)
queue:addTask(function() print("Task 2 executed") end)
queue:startWorker()
queue:startWorker() -- or, use a loop to run through all of them
```

## `EasyDB`

A simple KV Database that stores in the memory.

### `Easy.DB.new()`

Make a new EasyDB

- **Returns**:
  - A new EasyDB

### `Easy.DB.set(key, value)`

Sets [key] to specific [value]

- **Parameters**:
  - `key` (string): The key of the value.
  - `value` (any): The value of the key.

### `Easy.DB.get(key)`

Gets the value of [key]

- **Parameters**:
  - `key` (string): The key of the value.

- **Returns**:
  - (any) The value of the key.

### `Easy.DB.delete(key)`

Deletes [key] off the EasyDB.

- **Parameters**:
  - `key` (string): The key of the value.

### Final Usage

```lua
local Easy = require("easy")
local db = Easy.DB.new()
db:set("name", "John")
print(db:get("name"))  -- Output: John
db:delete("name")
print(db:get("name"))  -- Output: nil
```

---

Here's the documentation for the **EasyHTTP** module using the APIs we just discussed (ReqRes.in, Postman Echo, and JSONPlaceholder). This includes function descriptions and example usage for each HTTP method.

---

## `EasyHTTP`

### Functions for EasyHTTP

#### 1. **Easy.HTTP.get(url, headers, body, callback)**

- **Description**: Sends a `GET` request to the specified URL. Optionally includes headers and body data.
- **Parameters**:
  - `url`: (string) The URL to send the request to.
  - `headers`: (string) Optional headers to include in the request. Example: `"Content-Type: application/json"`.
  - `body`: (string) Optional data to send with the `GET` request.
  - `callback`: (function) A function that will be called with the server's response once the request is complete. The response is passed as a parameter to this function.
- **Returns**: Nothing (the response is passed to the callback function).

##### Example Usage

```lua
Easy.HTTP.get("https://reqres.in/api/users/1", nil, nil, function(response)
    print("GET Response:", response)
end)
```

#### 2. **Easy.HTTP.post(url, headers, body, callback)**

- **Description**: Sends a `POST` request to the specified URL with optional headers and body data.
- **Parameters**:
  - `url`: (string) The URL to send the request to.
  - `headers`: (string) Optional headers to include in the request. Example: `"Content-Type: application/json"`.
  - `body`: (string) The data to send with the `POST` request, usually in JSON format.
  - `callback`: (function) A function that will be called with the server's response once the request is complete. The response is passed as a parameter to this function.
- **Returns**: Nothing (the response is passed to the callback function).

##### Example Usage

```lua
local jsonData = '{"name": "John", "job": "Developer"}'
Easy.HTTP.post("https://reqres.in/api/users", "Content-Type: application/json", jsonData, function(response)
    print("POST Response:", response)
end)
```

#### 3. **Easy.HTTP.put(url, headers, body, callback)**

- **Description**: Sends a `PUT` request to the specified URL with optional headers and body data. Simulates a successful response as **JSONPlaceholder** and **Postman Echo** do not persist data.
- **Parameters**:
  - `url`: (string) The URL to send the request to.
  - `headers`: (string) Optional headers to include in the request. Example: `"Content-Type: application/json"`.
  - `body`: (string) The data to send with the `PUT` request, usually in JSON format.
  - `callback`: (function) A function that will be called with the server's response once the request is complete. The response is passed as a parameter to this function.
- **Returns**: Nothing (the response is passed to the callback function).

##### Example Usage

```lua
local updatedData = '{"name": "Jane", "job": "Manager"}'
Easy.HTTP.put("https://reqres.in/api/users/2", "Content-Type: application/json", updatedData, function(response)
    print("PUT Response:", response)
end)
```

#### 4. **Easy.HTTP.delete(url, headers, body, callback)**

- **Description**: Sends a `DELETE` request to the specified URL with optional headers and body data. Simulates a successful deletion for **JSONPlaceholder** and **Postman Echo**.
- **Parameters**:
  - `url`: (string) The URL to send the request to.
  - `headers`: (string) Optional headers to include in the request. Example: `"Content-Type: application/json"`.
  - `body`: (string) Optional data to send with the `DELETE` request.
  - `callback`: (function) A function that will be called with the server's response once the request is complete. The response is passed as a parameter to this function.
- **Returns**: Nothing (the response is passed to the callback function).

##### Example Usage

```lua
Easy.HTTP.delete("https://reqres.in/api/users/2", nil, nil, function(response)
    print("DELETE Response:", response)
end)
```
