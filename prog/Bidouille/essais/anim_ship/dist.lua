function DistanceK(x1, y1, x2, y2, pk, pa, pb)
  return( math.abs( pa*(x2-x1))^pk + math.abs(pb*(y2-y1))^pk )^(1/pk)
end

function DistanceInfini(x1, y1, x2, y2, pa, pb)
  return math.max( math.abs(pa*(x2-x1)) + math.abs(pb*(y2-y1)) )
end

function Distance(x1, y1, x2, y2, pk, pa, pb)
  if pk > 0 then
    return DistanceK(x1, y1, x2, y2, pk, pa, pb)
  else
    return DistanceInfini(x1, y1, x2, y2, pa, pb)
  end
end

function DistanceSimple(p1, p2)
  dist_p1_p2 = math.abs(p1 - p2)
  return dist_p1_p2
end

function Milieu(x1, y1, x2, y2)
  xMid = (x2 + x1) / 2
  yMid = (y2 + y1) / 2
  return xMid, yMid
end

function AddVectors(ax, ay, bx, by, cx, cy)
    point_origine = NewVector(ax, ay)
    
    dist_h_vec_1 = DistanceSimple(ax, bx)
    dist_v_vec_1 = DistanceSimple(ay, by)
    dist_h_vec_2 = DistanceSimple(cx, bx)
    dist_v_vec_2 = DistanceSimple(cy, by)
    
    long_h_vect_1_2 = dist_h_vec_1 + dist_h_vec_2
    long_v_vect_1_2 = dist_v_vec_1 + dist_v_vec_2
    
    vect_a_c = NewVector(long_h_vect_1_2, long_v_vect_1_2)
    
    vect_final = NewVector(point_origine.x + vect_a_c.x, point_origine.y + vect_a_c.y)
    return vect_final
  end