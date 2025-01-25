-- EasyQueue
local Queue = {}

function Queue.new()
    local self = setmetatable({}, { __index = Queue })
    self.queue = {}
    self.workers = {}
    return self
end

function Queue:addTask(task)
    table.insert(self.queue, task)
end

function Queue:startWorker()
    local worker = coroutine.create(function()
        while true do
            if #self.queue > 0 then
                local task = table.remove(self.queue, 1)
                task()
            end
            coroutine.yield()
        end
    end)
    table.insert(self.workers, worker)
    coroutine.resume(worker)
end