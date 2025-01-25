EasyEventEmitter = {}

function EasyEventEmitter:new()
    local obj = { events = {} }
    setmetatable(obj, self)
    self.__index = self
    return obj
end

function EasyEventEmitter:on(event, listener)
    if not self.events[event] then
        self.events[event] = {}
    end
    table.insert(self.events[event], listener)
end

function EasyEventEmitter:off(event)
    if not self.events[event] then
        self.events[event] = {}
    end
    table.remove(self.events[event])
end

function EasyEventEmitter:emit(event, ...)
    if self.events[event] then
        for _, listener in ipairs(self.events[event]) do
            listener(...)
        end
    end
end