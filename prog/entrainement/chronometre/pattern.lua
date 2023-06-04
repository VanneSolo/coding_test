require "util"

function Test_Init(pStart, pChrono)
  haut = Chrono(pStart, function() Haut(box, box.speed) end)
  gauche = Chrono(0.5, function() Gauche(box, box.speed) end)
  bas = Chrono(1.5, function() Bas(box, box.speed) end)
  droite = Chrono(2.5, function() Droite(box, box.speed) end)
  haut2 = Chrono(4.5, function() Haut(box, box.speed) end)
  gauche2 = Chrono(5.5, function() Gauche(box, box.speed) end)
  bas2 = Chrono(6.5, function() Bas(box, box.speed) end)
  stop_test = Chrono(pChrono, function() Stop(box) end)
end

function Test_Update(dt)
  if not haut.is_Expired() then
    haut.update(dt)
  end
  if not gauche.is_Expired() then
    gauche.update(dt)
  end
  if not bas.is_Expired() then
    bas.update(dt)
  end
  if not droite.is_Expired() then
    droite.update(dt)
  end
  if not haut2.is_Expired() then
    haut2.update(dt)
  end
  if not gauche2.is_Expired() then
    gauche2.update(dt)
  end
  if not bas2.is_Expired() then
    bas2.update(dt)
  end
  if not stop_test.is_Expired() then
    stop_test.update(dt)
  end
end

function Grand_Huit_Init(pStart, pChrono)
  gh_haut_gauche = Chrono(pStart, function() Haut_Gauche(box, box.speed) end)
  gh_bas_gauche = Chrono(0.5, function() Bas_Gauche(box, box.speed) end)
  gh_haut_gauche2 = Chrono(1.5, function() Haut_Gauche(box, box.speed) end)
  gh_haut_droite = Chrono(2, function() Haut_Droite(box, box.speed) end)
  gh_bas_droite = Chrono(2.5, function() Bas_Droite(box, box.speed) end)
  gh_haut_droite2 = Chrono(3.5, function() Haut_Droite(box, box.speed) end)
  gh_stop_gh = Chrono(pChrono, function() Stop(box) end)
end

function Grand_Huit_Update(dt)
  if not gh_haut_gauche.is_Expired() then
    gh_haut_gauche.update(dt)
  end
  if not gh_bas_gauche.is_Expired() then
    gh_bas_gauche.update(dt)
  end
  if not gh_haut_gauche2.is_Expired() then
    gh_haut_gauche2.update(dt)
  end
  if not gh_haut_droite.is_Expired() then
    gh_haut_droite.update(dt)
  end
  if not gh_bas_droite.is_Expired() then
    gh_bas_droite.update(dt)
  end
  if not gh_haut_droite2.is_Expired() then
    gh_haut_droite2.update(dt)
  end
  if not gh_stop_gh.is_Expired() then
    gh_stop_gh.update(dt)
  end
end
