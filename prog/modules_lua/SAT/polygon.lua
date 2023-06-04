class "Polygon" {
	new = function(self, verticies,size)
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
			_verts[i]=v -- - new "Vector2" (size.x/2,size.y/2)
		end
		return _verts
	end,
	getRotatedVerticies = function(self,r)
		local verts = self:getVerticies()
		for i=1,#self.verticies do
			verts[i] = (new "Vector2" ((verts[i]-self.mainPoint).x*math.cos(r) - (verts[i]-self.mainPoint).y*math.sin(r), (verts[i]-self.mainPoint).x*math.sin(r)+(verts[i]-self.mainPoint).y*math.cos(r))) + self.mainPoint
		end
		return verts
	end,
	projectRotatedAlongAxis = function(self,r,axis)
		axis = axis:unit()
		local verts = self:getRotatedVerticies(r)
		local min,max = math.huge, 0
		for i,v in pairs(verts) do
			local val = v:dot(axis)
			if val < min then
				min = val
			end
			if val > max then
				max = val
			end
		end
		return min,max
	end,
	getRotatedNormals = function(self,r)
		local verts = self:getRotatedVerticies(r)
		local normals = {}
		for i = 1,#self.verticies do
			local vert1 = verts[i]
			local vert2 = verts[i%#self.verticies+1]
			local face = vert2 - vert1
			normals[i] = new "Vector2" (-face.y,face.x)
		end
		return normals
	end,
	collides = function(self,other,selfr,otherr)
		for i,v in pairs(self:getRotatedNormals(selfr)) do
			local minA,maxA = self:projectRotatedAlongAxis(selfr,v)
			local minB,maxB = other:projectRotatedAlongAxis(otherr,v)
			if not (maxA>minB and maxB>minA) then
				return false
			end
		end
		for i,v in pairs(other:getRotatedNormals(otherr)) do
			local minA,maxA = self:projectRotatedAlongAxis(selfr,v)
			local minB,maxB = other:projectRotatedAlongAxis(otherr,v)
			if not (maxA>minB and maxB>minA) then
				return false
			end
		end
		return true
	end
	--[[draw = function(self,r)
		local verts = self:getRotatedVerticies(r)
		local rawVerts = {}
		for i,v in pairs(verts) do
			rawVerts[#rawVerts+1] = verts[i].x
			rawVerts[#rawVerts+1] = verts[i].y
		end
		love.graphics.polygon("fill",rawVerts)
	end]]
}