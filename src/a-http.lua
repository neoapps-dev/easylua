-- EasyHTTP, a module integrated into EasyLua.
-- Uses curl to make HTTP requests
-- requires curl to be installed on the system
local EasyHTTP = {}

-- GET request
function EasyHTTP.get(url, headers, body, callback)
    local co = coroutine.create(function()
        local response = ""
        if headers then
            if body then
                response = io.popen('curl -s -X GET ' .. url .. ' -H "' .. headers .. '" -d "' .. body .. '"'):read("*a")
            else
                response = io.popen('curl -s -X GET ' .. url .. ' -H "' .. headers .. '"'):read("*a")
            end
        else
            if body then
                response = io.popen('curl -s -X GET ' .. url .. ' -d "' .. body .. '"'):read("*a")
            else
                response = io.popen('curl -s -X GET ' .. url):read("*a")
            end
        end

        callback(response)
    end)

    coroutine.resume(co)
end

-- POST request
function EasyHTTP.post(url, headers, body, callback)
    local co = coroutine.create(function()
        local response = ""
        if headers then
            response = io.popen('curl -s -X POST ' .. url .. ' -H "' .. headers .. '" -d "' .. body .. '"'):read("*a")
        else
            response = io.popen('curl -s -X POST ' .. url .. ' -d "' .. body .. '"'):read("*a")
        end

        callback(response)
    end)

    coroutine.resume(co)
end

-- PUT request
function EasyHTTP.put(url, headers, body, callback)
    local co = coroutine.create(function()
        local response = ""
        if headers then
            response = io.popen('curl -s -X PUT ' .. url .. ' -H "' .. headers .. '" -d "' .. body .. '"'):read("*a")
        else
            response = io.popen('curl -s -X PUT ' .. url .. ' -d "' .. body .. '"'):read("*a")
        end

        callback(response)
    end)

    coroutine.resume(co)
end

-- DELETE request
function EasyHTTP.delete(url, headers, body, callback)
    local co = coroutine.create(function()
        local response = ""
        if headers then
            response = io.popen('curl -s -X DELETE ' .. url .. ' -H "' .. headers .. '" -d "' .. body .. '"'):read("*a")
        else
            response = io.popen('curl -s -X DELETE ' .. url .. ' -d "' .. body .. '"'):read("*a")
        end

        callback(response)
    end)

    coroutine.resume(co)
end