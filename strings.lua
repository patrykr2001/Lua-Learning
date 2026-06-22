xml = [===[
<![CDATA[
  Hello world
]]>
]===]

print(xml)

function insert(a, index, b)
	return a:sub(0, index - 1) .. b .. a:sub(index)
end

function insertUTF8(a, index, b)
	local bytePos
	if index <= 1 then
		bytePos = 1
	else
		bytePos = utf8.offset(a, index) or (#a + 1)
	end
	return a:sub(1, bytePos - 1) .. b .. a:sub(bytePos)
end

print(insert("hello world", 1, "start: "))
print(insert("hello world", 7, "small "))

print(insertUTF8("hello world", 1, "start: "))
print(insertUTF8("hello world", 7, "small "))
