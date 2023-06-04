local classes = { base = {className = "base", new = function() end} }

local function Add_Class(name, tab, base)
  tab.className = name
  tab.super = base.className
  classes[name] = setmetatable(tab, {__index=base})
end

function class(name)
  return function(_1)
    if type(_1) == "table" then
      return Add_Class(name, _1, classes.base)
    else
      return function(_2)
        return Add_Class(name, _2, assert(classes[_1], "No such class!"))
      end
    end
  end
end

function new(name)
  local obj = {}
  setmetatable( obj, {__index = assert(classes[name], "No such class!")} )
  return function(...)
    obj:new(...)
    return obj
  end
end

return class, new