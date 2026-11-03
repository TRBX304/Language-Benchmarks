local bit_lib = require("bit")
local band, rshift = bit_lib.band, bit_lib.rshift

local function sieve(n, reps)
  local total = 0
  for _ = 1, reps do
    local isComp = {}
    for i = 0, n do isComp[i] = false end
    local cnt = 0
    for i = 2, n do
      if not isComp[i] then
        cnt = cnt + 1
        for j = i * i, n, i do isComp[j] = true end
      end
    end
    total = total + cnt
  end
  return total
end

local function bitsearch(n)
  local w, sum = {}, 0
  for i = 0, n - 1 do w[i] = (i * 7919 + 13) % 1000 + 1; sum = sum + w[i] end
  local target = math.floor(sum / 2)
  local cnt = 0
  for mask = 0, 2 ^ n - 1 do
    local s = 0
    for i = 0, n - 1 do
      if band(rshift(mask, i), 1) == 1 then s = s + w[i] end
    end
    if s == target then cnt = cnt + 1 end
  end
  return cnt
end

local function eq(n)
  local k = n * n
  local cnt = 0
  for x = 0, n do
    for y = 0, n do
      for z = 0, n do
        if x * x + y * y + z * z == k then cnt = cnt + 1 end
      end
    end
  end
  return cnt
end

local function mat(n)
  local a, b, c = {}, {}, {}
  for i = 1, n do
    a[i], b[i], c[i] = {}, {}, {}
    for j = 1, n do
      a[i][j] = ((i - 1) * (j - 1) % 7 + 1) / 8
      b[i][j] = ((i - 1 + j - 1) % 5 + 1) / 4
      c[i][j] = 0
    end
  end
  for i = 1, n do
    for j = 1, n do
      local s = 0
      for k = 1, n do s = s + a[i][k] * b[k][j] end
      c[i][j] = s
    end
  end
  local total = 0
  for i = 1, n do for j = 1, n do total = total + c[i][j] end end
  return total * 32
end

local ev, p = arg[1], tonumber(arg[2])
local t = os.clock()
local r
if ev == "sieve" then r = sieve(10000000, p) elseif ev == "bit" then r = bitsearch(p) elseif ev == "mat" then r = mat(p) else r = eq(p) end
print(string.format("luajit %s %d result=%d time=%.3fs", ev, p, r, os.clock() - t))
