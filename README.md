<div align="center">
  <img width="150" height="150" src="https://raw.githubusercontent.com/neoapps-dev/easylua/refs/heads/main/logo.png">
  <h1>EasyLua</h1>
  <p><em>Minimal Lua module to not reinvent the wheel.</em></p>
  
  [![Codeac](https://static.codeac.io/badges/2-903404923.svg "Codeac")](https://app.codeac.io/github/neoapps-dev/easylua) [![License](https://img.shields.io/github/license/neoapps-dev/easylua.svg?style=flat-square)](https://github.com/neoapps-dev/buildit/blob/master/LICENSE)
</div>

# EasyLua

**EasyLua** is a lightweight Lua utility library designed to simplify everyday programming tasks. It aims to eliminate the repetitive work of implementing common utility functions and provides developers with a collection of reusable, cross-platform tools. Whether you're working on a game, web app, or general scripting task, EasyLua can make your Lua development faster and more efficient.

---

## 📌 **Why EasyLua?**

Lua is a powerful and lightweight scripting language, but it lacks many built-in utility functions that developers often need. EasyLua fills this gap by offering a suite of features for:

- File Handling
- JSON Operations
- String Manipulations
- Table Management
- Mathematical Computations
- Date/Time Utilities

With EasyLua, you can save time and focus on building your application instead of writing utility functions from scratch.

---

## 🚀 **Core Features**

### 🔹 **File Utilities**

Simplify file operations with intuitive functions:

- **Read, write, and append** to files.
- **Rename and delete** files safely.
- **Check if files exist** or create directories.

### 🔹 **JSON Utilities**

Handle JSON data effortlessly:

- Encode tables to JSON strings.
- Decode JSON strings into Lua tables.
- Pretty-print JSON for debugging.

### 🔹 **Number Utilities**

Perform common number-related tasks:

- Generate random integers.
- Check if a number is even or odd.
- Calculate factorials or Fibonacci numbers.

### 🔹 **String Utilities**

Work smarter with strings:

- Trim whitespace.
- Split strings into tables by a delimiter.
- Convert to upper or lower case.
- Replace substrings easily.

### 🔹 **Table Utilities**

Take control of Lua tables:

- Deep copy or merge tables.
- Flatten nested tables.
- Sort tables by keys or values.
- Search for specific values.

### 🔹 **Math Utilities**

Boost your math operations:

- Clamp numbers within a range.
- Calculate the Greatest Common Divisor (GCD) or Least Common Multiple (LCM).
- Check if a number is prime.

### 🔹 **Date/Time Utilities**

Handle time-related operations effortlessly:

- Convert timestamps to human-readable formats.
- Get the current date and time in custom formats.

---

## 🛠️ **Getting Started**

### Installation

1. Install [BuildIt](https://github.con/neoapps-dev/buildit)
2. Package EasyLua as a one file:

   ```bash
   buildit pack
   ```
3. Copy the generated `dist/easy.lua` file to your project directory.

### Usage

Load the module and start using its utilities:

```lua
local Easy = require("easy")

-- Example: Reading a file
local content = Easy.Lua.readFile("example.txt")
print(content)

-- Example: JSON Encoding
local jsonString = Easy.Lua.jsonEncode({ key = "value" })
print(jsonString)
```

---

## 🤝 **Contribution Guide**

Contributions are welcome! If you want to add a new feature or fix a bug, follow these steps:

1. Fork the repository.
2. Create a new branch (`feature/your-feature` or `bugfix/your-fix`).
3. Add your code and document it.
4. Submit a pull request with a clear description of your changes.

---

## 📄 **License**

EasyLua is licensed under the [MIT License](https://github.com/neoapps-dev/easylua/blob/main/LICENSE), allowing you to use it freely in both open-source and commercial projects.

---

Made with ❤️ by [NEOAPPS DEV](https://github.com/neoapps-dev).
