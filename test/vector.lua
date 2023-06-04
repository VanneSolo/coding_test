-- Librairie de fonctions sur les vecteurs. On défini un première
-- table qui contient les fonction. On passe en paramètres un x 
-- et un y qui seront les coordonnées du vecteur.

function Vector(pX, pY)
  local vector = {}
  vector.x = pX
  vector.y = pY
  
  -- Les fonctions set/get x/y permettent de définir/récupérer
  -- les valeurs x ou y du vecteur.
  function vector.Set_X(pValue)
    vector.x = pValue
  end
  
  function vector.Set_Y(pValue)
    vector.y = pValue
  end
  
  function vector.Get_X()
    return vector.x
  end
  
  function vector.Get_Y()
    return vector.y
  end
  
  -- On crée une seconde table qui va contenir les fonctions
  -- qui vont permettre d'effectuer des opérations sur deux
  -- vecteurs: addition, soustraction, multiplication, division, 
  -- oppposée. Ensuite on défini cette table comme metatable
  -- et on l'associe avec la table vecteur.
  local vec_opp = {}
  
  function vec_opp.__add(vec1, vec2)
    local add = Vector(0, 0)
    add.x = vec1.x+vec2.x
    add.y = vec1.y+vec2.y
    return add
  end
  
  function vec_opp.__sub(vec1, vec2)
    local subtract = Vector(0, 0)
    subtract.x = vec1.x-vec2.x
    subtract.y = vec1.y-vec2.y
    return subtract
  end
  
  function vec_opp.__mul(vec, k)
    local mul = Vector(0, 0)
    mul.x = vec.x*k
    mul.y = vec.y*k
    return mul
  end
  
  function vec_opp.__div(vec, k)
    local div = Vector(0, 0)
    div.x = vec.x/k
    div.y = vec.y/k
    return div
  end
  
  function vec_opp.__unm(vec)
    local oppose = Vector(-vec.x, -vec.y)
    return oppose
  end
  
  setmetatable(vector, vec_opp)
  
  -- Ici on répète les fonctions d'opération, mais sur un seul
  -- vecteurs. Par exemple pour l'addition, on n'additionne pas
  -- deux vecteurs dans un troisième vecteur mais on transforme 
  -- le veceteur 1 en lui ajoutant la valeur du vecteur 2.
  function vector.Add_To(vec2)
    vector.x = vector.x + vec2.x
    vector.y = vector.y + vec2.y
  end
  
  function vector.Subtract_To(vec2)
    vector.x = vector.x - vec2.x
    vector.y = vector.y - vec2.y
  end
  
  function vector.Multiply_By(k)
    vector.x = vector.x*k
    vector.y = vector.y*k
  end
  
  function vector.Divide_By(k)
    vector.x = vector.x/k
    vector.y = vector.y/k
  end
  
  -- Fonctions qui permettent de définir/récupérer l'angle
  -- d'un vecteur par rapport à l'horizontale.
  function vector.Set_Angle(pAngle)
    local longueur = vector.Get_Norme()
    vector.x = math.cos(pAngle)*longueur
    vector.y = math.sin(pAngle)*longueur
  end
  
  function vector.Get_Angle()
    return math.atan2(vector.y, vector.x)
  end
  
  -- Fonctions qui permettent de définir/récupérer la
  -- longueur d'un vecteur.
  function vector.Set_Norme(pLongueur)
    local angle = vector.Get_Angle()
    vector.x = math.cos(angle)*pLongueur
    vector.y = math.sin(angle)*pLongueur
  end
  
  function vector.Get_Norme()
    return math.sqrt(vector.x^2 + vector.y^2)
  end
  
  -- Fonctions qui donne à un vecteur une longueur de 1
  -- tout en conservant son sens et sa dimension.
  function vector.normalize()
    local N = vector.Get_Norme()
    vector.x = vector.x/N
    vector.y = vector.y/N
  end
  
  return vector
end