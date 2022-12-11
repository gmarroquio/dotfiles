local isNumber = function (c)
  if (tonumber(c)) then return true end
  return false
end

local hasNumber = function (str)
  for i = 1, #str do
    if (isNumber(str:sub(i, i))) then return true end
    i = i + 1
  end
  return false
end

local getNumberInside = function (str, start)
  local firstIndex = start
  local lastIndex = start

  while (not isNumber(str:sub(firstIndex, firstIndex))) do
    firstIndex = firstIndex + 1
  end
  lastIndex = firstIndex
  while (isNumber(str:sub(lastIndex, lastIndex))) do
    lastIndex = lastIndex + 1
  end
  return tonumber(str:sub(firstIndex, lastIndex - 1))
end

local sortWithNumber = function (str1, str2)
  local index = 1;
  while (index <= #str1 and index <= #str2) do
    local c1 = str1:sub(index, index)
    local c2 = str2:sub(index, index)
    if(isNumber(c1) and isNumber(c1)) then
      local n1 = getNumberInside(str1, index)
      local n2 = getNumberInside(str2, index)
      if(n1 ~= n2) then
        return n1 < n2
      end
    end
    if(c1 ~= c2) then
      return str1 < str2
    end
    index = index + 1
  end
  return str1 < str2;
end

local sort_by = function(nodes)
  table.sort(nodes, function(a, b)
    if(a.type ~= b.type) then
      return a.type < b.type
    end
    if(hasNumber(a.name) and hasNumber(b.name)) then
      return sortWithNumber(a.name, b.name)
    end
    return a.name < b.name
  end)
end

return sort_by
