-- EasyDB is a simple key-value store that can be used to store data in memory.
local DB = {}

function DB.new()
    local self = setmetatable({}, { __index = DB })
    self.store = {}
    return self
end

function DB:set(key, value)
    self.store[key] = value
end

function DB:get(key)
    return self.store[key]
end

function DB:delete(key)
    self.store[key] = nil
end