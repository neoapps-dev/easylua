-- EasyOOP, part of EasyLua
local OOP = {}

function OOP.class(name, base)
    local new_class = {}
    new_class.__index = new_class
    new_class.name = name
    if base then
        setmetatable(new_class, {__index = base})
    end
    function new_class:new(...)
        local obj = setmetatable({}, self)
        if self.constructor then
            self:constructor(...)
        end
        return obj
    end

    return new_class
end

function OOP.extends(child_class, parent_class)
    setmetatable(child_class, {__index = parent_class})
end