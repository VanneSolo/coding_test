function NewVector(pX, pY)
  v = {}
  v.x = pX
  v.y = pY
  
  VectorMT = {}
  
  function VectorMT.__add(v1, v2)
    local somme = NewVector(0, 0)
    somme.x = v1.x + v2.x
    somme.y = v1.y + v2.y
    return somme
  end
  
  function VectorMT.__sub(v1, v2)
    local diff = NewVector(0, 0)
    diff.x = v1.x - v2.x
    diff.y = v1.y - v2.y
    return diff
  end
  
  function VectorMT.__mul(k, v)
    local prod = NewVector(0, 0)
    prod.x = k * v.x
    prod.y = k * v.y
    return prod
  end
  
  function VectorMT.__unm(v)
    local opp = NewVector(-v.x, -v.y)
    return opp
  end
  
  setmetatable(v, VectorMT)
  
  function v.norm()
    return math.sqrt(v.x^2 + v.y^2)
  end
  
  function v.normalize()
    local N = v.norm()
    v.x = v.x / N
    v.y = v.y / N
  end
  
  return v
end