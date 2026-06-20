numerals = {
	0.0e12,
	-- .e12,
	--  0.0e,
	0x12,
	--  0xABFG,
	0xA,
	--  FFFF,
	0xFFFFFFFF,
	--  0x,
	0x1P10,
	0.1e1,
	0x0.1p1,
}

-- for i = 0, #numerals do
-- 	print(numerals[i])
-- end

for i = -10, 10 do
	print(i, i % 3)
end

print(2 ^ 3 ^ 4)
print(2 ^ -3 ^ 4)
