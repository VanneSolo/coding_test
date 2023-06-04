io.stdout:setvbuf('no')
if arg[arg] == "-debug" then require("mobdebug").start() end

function lerp(a,b,t) return (1-t)*a + t*b end

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  love.graphics.setPointSize(2)
  
  b_show_p0_p1 = false
  b_show_p1_p2 = false
  b_show_q0_q1 = false
  b_show_p0 = false
  b_show_p1 = false
  b_show_p2 = false
  b_show_q0 = false
  b_show_q1 = false
  b_show_b = false
  anim_courbe = false
  
  p0 = {x = 10, y = hauteur/2}
  p1 = {x = 300, y = 10}
  p2 = {x = largeur-10, y = hauteur/2}
  
  q0 = {x = p0.x, y = p0.y}
  q1 = {x = p1.x, y = p1.y}
  
  b = {x = q0.x, y = q0.y}
  
  liste_points = {}
  
  t = 0
  
  Calcule_Bezier()
end

function love.update(dt)
  if anim_courbe == true then
    t = t + dt/4
    if t > 1 then
      liste_points = {}
      t = 0
    end
    
    q0.x = lerp(p0.x, p1.x, t)
    q0.y = lerp(p0.y, p1.y, t)
    
    q1.x = lerp(p1.x, p2.x, t)
    q1.y = lerp(p1.y, p2.y, t)
    
    b.x = lerp(q0.x, q1.x, t)
    b.y = lerp(q0.y, q1.y, t)
    table.insert(liste_points, {x = b.x, y = b.y})
  end
end

function love.draw()
  love.graphics.setColor(0.8, 0.8, 0.8)
  if b_show_p0 == true then
    love.graphics.circle("fill", p0.x, p0.y, 3)
  end
  if b_show_p1 == true then
    love.graphics.circle("fill", p1.x, p1.y, 3)
  end
  if b_show_p2 == true then
    love.graphics.circle("fill", p2.x, p2.y, 3)
  end
  
  if b_show_p0_p1 == true then
    love.graphics.line(p0.x, p0.y, p1.x, p1.y)
  end
  if b_show_p1_p2 == true then
    love.graphics.line(p1.x, p1.y, p2.x, p2.y)
  end
  
  love.graphics.setColor(0, 1, 0)
  if b_show_q0 == true then
    love.graphics.circle("fill", q0.x, q0.y, 3)
  end
  if b_show_q1 == true then
    love.graphics.circle("fill", q1.x, q1.y, 3)
  end
  
  
  if b_show_q0_q1 == true then
    love.graphics.line(q0.x, q0.y, q1.x, q1.y)
  end
  
  love.graphics.setColor(1, 0, 0)
  for i=1,#liste_points do
    b = liste_points[i]
    love.graphics.points(b.x, b.y)
  end
  
  love.graphics.setColor(0, 0, 1)
  if b_show_b == true then
    love.graphics.circle("fill", b.x, b.y, 3)
  end
  
  love.graphics.setColor(1, 1, 1)
end

function love.keypressed(key)
  if key == "kp1" then
    b_show_p0_p1 = not b_show_p0_p1
  end
  if key == "kp2" then
    b_show_p1_p2 = not b_show_p1_p2
  end
  if key == "kp3" then
    b_show_q0_q1 = not b_show_q0_q1
  end
  if key == "kp4" then
    b_show_p0 = not b_show_p0
  end
  if key == "kp5" then
    b_show_p1 = not b_show_p1
  end
  if key == "kp6" then
    b_show_p2 = not b_show_p2
  end
  if key == "kp7" then
    b_show_q0 = not b_show_q0
  end
  if key == "kp8" then
    b_show_q1 = not b_show_q1
  end
  if key == "kp9" then
    b_show_b = not b_show_b
  end
  if key == "kp0" then
    anim_courbe = not anim_courbe
  end
end

function love.mousepressed(x, y, button)
  
end

function Calcule_Bezier()
  liste_points = {}
  
  for t=0,1,0.01 do
    q0.x = lerp(p0.x, p1.x, t)
    q0.y = lerp(p0.y, p1.y, t)
    
    q1.x = lerp(p1.x, p2.x, t)
    q1.y = lerp(p1.y, p2.y, t)
    
    b.x = lerp(q0.x, q1.x, t)
    b.y = lerp(q0.y, q1.y, t)
    table.insert(liste_points, {x = b.x, y = b.y})
  end
end