class "Polygon" {
  new = function(self, verticies, size)
    local mt = getmetatable(self)
    function mt:__tostring()
			return "Polygon:Sides:"..#verticies
		end
    self.verticies = verticies
    self.mainPoint = verticies[1]
    self.size = size
  end,
  
  getVerticies = function(self)
    local _verts = {}
    for i,v in pairs(self.verticies) do
      _verts[i] = v
    end
    return _verts
  end,
  
  getRotatedVerticies = function(self, r)
    local verts = self:getVerticies()
    for i=1, #self.verticies do
      verts[i] = (new "Vector_2"((verts[i]-self.mainPoint).x*math.cos(r) - (verts[i]-self.mainPoint).y*math.sin(r), (verts[i]-self.mainPoint).x*math.sin(r) + (verts[i]-self.mainPoint).y*math.cos(r))) + self.mainPoint
    end
    return verts
  end,
  
  projectRotatedAlongAxis = function(self, r, axis)
    axis = axis:unit()
    local verts = self:getRotatedVerticies(r)
    local min, max = math.huge, 0
    for i,v in pairs(verts) do
      local valeur = v:dot(axis)
      if valeur < min then
        min = valeur
      end
      if valeur > max then
        max = valeur
      end
    end
    return min, max
  end,
  
  getRotatedNormals = function(self, r)
    local verts = self:getRotatedVerticies(r)
    local normals = {}
    for i=1, #self.verticies do
      local vert_1 = verts[i]
      local vert_2 = verts[i%#self.verticies + 1]
      local face = vert_2 - vert_1
      normals[i] = new "Vector_2"(-face.y, face.x)
    end
    return normals
  end,
  
  collides = function(self, other, selfr, otherr)
    for i,v in pairs(self:getRotatedNormals(selfr)) do
      local min_A, max_A = self:projectRotatedAlongAxis(selfr, v)
      local min_B, max_B = other:projectRotatedAlongAxis(otherr, v)
      if not (max_A>min_B and max_B>min_A) then
        return false
      end
    end
    for i,v in pairs(other:getRotatedNormals(otherr)) do
      local min_A, max_A = self:projectRotatedAlongAxis(selfr, v)
      local min_B, max_B = other:projectRotatedAlongAxis(otherr, v)
      if not (max_A>min_B and max_B>min_A) then
        return false
      end
    end
    return true
  end,
  
  Draw_Polygone = function(self, pRayon)
    local verts = self:getRotatedVerticies(pRayon)
    local raw_verts = {}
    for i,v in pairs(verts) do
      raw_verts[#raw_verts+1] = verts[i].x
      raw_verts[#raw_verts+1] = verts[i].y
    end
    love.graphics.polygon("line", raw_verts)
  end
  
}