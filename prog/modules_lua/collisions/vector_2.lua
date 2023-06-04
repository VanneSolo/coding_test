class "Vector_2" {
  new = function(self, x, y)
    local mt = getmetatable(self)
    
    function mt:__add(other)
      return self:add(other)
    end
    function mt:__sub(other)
      return self:subtract(other)
    end
    function mt:__mul(other)
      return self:multiplyGeneric(other)
    end
    function mt:__div(other)
      return self:divideGeneric(other)
    end
    function mt:__unm()
      return self:negate()
    end
    function mt:__tostring()
      return "Vector_2: "..self.x..", "..self.y
    end
    
    self.x = x
    self.y = y
  end,
  
  add = function(self, other)
    return new "Vector_2" (self.x+other.x, self.y+other.y)
  end,
  
  subtract = function(self, other)
    return self:add(-other)
  end,
  
  multiplyVector = function(self, other)
    return new "Vector_2" (self.x*other.x, self.y*other.y)
  end,
  
  multiplyScalar = function(self, other)
    return new "Vector_2" (self.x*other, self.y*other)
  end,
  
  multiplyGeneric = function(self, other)
    if type(other) == "number" then
      return self:multiplyScalar(other)
    end
    return self:multiplyVector(other)
  end,
  
  divideVector = function(self, other)
    return new "Vector_2" (self.x/other.x, self.y/other.y)
  end,
  
  divideScalar = function(self, other)
    return new "Vector_2" (self.x/other, self.y/other)
  end,
  
  divideGeneric = function(self, other)
    if type(other) == "number" then
      return self:divideScalar(other)
    end
    return self:divideVector(other)
  end,
  
  magnitude = function(self)
    return math.sqrt(self.x^2 + self.y^2)
  end,
  
  unit = function(self)
    return self/self:magnitude()
  end,
  
  dot = function(self, other)
    local temp = self*other
    return temp.x+temp.y
  end,
  
  negate = function(self)
    return new "Vector_2" (-self.x, -self.y)
  end,
}