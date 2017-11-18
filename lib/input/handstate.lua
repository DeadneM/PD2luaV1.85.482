HandState = HandState or class()

function HandState:init(level)
	self._level = level or 0
end

function HandState:level()
	return self._level
end

function HandState:connnection_names()
	local names = {}

	if not self._connections then
		return names
	end

	for name, _ in pairs(self._connections) do
		table.insert(names, name)
	end

	return names
end

function HandState:apply(hand, key_map)
	if not self._connections then
		return
	end

	local hand_name = hand == 1 and "r" or "l"

	for connection_name, connection_data in pairs(self._connections) do
		if connection_data.hand == hand or not connection_data.hand then
			for _, input in ipairs(connection_data.inputs) do
				key_map[input .. hand_name] = connection_name
			end
		end
	end
end

