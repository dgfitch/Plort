isA = function(object, class)
  if object == nil then return false end
  if object == class or (object.class and object.class == class) then return true end
  return false
end

kindOf = function(object, thing)
  if object == nil then return false end
  if object.isA(thing) then return true end
  if object.mixins then
    for k,v in ipairs(object.mixins) do
      if v == thing then return true end
    end
  end
  return false
end

mixin = function(destination, source, opts)
  destination.mixins = destination.mixins or {}
  table.insert(destination.mixins, source)
  destination.isA = function (self, thing) return isA(self, thing) end
  destination.kindOf = function (self, thing) return kindOf(self, thing) end
  for k,v in pairs(source) do
    if not destination[k] then destination[k] = v end
  end
  if opts then
    for k,v in pairs(opts) do
      destination[k] = v
    end
  end
end

