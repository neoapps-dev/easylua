local EasyLogging = {}

EasyLogging.levels = {
    TRACE = { "TRACE", "\27[36m" },  -- Cyan for TRACE
    DEBUG = { "DEBUG", "\27[34m" },  -- Blue for DEBUG
    INFO  = { "INFO",  "\27[32m" },  -- Green for INFO
    WARN  = { "WARN",  "\27[33m" },  -- Yellow for WARN
    ERROR = { "ERROR", "\27[31m" },  -- Red for ERROR
    FATAL = { "FATAL", "\27[41m" }   -- Red background for FATAL
}

function EasyLogging.log(level, message)
    local timestamp = os.date("%Y-%m-%d %H:%M:%S")
    local level_str = "[" .. level[1] .. "]"
    local log_message = string.format("%s %s %s", timestamp, level_str, message)
    print(level[2] .. log_message .. "\27[0m")
end

for level, _ in pairs(EasyLogging.levels) do
    EasyLogging[level:lower()] = function(message)
        EasyLogging.log(EasyLogging.levels[level], message)
    end
end