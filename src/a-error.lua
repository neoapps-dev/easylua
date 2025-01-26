--====================================================================--
-- based on lua_error.lua by https://github.com/dmccuskey
--====================================================================--


--====================================================================--
--== Support Functions


-- based on https://gist.github.com/cwarden/1207556

local function try( funcs )
	local try_f, catch_f, finally_f = funcs[1], funcs[2], funcs[3]
	assert( try_f, "EasyError: missing function for try()" )
	--==--
	local status, result = pcall(try_f)
	if not status and catch_f then
		catch_f(result)
	end
	if finally_f then finally_f() end
	return result
end

local function catch(f)
	return f[1]
end

local function finally(f)
	return f[1]
end

-- globals
_G.try = try
_G.catch = catch
_G.finally = finally