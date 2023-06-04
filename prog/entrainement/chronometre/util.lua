--Tiemr

function Chrono(time, callback)
  local expired = false
  local timer = {}
  
  function timer.update(dt)
    if time < 0 then
      expired = true
      callback()
    end
    time = time-dt
    return time
  end
  
  function timer.is_Expired()
    return expired
  end
  
  return timer
end

--Directions

function Haut(pEntite, pVitesse)
  pEntite.vx = 0
  pEntite.vy = -pVitesse
end

function Haut_Droite(pEntite, pVitesse)
  pEntite.vx = pVitesse
  pEntite.vy = -pVitesse
end

function Droite(pEntite, pVitesse)
  pEntite.vx = pVitesse
  pEntite.vy = 0
end

function Bas_Droite(pEntite, pVitesse)
  pEntite.vx = pVitesse
  pEntite.vy = pVitesse
end

function Bas(pEntite, pVitesse)
  pEntite.vx = 0
  pEntite.vy = pVitesse
end

function Bas_Gauche(pEntite, pVitesse)
  pEntite.vx = -pVitesse
  pEntite.vy = pVitesse
end

function Gauche(pEntite, pVitesse)
  pEntite.vx = -pVitesse
  pEntite.vy = 0
end

function Haut_Gauche(pEntite, pVitesse)
  pEntite.vx = -pVitesse
  pEntite.vy = -pVitesse
end

function Stop(pEntite)
  pEntite.vx = 0
  pEntite.vy = 0
end