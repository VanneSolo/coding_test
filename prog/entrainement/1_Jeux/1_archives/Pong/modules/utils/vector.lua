--[[

	importer ma librairie de vecteurs.

]]

--[[

  MODULE POUR CREER DES VECTEURS ET FAIRES DES OPERATIONS DESSUS.

]]

function Vector(px, py)
  --[[
  
    CREATION DU VECTEUR
  
  ]]
  local vector = {}
  vector.x = px
  vector.y = py
  
  --[[
  
    DEFINITION ET RECUPERATION DES COMPOSANTS DU VECTEUR.
  
  ]]
  
  function vector.Set_X(k)
    vector.x = k
  end
  
  function vector.Set_Y(k)
    vector.y = k
  end
  
  function vector.Get_X()
    return vector.x
  end
  
  function vector.Get_Y()
    return vector.y
  end
  
  --[[
  
    METATABLE QUI PERMET DE FAIRE DES OPERATIONS DE BASE SUR DEUX VECTEURS.
  
  ]]
  
  local vec_opp = {}
  
  function vec_opp.__add(vec1, vec2)
    local add = Vector(0, 0)
    add.x = vec1.x + vec2.x
    add.y = vec1.y + vec2.y
    return add
  end
  
  function vec_opp.__sub(vec1, vec2)
    local subtract = Vector(0, 0)
    subtract.x = vec1.x - vec2.x
    subtract.y = vec1.y - vec2.y
    return subtract
  end
  
  function vec_opp.__mul(vec, k)
    local mul = Vector(0, 0)
    mul.x = vec.x * k
    mul.y = vec.y * k
    return mul
  end
  
  function vec_opp.__div(p1, p2)
    local div = Vector(0, 0)
    if type(p1) == "number" and type(p2) == "table" then
      div.x = p1/p2.x
      div.y = p1/p2.y
    elseif type(p1) == "table" and type(p2) == "number" then
      div.x = p1.x/p2
      div.y = p1.y/p2
    end
    return div
  end
  
  function vec_opp.__unm(vec)
    local oppose = Vector(-vec.x, -vec.y)
    return oppose
  end
  
  setmetatable(vector, vec_opp)
  
  --[[
  
    FONCTIONS QUI PERMETTENT DE MODIFIER LES COMPOSANTES D'UN VECTEUR.
  
  ]]
  
  function vector.Add_To(vec2)
    vector.x = vector.x+vec2.x
    vector.y = vector.y+vec2.y
  end
  
  function vector.Sub(vec2)
    vector.x = vector.x-vec2.x
    vector.y = vector.y-vec2.y
  end
  
  function vector.Multiply_By(k)
    vector.x = vector.x*k
    vector.y = vector.y*k
  end
  
  function vector.Divide_By_K(k)
    vector.x = vector.x/k
    vector.y = vector.y/k
  end
  
  function vector.Divide_K(k)
    vector.x = k/vector.x
    vector.y = k/vector.y
  end
  
  --[[
  
    DEFINITION ET RECUPERATION DE L'ANGLE D'UN VECTEUR.
  
  ]]
  
  function vector.Set_Angle(angle)
    local longueur = vector.Get_Length()
    vector.x = math.cos(angle) * longueur
    vector.y = math.sin(angle) * longueur
  end
  
  function vector.Get_Angle()
    return math.atan2(vector.y, vector.x)
  end
  
  --[[
  
    DEFINITION ET RECUPERATION DE LA LONGUEUR D'UN VECTEUR.
  
  ]]
  
  function vector.Set_Length(longueur)
    local angle = vector.Get_Angle()
    vector.x = math.cos(angle) * longueur
    vector.y = math.sin(angle) * longueur
  end 
  
  function vector.Get_Length()
    return math.sqrt(vector.x*vector.x + vector.y*vector.y)
  end
  
  --[[
  
    NORMALISATION, DOT PRODUCT ET CROSS PRODUCT.
  
  ]]
  
  function vector.Normalize()
    local N = vector.Get_Length()
    vector.x = vector.x/N
    vector.y = vector.y/N
  end
  
  function vector.Dot(vec2)
    return vector.x*vec2.x + vector.y+vec2.y
  end
  
  function vector.Cross(vec2)
    return vector.x*vec2.y - vector.y*vec2.x
  end
  
  return vector
end