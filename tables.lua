-- 5.1
sunday = "monday"
monday = "sunday"
t = { sunday = "monday", [sunday] = monday }
print(t.sunday, t[sunday], t[t.sunday])

-- 5.2
a = {}
a.a = a
print(a.a.a.a)
a.a.a.a = 3
-- print(a.a.a.a)
print(a.a)

function is_valid_sequence(list)
	local n = #list

	for i = 1, n do
		if list[i] == nil then
			return false
		end
	end

	for k in pairs(list) do
		if type(k) ~= "number" or k < 1 or k < n or k ~= math.floor(k) then
			return false
		end
	end

	return true
end

function insert_all(sList, index, tList)
	for v in ipairs(sList) do
		table.insert(tList, index, v)
		index = index + 1
	end

	return tList
end

local list1 = { 1, 2, 3 }
local list2 = { 4, 5, 6 }
list2 = insert_all(list1, 4, list2)
for k, v in ipairs(list2) do
	print("[" .. k .. "]" .. " " .. v)
end
