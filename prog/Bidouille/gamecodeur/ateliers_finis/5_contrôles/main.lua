--[[
Cette commande permet de désactiver l'antialiasing par défaut de Löve2D.
]]

love.graphics.setDefaultFilter("nearest")

--[[
On crée trois tables, une pour chaque périphérique. Elles ont les mêmes éléments:
une image et des coordonnées x et y. Pour la souris on récupère en plus le milieu
de l'image pour en faire le point d'origine, ainsi quand on la déplacera avec le 
curseur, celui-ci sera bien situé au centre de l'image.

Pour finir on crée quelques variables globales, pour récupérer les manettes
connectées, stocker les boutons et récupérées les valeurs du stick analogique.
]]

function love.load()
  clavier = {}
  clavier.img = love.graphics.newImage("clavier.png")
  clavier.x = 10
  clavier.y = 50
  
  souris = {}
  souris.img = love.graphics.newImage("mouse.png")
  souris.x = 150
  souris.y = 75
  souris.originX = souris.img:getWidth() / 2
  souris.originY = souris.img:getHeight() / 2
  
  gamepad = {}
  gamepad.img = love.graphics.newImage("gamepad.png")
  gamepad.x = 210
  gamepad.y = 50
  
  joysticks = love.joystick.getJoysticks()
  buttons = {}
  xAxis = 0
  yAxis = 0
end

--[[
Dans un premier temps, on met à jour la position de l'image du clavier avec
les flèches directionnelles.

Ensuite on récupère le clic du bouton gauche de la souris en affectant dans des
variables les positions x et y du curseur de la souris.

Après on s'occupe de la manette. Dans un premier temps, si une manette est 
détectée, on stocke la liste des boutons dans le tableau buttons initialisé
plus haut. Pour ce faire, on crée une variable locale dans laquelle on
affecte le premier indice de la variable "joysticks" (qui contient la liste
des manettes connectées). Ensuite on crée un for qui va de 1 jusqu'au nombre
de bouton de la manette. A chaque tour de boucle, dans l'indice b du tableau
"buttons", on stocke le numéro du bouton enfoncé. Ce procédé sert à réupérer 
le mapping des boutons si la manette n'est pas reconnue nativement par Löve 
mais aussi, pour ce programme en particulier, de dessiner un tableau avec les
cases qui s'allument quand on appuie sur un bouton.
Dans un second temps, on récupère les principaux boutons de la manette dans des
variables. Là encore on crée une variable locale qui récupère la première 
manette connectée. Ensuite on range dans chaque variable la valeur du bouton
enfoncé.
Pour finir on met à jour la position de l'image de la manette avec la croix
directionnelle ou le stick gauche.
]]

function love.update(dt)
  if love.keyboard.isDown("right") then
    clavier.x = clavier.x + 20 * dt
  end
  if love.keyboard.isDown("left") then
    clavier.x = clavier.x - 20 * dt
  end
  if love.keyboard.isDown("up") then
    clavier.y = clavier.y - 20 * dt
  end
  if love.keyboard.isDown("down") then
    clavier.y = clavier.y + 20 * dt
  end
  
  if love.mouse.isDown(1) then
    souris.x = love.mouse:getX()
    souris.y = love.mouse:getY()
  end
  
  if #joysticks > 0 then
    but = joysticks[1]
    for b=1, but:getButtonCount() do
      buttons[b] = but:isDown(b)
    end
  end
  
  if #joysticks > 0 then
    joy1 = joysticks[1]
    --croix directionelle
    jright = joy1:isGamepadDown("dpright")
    jleft = joy1:isGamepadDown("dpleft")
    jup = joy1:isGamepadDown("dpup")
    jdown = joy1:isGamepadDown("dpdown")
    --stick gauche
    xAxis = joy1:getGamepadAxis("leftx")
    yAxis = joy1:getGamepadAxis("lefty")
    --bouton principaux
    butA = joy1:isGamepadDown("a")
    butB = joy1:isGamepadDown("b")
    butX = joy1:isGamepadDown("x")
    butY = joy1:isGamepadDown("y")
  end
  
  if jright then
    gamepad.x = gamepad.x + 20 * dt
  end
  if jleft then
    gamepad.x = gamepad.x - 20 * dt
  end
  if jup then
    gamepad.y = gamepad.y - 20 * dt
  end
  if jdown then
    gamepad.y = gamepad.y + 20 * dt
  end
  if math.abs(xAxis) > 0.2 then
    gamepad.x = gamepad.x + (xAxis*40) * dt
  end
  if math.abs(yAxis) > 0.2 then
    gamepad.y = gamepad.y + (yAxis*40) * dt
  end
end

--[[
On dessine à l'écran les images du clavier et de la souris. On affiche en haut de l'écran
quelques informations à propos de la position du curseur de la souris. On dessine l'image
de la manette.

On affiche à l'écran si une manette est connectée ou non. Ensuite, plus bas sur l'écran, quand une manette
est connectée, on affiche un tableau avec un for. Les bornes de la boucle vont de 1 jusqu'au nombre de 
boutons (on récupère la liste "buttons"). La boucle va dessiner une suite de carrés numérotés qui vont 
"s'allumer" quand on appuie sur le bouton correspondant. Pour cela, dans la boucle, on commence par remplir
le carré correspondant à l'indice dans le tableau "buttons" du bouton enfoncé, sinon le carré reste en mode
ligne.
Ensuite on dessine le carré, en paramètres de la fonction on passe la variable "style" qui contient le mode
dans lequel doit être dessiné le carré selon que le bouton est enfoncé ou non, les coordonées du carré et ses
dimensions.
A la ligne suivante on affiche le numéro du bouton dans chaque carré en convertissant en chaine de caractères
la variable locale b qui sert de borne de départ et de variable d'incrémentation à la boucle.
Enfin à la dernière ligne on incrémente la variable qui contient la position x du carré pour que les carrés
se dessinent les uns à la suite des autres et pas les uns sur les autres.
]]

function love.draw()
  love.graphics.draw(clavier.img, clavier.x, clavier.y)
  --print("clavier.x = "..clavier.x)
  --print("clavier.y = "..clavier.y)
  love.graphics.draw(souris.img, souris.x, souris.y, 0, 1, 1, souris.originX, souris.originY)
  love.graphics.print("souris.originX: "..souris.originX.." souris.originY: "..souris.originY.." souris.x : "..souris.x.." souris.y: "..souris.y, 10, 20)
  love.graphics.draw(gamepad.img, gamepad.x, gamepad.y)
  
  if #joysticks > 0 then
    love.graphics.print(tostring(#joysticks).." joysticks détectés... isGamepad: "..tostring(joysticks[1]:isGamepad()))
  else
    love.graphics.print("Aucun gamepad détecté...")
  end
  
  xButton = 10
  yButton = 150
  love.graphics.print("Joystick buttons: ", xButton, yButton)
  yButton = yButton + 20
  for b=1, #buttons do
    if buttons[b] == true then
      style = "fill"
    else
      style = "line"
    end
    love.graphics.rectangle(style, xButton, yButton, 20, 20)
    love.graphics.print(tostring(b), xButton+1, yButton)
    xButton = xButton + 20 + 3
  end
end

--[[
Dans le mousepressed on récupère les clics uniques de la souris. Ici on met
à jour la position de la souris si on clique avec le bouton droit.
]]

function love.mousepressed(x, y, button)
  if button == 2 then
    souris.x = x
    souris.y = y
  end
end

--[[

]]

function love.mousereleased(x, y, button)
end

function love.keypressed(key)
end