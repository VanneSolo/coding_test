if arg[#arg] == "-debug" then require("mobdebug").start() end

--[[
Tout d'abord il faut appeler le fichier "vector" qui contient la classe vecteur, qui permet de créer des vecteurs 
et de travailler dessus
]]

require("vector")

--[[
Ensuite on défini un objet balle, qui aura la charge de créer une balle, de l'afficher à l'écran et de permettre de
la déplacer. Ce tableau contiendra les éléments suivant: rayon (une valeur numérique), position (un vecteur, mais 
comme il part de l'origine de la fenêtre, soit 0, 0, ce vecteur possède les mêmes coordonnées que le point
position), speed (un vecteur également), move (une fonction qui servira pour le déplacement du sprite) et pour finir
draw (fonction qui servira à afficher le sprite à l'écran).
]]

balle = {}
balle.rayon = 20
balle.position = NewVector(400, 300)
balle.speed = NewVector(0, 0)

--[[
Fonctionnement de balle.move

La fonction prend deux paramètres: pVelocity, dont on décidera de la valeur à l'appel de la fonction, et dt, le
delta time. Dans un premier temps on appelle balle.speed, à qui on laisse la valeur d'un NewVector de coordonnées
0, 0. Ensuite on défini les touches qui permettront de déplacer le sprite à l'écran, ici les flèches directionnelles
du clavier. Pour ce faire, on donne à balle.speed sa propre valeur à laquelle on additionne un autre NewVector. 
Löve va donc aller chercher la méthode VectorMT.__add(v1, v2) dans la métatable pour réaliser cette opération. On
donne au NewVector que l'on additionne à balle.speed pVelocity et 0 comme paramètres. Selon la direction dans laquelle
on veut aller, on place pVelocity en premier ou en second paramètre et on lui donne une valeur positive ou
négative. Comme balle.speed est un vecteur de coordonnées 0, 0, après addition avec NewVector, balle.speed aura pour
valeur soit + pVelocity soit - pVelocity. 

Une fois les touches définies, on normalise balle.speed dès que la balle se met en mouvement pour éviter qu'elle ait
une vitesse différente quand on se déplace en diagonale. En effet, si on se déplace par exemple de 2 sur les abscisses
ou sur les ordonnées, en diagonale on va donc se déplacer de racine carrée(2^2 + 2^2), soit racine carrée(8) = 2.83.
En normalisant le vecteur, il aura un déplacement de 1 quoi qu'il arrive. Après avoir normalisé balle.speed, on 
multiplie pVelocity par balle.speed.

Pour finir, on met à jour balle.position, en lui ajoutant la valeur du delta time multipliée par balle.speed.

REMARQUE IMPORTANTE.

Pour les deux dernières opérations dans la fonction, [balle.speed = pVelocity * balle.speed] et [balle.position
= balle.position + dt * balle.speed], il est important de placer les opérandes des multiplications dans cet
ordre-là. En effet, balle.speed et balle.position étant des vecteurs, quand on effectue des opérations dessus,
elles sont réalisées avec les méthodes de la métatable VectorMT. Pour les multiplications nous avons la méthode
__mul(k, v) avec k le scalaire (ou coefficient) qui va servir à multiplier v (un vecteur NewVector). Le premier
paramètre attend donc un nombre seul alors que le second attend une table avec deux éléments. Si on place les
opérandes dans un ordre différent, on se retrouve avec v qui ne possède qu'une valeur au lieu de deux, ce qui 
va causer une erreur.
]]

balle.move = function(pVelocity, dt)
  balle.speed = NewVector(0, 0)
  
  if love.keyboard.isDown("right") then
    balle.speed = balle.speed + NewVector(pVelocity, 0)
  end
  if love.keyboard.isDown("left") then
    balle.speed = balle.speed + NewVector(-pVelocity, 0)
  end
  if love.keyboard.isDown("up") then
    balle.speed = balle.speed + NewVector(0, -pVelocity)
  end
  if love.keyboard.isDown("down") then
    balle.speed = balle.speed + NewVector(0, pVelocity)
  end
  
  if balle.speed.norm() ~= 0 then 
    balle.speed.normalize()
    balle.speed = pVelocity * balle.speed
  end
  
  balle.position = balle.position + dt * balle.speed
end

--[[
Fonctionnement de balle.draw.

On demande à Löve de dessiner un cercle plein, aux coordonnées balle.position.x, balle.position.y et de
rayon balle.rayon. balle.position.x et balle.position.y auront donc la valeur de + pVelocity ou - pVelocity.
]]

balle.draw = function()
  love.graphics.circle("fill", balle.position.x, balle.position.y, balle.rayon)
end

function love.load()
end

--[[
Dans l'update on appelle la fonction balle.move.
]]

function love.update(dt)
  balle.move(200, dt)
end

--[[
Dans le draw on appelle la fonction balle.draw
]]

function love.draw()
  balle.draw()
end