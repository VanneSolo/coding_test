function Vector(pX, pY)
  -- Création du vecteur.
  local vector = {}
  vector.x = pX
  vector.y = pY
  
  -- Définition de la coordonnée x du vecteur.
  function vector.Set_X(value)
    vector.x = value
  end
  
  -- Définition de la coordonnée y du vecteur.
  function vector.Set_Y(value)
    vector.y = value
  end
  
  -- Récupération de la coordonnée x du vecteur.
  function vector.Get_X()
    return vector.x
  end
  
  -- Récupération de la coordonnée y du vecteur.
  function vector.Get_Y()
    return vector.y
  end
  
  local vec_opp = {}
  
  -- Addition de deux vecteurs.
  function vec_opp.__add(vec1, vec2)
    local add = Vector(0, 0)
    add.x = vec1.x+vec2.x
    add.y = vec1.y+vec2.y
    return add
  end
  
  -- Soustraction de deux vecteurs.
  function vec_opp.__sub(vec_1, vec_2)
    local substract = Vector(0, 0)
    substract.x = vec_1.x-vec_2.x
    substract.y = vec_1.y-vec_2.y
    return substract
  end
  
  -- Multiplication d'un vecteur par un scalaire.
  function vec_opp.__mul(vec, k)
    local mul = Vector(0, 0)
    mul.x = vec.x*k
    mul.y = vec.y*k
    return mul
  end
  
  -- Division d'un vecteur par un scalaire.
  function vec_opp.__div(vec, k)
    local div = Vector(0, 0)
    div.x = vec.x/k
    div.y = vec.y/k
    return div
  end
  
  -- Obtention de l'oppposé d'un vecteur.
  function vec_opp.__unm(vec)
    local oppose = Vector(-vec.x, -vec.y)
    return oppose
  end
  
  -- Link de la table vector avec la metatable vec_opp.
  setmetatable(vector, vec_opp)
  
  -- Opérations réalisées sur un vecteur.
  function vector.Add_To(vec2)
    vector.x = vector.x + vec2.x
    vector.y = vector.y + vec2.y
  end
  
  function vector.Subtract_From(vec2)
    vector.x = vector.x - vec2.x
    vector.y = vector.y - vec2.y
  end
  
  function vector.Multiply_By(k)
    vector.x = k*vector.x
    vector.y = k*vector.y
  end
  
  function vector.Divide_By(k)
    vector.x = vector.x / k
    vector.y = vector.y / k
  end
  
  -- Définition de l'angle d'un vecteur.
  function vector.Set_Angle(pAngle)
    local longueur = vector.Get_Norme()
    vector.x = math.cos(pAngle)*longueur
    vector.y = math.sin(pAngle)*longueur
  end
  
  -- Récupération de l(angle d'un vecteur.
  function vector.Get_Angle()
    return math.atan2(vector.y, vector.x)
  end
  
  -- Définition de la norme d'un vecteur.
  function vector.Set_Norme(pLongueur)
    local angle = vector.Get_Angle()
    vector.x = math.cos(angle)*pLongueur
    vector.y = math.sin(angle)*pLongueur
  end
  
  -- Récupération de la norme d'un vecteur.
  function vector.Get_Norme()
    return math.sqrt(vector.x^2 + vector.y^2)
  end
  
  -- Normaliser un vecteur.
  function vector.normalize()
    local N = vector.Get_Norme()
    vector.x = vector.x/N
    vector.y = vector.y/N
  end
  
  return vector
end