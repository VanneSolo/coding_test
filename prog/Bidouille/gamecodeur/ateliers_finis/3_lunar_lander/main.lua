--[[
Dans un tableau, on stocke la position (x, y) par défaut de la fusée. Ensuite la valeur par
défaur de l'angle de rotation de la fusée. Si on a besoin de faire tourner une image, il 
faut bien penser à orienter son sommet vers la droite, car c'est dans cette direction qu'est
situé l'origine pour mesurer les angles. Après on défini les valeur par défaut pour la
vélocité (x, y) et la vitesse. Enfin on défini un boléen pour l'allumage du moteur et on
appelle les images.
]]--
lander = {}

lander.x = 0
lander.y = 0
lander.angle = 270
lander.vx = 0
lander.vy = 0
lander.speed = 3
lander.flammeOn = false
lander.fusee_img = love.graphics.newImage("fusee.png")
lander.flamme_img = love.graphics.newImage("flamme.png")

--[[
Dans le load, on récupère les dimensions de la fenêtre et on défini la position de la 
fusée au milieu de l'écran.
]]--

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  lander.x = largeur/2
  lander.y = hauteur/2
end

--[[
Dans l'update, on s'occupe du contrôle des touches. Si on veut aller à gauche, on soustrait
une valeur à l'angle, si on veut aller à droite on ajoute une valeur à l'angle. On remet de
force l'angle à 0 si celui-ci devient supérieur à 360° (et inversément à 360° si sa valeur
devient inférieuré à 0) pour éviter qu'il atteigne des valeurs farfelues.

Ensuite, on s'occupe de la partie propulsion de la fusée. Quand on appuie sur la touche 
haut, premièrement on passe le booléen qui contrôle l'allumage du moteur sur true. 
Deuxièmement on crée des forces (x, y) qui vont s'appliquer à la vélocité pour à la fin
propulser la fusée. Pour se faire on convertit la valeur de l'angle en radian (Lôve utilise
cette unité pour les angles et pas les degrès). Pour obtenir la force horizontale, on
récupère le cosinus de l'angle qu'on multiplie par la vitesse de la fusée et par le delta
time. Presque la même opération pour la force verticale, sauf qu'on récupère la valeur du 
sinus de l'angle. Puis on ajoute la force à la vélocité correspondante. Pour finir on 
indique que si la touche est relachée le booléen repasse sur false.

Maintenant qu'on s'est occupé des contrôles, on applique une valeur à la vélocité verticale
pour créer de la gravité. 

Ensuite on cape la valeur de la vélocité pour éviter que le vaisseau accélère 
continuellement et devienne incontrôlable. On récupère la valeur absolue de la vélocité. Si
cette valeur est supérieure à 1, on cape la vélocité à 1 si elle est positive et à -1 si la
vélocité est négative. On le fait pour la vélocité horizontale et verticale.

Enfin on applique la vélocité à la position de la fusée pour la faire bouger.
]]--

function love.update(dt)
  if love.keyboard.isDown("left") then
    lander.angle = lander.angle - (90*dt)
    if lander.angle < 0 then lander.angle = 360 end
  end
  
  if love.keyboard.isDown("right") then
    lander.angle = lander.angle + (90*dt)
    if lander.angle > 360 then lander.angle = 0 end
  end
  
  if love.keyboard.isDown("up") then
    lander.flammeOn = true
    
    local angle_radian = math.rad(lander.angle)
    local force_x = math.cos(angle_radian) * (lander.speed*dt)
    local force_y = math.sin(angle_radian) * (lander.speed*dt)
    if math.abs(force_x) < 0.001 then force_x = 0 end
    if math.abs(force_y) < 0.001 then force_y = 0 end
    
    lander.vx = lander.vx + force_x
    lander.vy = lander.vy + force_y
  else
    lander.flammeOn = false
  end
  
  lander.vy = lander.vy + (0.6*dt)
  
  if math.abs(lander.vx) > 1 then
    if lander.vx > 0 then
      lander.vx = 1
    else
      lander.vx = -1
    end
  end
  
  if math.abs(lander.vy) > 1 then
    if lander.vy > 0 then
      lander.vy = 1
    else
      lander.vy = -1
    end
  end
  
  lander.x = lander.x + lander.vx
  lander.y = lander.y + lander.vy
end

--[[
D'abord on dessine la fusée. On appelle son image, on défini sa position de départ, on 
convertit sa rotation en radians, on laisse son échelle par défaut, et on place son origine
en son milieu. Ensuite on dessine la flamme si le moteur est allumé. Il faut faire attention
à ce que les images soient bien dessinées les unes par rapport aux autres et à bien 
positionner l'image de la flamme par rapport à celle de la fusée.

Enfin on affiche quelques valeurs à l'écran.
]]--

function love.draw()
  love.graphics.draw(lander.fusee_img, lander.x, lander.y, math.rad(lander.angle), 1, 1, lander.fusee_img:getWidth()/2, lander.fusee_img:getHeight()/2)
  if lander.flammeOn == true then
    love.graphics.draw(lander.flamme_img, lander.x, lander.y, math.rad(lander.angle), 1, 1, lander.fusee_img:getWidth()/2, lander.fusee_img:getHeight()/2)
  end
  
  local sDebug = "Debug: "
  sDebug = sDebug.."angle = "..tostring(lander.angle)
  sDebug = sDebug.." vx = "..tostring(lander.vx)
  sDebug = sDebug.." vy = "..tostring(lander.vy)
  love.graphics.print(sDebug, 0, 0)
end