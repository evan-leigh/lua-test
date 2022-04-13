local function edit(key, value)
	-- Read from file
	local file = io.open("config.lua", "r")

	local lines = {}

	for line in file:lines() do
		-- Replace key with new value
		local updated_line = line:gsub(key .. " =.*", key .. " = " .. value .. ",")

		-- If matched with updated_line, replace it
		if updated_line ~= line then
			table.insert(lines, updated_line)
		else
			table.insert(lines, line)
		end
	end

	-- Write to file
	file = io.open("config.lua", "w")
	file:write(tostring(table.concat(lines, "\n")))

	-- Close file
	file:close()
end

local function toggle_boolean(key)
	-- Read from file
	local file = io.open("config.lua", "r")

	local lines = {}

	for line in file:lines() do
		-- Check to see if key is in line
		if line:match(key) then
			-- Does the line contain a boolean?
			if line:match("true") then
				-- Replace true with false
				local updated_line = line:gsub("true", "false")
				table.insert(lines, updated_line)
			else
				-- Replace true with false
				local updated_line = line:gsub("false", "true")
				table.insert(lines, updated_line)
			end
		else
			table.insert(lines, line)
		end
	end

	file = io.open("config.lua", "w")
	file:write(tostring(table.concat(lines, "\n")))

	-- Close file
	file:close()
end
