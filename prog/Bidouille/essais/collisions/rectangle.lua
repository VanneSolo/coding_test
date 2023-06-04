class "Rectangle" "Polygon" {
  new = function(self, topLeft, size)
    local mt = getmetatable(self)
    function mt:__tostring()
			return "Rect:TopLeft:"..self.topLeft.."Size:"..self.size
		end
    
    self.verticies = {
      topLeft,
      topLeft + new "Vector_2"(size.x, 0),
      topLeft + new "Vector_2"(size.x, size.y),
      topLeft + new "Vector_2"(0, size.y),
    }
    self.mainPoint = topLeft
    self.size = size
  end,
  
  getVerticies = function(self)
    local _verts = {}
    for i,v in pairs(self.verticies) do
      _verts[i] = v - new "Vector_2"(self.size.x/2, self.size.y/2)
    end
    return _verts
  end
  
  
}