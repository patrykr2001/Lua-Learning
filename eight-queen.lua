N = 8 -- board size
-- check whether position (n,c) is free from attacks
function isplaceok(a, n, c)
	for i = 1, n - 1 do -- for each queen already placed
		if
			(a[i] == c) -- same column?
			or (a[i] - i == c - n) -- same diagonal?
			or (a[i] + i == c + n)
		then -- same diagonal?
			return false -- place can be attacked
		end
	end
	return true -- no attacks; place is OK
end
-- print a board
function printsolution(a)
	for i = 1, N do -- for each row
		for j = 1, N do -- and for each column
			-- write "X" or "-" plus a space
			io.write(a[i] == j and "X" or "-", " ")
		end
		io.write("\n")
	end
	io.write("\n")
end
-- add to board 'a' all queens from 'n' to 'N'
function addqueen(a, n)
	if n > N then -- all queens have been placed?
		printsolution(a)
	else -- try to place n-th queen
		for c = 1, N do
			if isplaceok(a, n, c) then
				a[n] = c -- place n-th queen at column 'c'
				addqueen(a, n + 1)
			end
		end
	end
end

-- add to board 'a' all queens from 'n' to 'N' and stop after first valid solution
function addqueenfirst(a, n)
	if f then
		return
	elseif n > N then
		f = true
		printsolution(a)
	else
		for c = 1, N do
			if isplaceok(a, n, c) then
				a[n] = c -- place n-th queen at column 'c'
				addqueenfirst(a, n + 1)
			end
		end
	end
end

function isOk(perm)
	local n = #perm
	for col1 = 1, n do
		for col2 = col1 + 1, n do
			if math.abs(perm[col1] - perm[col2]) == math.abs(col1 - col2) then
				return false
			end
		end
	end
	return true
end

function permutations(table, n)
	n = n or #table
	if n == 1 then
		if isOk(table) then
			printsolution(table)
		end
		return
	end
	for i = 1, n do
		permutations(table, n - 1)
		if n % 2 == 0 then
			table[i], table[n] = table[n], table[i]
		else
			table[1], table[n] = table[n], table[1]
		end
	end
end

-- create all permautations of the queens posistions and find valid solutions
function addqueenpermutations(n)
	perm = {}
	for i = 1, n do
		perm[i] = i
	end

	permutations(perm, n)
end

-- run the program
-- addqueen({}, 1)
-- f = false
-- addqueenfirst({}, 1)
addqueenpermutations(N)
