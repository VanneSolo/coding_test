--[[
Dans le load, on charge les images de l'alien et de la croix. On crée les variables qui
serviront à modifier la position, l'origine, la rotation et l'échelle de l'image. Ensuite
on crée la variable booléenne qui servira à déclencher ou arrêter l'animation de l'alien
et la variable qui servira de coefficient pour le zoom et le dezoom de l'animation de blob
de l'alien, on lui donne une valeur négative. La dernière variable sert à définir la 
hauteur de la police d'écriture des informations qui seront affichées à l'écran.
Pour finir on défini les dimensions de la fenêtre du programme, la couleur du fond et on 
place l'image au centre de l'écran.
]]--

function love.load()
  img_alien = love.graphics.newImage("alien_bleu.png")
  img_croix_rouge = love.graphics.newImage("croix_rouge.png")
  pos_x = 0
  pos_y = 0
  orig_x = 0
  orig_y = 0
  rotate = 0
  scale = 1
  flag_anim_alien = false
  anim_scale_alien = -0.01
  font = love.graphics.newFont(14)
  
  love.window.setMode(800, 600)
  love.graphics.setBackgroundColor(0.2, 0.3, 0.5)
  pos_x = love.graphics.getWidth()/2
  pos_y = love.graphics.getHeight()/2
end

--[[
Dans l'update, on crée en premier l'animation de blob pour l'alien. On regarde si le booléen
est vrai. Si oui, on applique le coefficient à l'échelle. Comme on a affecté une valeur 
négative au coefficient, l'image va dezoomer. Ensuite on défini les bornes minimum et
maximum de l'animation. Quand la valeur inférieure attient la limite basse, on affecte de
force la valeur de cette limite basse à l'échelle et on soustrait le coefficient à 0. Comme
il a une valeur négative, en le soustrayant il va deveir positif et l'image va gonfler au
lieu de rétrécir. Dans un second temps, on fait sensiblement la même chose pour la limite 
haute. Quand l'échelle atteint cette valeur, on affecte la valeur en dur à l'échelle et on
inverse le coefficient.

Ensuite on s'occupe du contrôle des touches qui doivent être maintenues. Pour pouvoir 
utiliser indifféremment les touches MAJ gauche/droite ou CTRL gauche/droite, on crée des
variables MAJ et CTRL qui récupèrent la touche MAJ/CTRL de gauche ou de droite. Ensuite
pour définir les commandes, on vérifie si une touche est enfoncée puis on augmente ou 
diminue la variable correspondant à la commande souhaitée.
]]--

function love.update(dt)
  if flag_anim_alien == true then
    scale = scale + anim_scale_alien
    if scale <= 0.5 then
      scale = 0.5
      anim_scale_alien = 0 - anim_scale_alien
    end
    if scale >= 1 then
      scale = 1
      anim_scale_alien = 0 - anim_scale_alien
    end
  end
  
  local shift = love.keyboard.isDown("lshift") or love.keyboard.isDown("rshift")
  local ctrl = love.keyboard.isDown("lctrl") or love.keyboard.isDown("rctrl")
  
  if love.keyboard.isDown("right") and ctrl == true and shift == false then
    rotate = rotate + 0.01
  end
  if love.keyboard.isDown("left") and ctrl == true and shift == false then
    rotate = rotate - 0.01
  end
  
  if love.keyboard.isDown("right") and ctrl == false and shift == true then
    orig_x = orig_x + 1
  end
  if love.keyboard.isDown("left") and ctrl == false and shift == true then
    orig_x = orig_x - 1
  end
  if love.keyboard.isDown("up") and ctrl == false and shift == true then
    orig_y = orig_y - 1
  end
  if love.keyboard.isDown("down") and ctrl == false and shift == true then
    orig_y = orig_y + 1
  end
  
  if love.keyboard.isDown("right") and ctrl == false and shift == false then
    pos_x = pos_x + 1
  end
  if love.keyboard.isDown("left") and ctrl == false and shift == false then
    pos_x = pos_x - 1
  end
  if love.keyboard.isDown("up") and ctrl == false and shift == false then
    pos_y = pos_y - 1
  end
  if love.keyboard.isDown("down") and ctrl == false and shift == false then
    pos_y = pos_y + 1
  end
end

--[[
Dans le draw, on affiche en haut de l'écran quelques lignes d'informations: les coordonnées
de la position de l'image et de son origine, puis les commandes qui permettent d'influer sur
l'image. Ensuite on affiche l'alien et la petite croix qui indique l'origine de l'alien. 
Pour finir on affiche l'origine de l'image à côté de la croix.
]]--

function love.draw()
  love.graphics.print("x = "..tostring(pos_x).." y = "..tostring(pos_y).." ox = "..tostring(orig_x).." oy = "..tostring(orig_y), 0, 0)
  love.graphics.print("c: centrer l'origine, v: remettre l'origine par défaut, r: remettre la rotation à 0, a: animer l'alien", 0, font:getHeight("X"))
  love.graphics.print("flèches: changer la position, maj + flèches: changer l'origine, ctrl + gauche/droite: rotation", 0, font:getHeight("X")*2)
  
  love.graphics.draw(img_alien, pos_x, pos_y, rotate, scale, scale, orig_x, orig_y)
  love.graphics.draw(img_croix_rouge, pos_x, pos_y, 0, 0.5, 0.5, 8, 8)
  
  local s_orig_x = tostring(orig_x)
  local s_orig_y = tostring(orig_y)
  love.graphics.print(orig_x, pos_x - font:getWidth(s_orig_x)/2, pos_y-25)
  love.graphics.print(orig_y, pos_x - font:getWidth(s_orig_y)-10, pos_y-font:getHeight(s_orig_y)/2)
end

--[[
Dans le keypressed, on défini les commandes qui ne nécessitent d'appuyer qu'une fois sur la
touche. Pour activer l'animation, quand on appuie sur la touche, on vérifie le booléen
défini au début du code et on change son état.
]]--

function love.keypressed(key)
  if key == "a" then
    scale = 1
    if flag_anim_alien == false then
      flag_anim_alien = true
    else
      flag_anim_alien = false
    end
  end
  
  if key == "c" then
    orig_x = img_alien:getWidth()/2
    orig_y = img_alien:getHeight()/2
  end
  
  if key == "v" then
    orig_x = 0
    orig_y = 0
  end
  
  if key == "r" then
    rotate = 0
  end
end