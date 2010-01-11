
p = function(string,y)
  y = y or 100
  love.graphics.printf(string, 0, y, WIDTH, "center")
end

findOne = function(table, predicate)
  for k,v in pairs(table) do
    if predicate(v) then return v end
  end
  return nil
end

findAll = function(object, predicate)
  local t = {}
  for k,v in pairs(table) do
    if predicate(v) then table.insert(t, v) end
  end
  return t
end

printAll = function(object, name)
  print(name .. ": " .. tostring(object))
  for k,v in pairs(object) do
    print(name .. ": " .. tostring(k) .. ": " .. tostring(v))
  end
end

