--[[

  FONCTIONS QUI CALCULENT DIFFERENTS TYPES DE DISTANCES. LE PREMIER JEU DE FONCTIONS
  PREND EN PARAMETRES DEUX POINTS CODES EN DUR. LE DEUXIEME JEU DE FONCTIONS (A PARTIR 
  DE LA LIGNE 50) PREND EN PARAMETRES DEUX VECTEURS.

]]
function Mid(x1, y1, x2, y2)
  local mid_point = Vector(0, 0)
  mid_point.x = (x1+x2) / 2
  mid_point.y = (y1+y2) / 2
  return mid_point
end

function Dist(x1, y1, x2, y2)
  return math.sqrt( (x2-x1)^2 + (y2-y1)^2 )
end

function Dist_Manhattan(x1, y1, x2, y2)
  return math.abs(x2-x1) + math.abs(y2-y1)
end

function Dist_X(x1, x2)
  return math.abs(x2-x1)
end

function Dist_Y(y1, y2)
  return math.abs(y2-y1)
end

function Dist_K(x1, y1, x2, y2, a, b, k)
  return ( (a^k)*math.abs(x2-x1)^k + (b^k)*math.abs(y2-y1)^k ) ^(1/k)
end

function Dist_Infine(x1, y1, x2, y2, a, b)
  return math.max( a*math.abs(x2-x1), b*math.abs(y2-y1) )
end

function Mid_Vector(vec1, vec2)
  local mid_point = Vector(0, 0)
  mid_point.x = (vec1.x+vec2.x) / 2
  mid_point.y = (vec1.y+vec2.y) / 2
  return mid_point
end

function Dist_Vector(vec1, vec2)
  return math.sqrt( (vec2.x-vec1.x)^2 + (vec2.y-vec1.y)^2 )
end

function Dist_Manhattan_Vector(vec1, vec2)
  return math.abs(vec2.x-vec1.x) + math.abs(vec2.y-vec1.y)
end

function Dist_X_Vector(vec1, vec2)
  return math.abs(vec2.x-vec1.x)
end

function Dist_Y_Vector(vec1, vec2)
  return math.abs(vec2.y-vec1.y)
end

function Dist_K_Vector(vec1, vec2, a, b, k)
  return ( (a^k)*math.abs(vec2.x-vec1.x)^k + (b^k)*math.abs(vec2.y-vec1.y)^k ) ^(1/k)
end

function Dist_Infine_Vector(vec1, vec2, a, b)
  return math.max( a*math.abs(vec2.x-vec1.x), b*math.abs(vec2.y-vec1.y) )
end

--[[

  FONCTIONS DE MISE A L'ECHELLE D'UN NOMBRE.

]]

function Normalize_Number(valeur, minimum, maximum)
  return (valeur-minimum) / (maximum-minimum)
end

function Lerp(norme, minimum, maximum)
  return (maximum-minimum)*norme + minimum
end

function Map(valeur, minimum_1, maximum_1, minimum_2, maximum_2)
  return math_sup.Lerp(math_sup.Normalize_Number(valeur, minimum_1, maximum_1), minimum_2, maximum_2)
end

function Clamp(valeur, minimum, maximum)
  return math.min(math.max(valeur, minimum), maximum)
end

function In_Range(valeur, minimum, maximum)
  if valeur >= math.min(minimum, maximum) and valeur <= math.max(minimum, maximum) then
    return true
  end
  return false
end

--[[

  QUELQUES FONCTIONS DE TRIGONOMETRIE DE BASE.

]]

function Deg_To_Rad(degres)
  return degres/180 * math.pi
end

function Rad_To_Deg(radians)
  return radians*180 / math.pi
end

function Atan_2(x, y)
  if x == 0 then
    if y < 0 then return -math.pi/2 else return math.pi/2 end
  end
  if x > 0 then return math.atan(y/x) end
  if x < 0 then return math.pi + math.atan(y/x) end
end

--[[

  FONCTIONS D'ARRONDIS.

]]

function Round_To_Places(valeur, rang)
  local mult = math.pow(10, rang)
  return math.floor(valeur*mult) / mult
end

function Round_Nearest(valeur, nearest)
  return math.floor(valeur/nearest) * nearest
end

--[[

  FONCTIONS DE RANDOM.

]]

function Random_Range(minimum, maximum)
  return minimum + love.math.random()*(maximum-minimum)
end

function Random_Integer(minimum, maximum)
  return math.floor( minimum + love.math.random()*(maximum-minimum+1) )
end

function Random_Dist(minimum, maximum, iterations)
  local total = 1
  for i=1,iterations do
    total = total + math_sup.Random_Range(minimum, maximum)
  end
  return total/iterations
end

--[[

  FONCTION DE TWEEN ET EASING.

]]

function Tween_Power(k, tps_depart, tps_fin, debut, arrivee)
  local C = arrivee-debut
  return C*math.pow(tps_depart/tps_fin, k) + debut
end