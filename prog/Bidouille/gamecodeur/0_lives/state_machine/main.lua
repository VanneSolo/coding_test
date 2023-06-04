io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  planete = {}
  planete.x = 50
  planete.y = 50
  planete.r = 50
  planete.vx = 0
  planete.vy = 0
  
  enum_planete = {"vers_droite", "vers_bas", "vers_gauche", "vers_haut"}
  current_state = "vers_droite"
end

function love.update(dt)
  if current_state == "vers_droite" then
    planete.vx = 4
    planete.vy = 0
    if planete.x+planete.r >= largeur then
      current_state = "vers_bas"
    end
  elseif current_state == "vers_bas" then
    planete.vx = 0
    planete.vy = 4
    if planete.y+planete.r >= hauteur then
      current_state = "vers_gauche"
    end
  elseif current_state == "vers_gauche" then
    planete.vx = -4
    planete.vy = 0
    if planete.x-planete.r <= 0 then
      current_state = "vers_haut"
    end
  elseif current_state == "vers_haut" then
    planete.vx = 0
    planete.vy = -4
    if planete.y-planete.r <= 0 then
      current_state = "vers_droite"
    end  
  end
  planete.x = planete.x + planete.vx
  planete.y = planete.y + planete.vy
end

function love.draw()
  love.graphics.circle("fill", planete.x, planete.y, planete.r)
end