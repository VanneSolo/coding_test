function Milieu(xA, yA, xB, yB)
  local xI = (xA+xB)/2
  local yI = (yA+yB)/2
  return xI, yI
end

function Distance(xA, yA, xB, yB)
  return math.sqrt((xB-xA)^2 + (yB-yA)^2)
end

function Distance_Manhattan(xA, yA, xB, yB)
  return math.abs(xB-xA) + math.abs(yB-yA)
end

function Distance_K(a, b, xA, yA, xB, yB, k)
  return ((a^k)*math.abs(xB-xA)^k + (b^k)*math.abs(yB-yA)^k)^(1/k)
end

function Distance_Infinie(a, b, xA, yA, xB, yB)
  return math.max(a*math.abs(xB-xA), b*math.abs(yB-yA))
end

function Tween_Power(k, t0, t1, pStart, pEnd)
  local C = pEnd-pStart
  return C*math.pow(t0/t1, k)+pStart
end

function Arc_Tan_2(pY, pX)
  if pX == 0 then
    if pY < 0 then
      return -pi/2
    else
      return pi/2
    end
  end
  if pX > 0 then
    return arc_tan(pY/pX)
  end
  if pX < 0 then
    return pi + arc_tan(pY/pX)
  end
end

-- Normalize une valeur d'une échelle x à y vers une échelle de 0 à 1.
function Norm_Number(pValue, pMin, pMax)
  return (pValue-pMin)/(pMax-pMin)
end

-- Interpolation linéaire.
function Lerp(norm , min, max)
  return (max-min)*norm + min
end

-- Répercuter proportionnellement une valeur depuis une distance vers une autre.
function Map(p_value, p_source_min, p_source_max, p_destin_min, p_destin_max)
  return Lerp(Norm_Number(p_value, p_source_min, p_source_max), p_destin_min, p_destin_max)
end

-- Clamping. cloisonner une valeur sur une échelle donnée.
function Clamp(p_value, p_min, p_max)
  return math.min(math.max(p_value, p_min), p_max)
end

-- Vérifie la collision entre un point et un cercle.
function Cursor_Circle_Collision(x1, y1, x2, y2, p_rayon)
  if Distance(x1, y1, x2, y2) <= p_rayon then
    return true
  end
  return false
end