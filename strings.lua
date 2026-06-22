local xml = [===[
<![CDATA[
  Hello world
]]>
]===]

print(xml)

local function insert(a, index, b)
	return a:sub(0, index - 1) .. b .. a:sub(index)
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small "))

local function insertUTF8(a, index, b)
	local bytePos
	if index <= 1 then
		bytePos = 1
	else
		bytePos = utf8.offset(a, index) or (#a + 1)
	end
	return a:sub(1, bytePos - 1) .. b .. a:sub(bytePos)
end

print(insertUTF8("ação", 5, "!"))

local function remove(a, pos, len)
	return a:sub(0, pos - 1) .. a:sub(pos + len)
end

print(remove("hello world", 7, 4))

local function removeUTF8(a, pos, len)
	return a:sub(0, utf8.offset(a, pos - 1)) .. a:sub(utf8.offset(a, pos + len))
end

print(removeUTF8("ação", 2, 2))

local function ispali(a)
	return a == a:reverse()
end

print(ispali("step on no pets"))
print(ispali("banana"))

local function ispaliCleaned(a)
	local cleaned = a:lower():gsub("[^%w]", "")
	return cleaned == cleaned:reverse()
end

print(ispaliCleaned("step on no pets"))
print(ispaliCleaned("banana"))
