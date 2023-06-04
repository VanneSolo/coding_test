if arg[#arg] == "-debug" then require("mobdebug").start() end

--[[
On défini les propriétés des sprites dans des tableaux. La position en x et en y, 
le rayon et la couleur. La boule dispose de quelques propriétés supplémentaires car
elle changera de couleur selon que le perso collisionne avec elle ou non. On crée 
aussi les variables qui serviront de coefficient dans les calculs de distance.
]]

balleFixe = {}
balleFixe.x = 80
balleFixe.y = 200
balleFixe.r = 30
balleFixe.color = {0.1, 0.4, 0.25}

balleMobile = {}
balleMobile.x = nil
balleMobile.y = nil
balleMobile.r = 35
balleMobile.color = {0.7, 0.28, 0.62}

balleMilieu = {}
balleMilieu.x = nil
balleMilieu.y = nil
balleMilieu.r = 20
balleMilieu.color = {0.35, 0.69, 0.55}

balleQuart = {}
balleQuart.x = nil
balleQuart.y = nil
balleQuart.r = 15
balleQuart.color = {0.12, 0.23, 0.33}

boule = {}
boule.x = 350
boule.y = 200
boule.r = 40
boule.color1 = {0.1, 0.7, 0.6}
boule.color2 = {0.82, 0.17, 0.67}
boule.color = boule.color1

perso = {}
perso.x = 350
perso.y = 100
perso.r = 25
perso.color = {0.75, 0.82, 0.12}

k = 1
a = 1
b = 1

--[[
Fonction Distance K
Elle prend en paramètres les coordonnées de deux points. Ici il s'agira de l'offset
de deux sprites. Ensuite un autre paramètre qui sera la puissance à laquelle on 
élèvera notre fonction et enfin les deux derniers paramètres sont des coefficients
qui permettront d'influer chacun sur la valeur d'une longueur.
On additionne les valeures absolues de x2-x1 et y2-y1, qu'on élève à la puissance k
et qu'on multiplie par un coefficient de "compression" (pa, pb) et on retourne le résultat.

Fonction Distance infini
Elle prend les mêmes paramètres que la fonction distance K, sauf le paramètre pk. 
Comme on ne garde que la plus grande valeur entre x2-x1 et y2-y1, on n'a pas 
besoin de puissance.
On compare les valeures absolues de x2-x1 et y2-y1 et on garde le plus grand nombre

Fonction Distance
Retourne la fonction DistanceK ou DistanceInfini selon la valeur de k, qui occupe la
place du paramètre pk.
]]

function DistanceK(x1, y1, x2, y2, pk, pa, pb)
  return( math.abs( pa*(x2-x1))^pk + math.abs(pb*(y2-y1))^pk )^(1/pk)
end

function DistanceInfini(x1, y1, x2, y2, pa, pb)
  return math.max( math.abs(pa*(x2-x1)), math.abs(pb*(y2-y1)) )
end

function Distance(x1, y1, x2, y2, pk, pa, pb)
  if pk > 0 then
    return DistanceK(x1, y1, x2, y2, pk, pa, pb)
  else
    return DistanceInfini(x1, y1, x2, y2, pa, pb)
  end
end

--[[
Fonction DrawSprite
Elle prend un paramètre, sprite, qui sera le nom du sprite à dessiner.
On défini d'abord la couleur du sprite.

Ensuite on crée une double boucle imbriquée. Elle va créer le carré dans lequel
est inscrit la boule. Pour chaque valeur en x du segment qui va de 
sprite.x-sprite.r à sprite.x+sprite.r, on regarde la valeur en y sur un segment
qui va de sprite.y-sprite.r à sprite.y+sprite.r. On obtient un point de
coordonnées i,j . 
On appelle alors la fonction Distance. On lui passe en argument les coordonnées 
en x et en y du centre du sprite puis de point i,j . En comparant cette distance 
avec la longueur du rayon du sprite, on va pouvoir afficher le sprite à l'écran 
en dessinant tous les pixels dont les coordonnées sont situées à une distance du 
centre du sprite qui est inférieure ou égale à son rayon.
C'est aussi lors de cet appel à la fonction Distance que l'on appelle les 
variables k, a et b qui vont se superposer aux paramètres pk, pa et pb de la 
fonction Distance et permettre d'influer sur la forme du sprite.
]]

function DrawSprite(sprite)
  love.graphics.setColor(sprite.color)
  for i = sprite.x - sprite.r, sprite.x + sprite.r do
    for j = sprite.y - sprite.r, sprite.y + sprite.r do
      if Distance(sprite.x, sprite.y, i, j, k, a, b) <= sprite.r then
        love.graphics.line(sprite.x, sprite.y, i, j)
      end
    end
  end
end

--[[
Fonction Milieu
Elle prend les coordonnées de deux points en paramètres et renvoie les
coordonnées du point moyen.
]]

function Milieu(x1, y1, x2, y2)
  xMid = (x2 + x1) / 2
  yMid = (y2 + y1) / 2
  return xMid, yMid
end

function love.load()
end

--[[
Dans l'update on met à jour la position des différentes balles. Evidemment on ne change pas la
position de balleFixe qui sert de point d'ancrage aux autres balles. Pour la position de 
balleMobile, qui sera la plus éloignée de balleFixe, on affecte la fonction love.mouse.getPosition
aux variables balleMobile.x et balleMobile.y, ce qui permet de récupérer les coordonnées x et y 
du curseur de la souris.
Pour balleMilieu on appelle la fonction Milieu. On lui passe les coordonnées du centre de balleFixe
et celles du centre de balleMobile. La fonction va donc calculer le x moyen et le y moyen entre
ces deux balles.
On répète la même opération pour balleQuart, sauf qu'on calcul le point moyen entre balleFixe et
balleMilieu plutôt qu'entre balleFixe et balleMobile.

Ensuite on défini les touches qui permettront de faire bouger le sprite perso

Pour finir on utilise la fonction Distance pour vérifier les collisions entre perso et
boule. On compare la longueur qui va du centre du perso à celui de la boule à la longueur
résultant de l'addition des rayons des deux sprites. Si la première longueur est plus 
petite alors c'est que les deux sprites sont en contact et on change la couleur de boule.
]]

function love.update(dt)
  balleMobile.x, balleMobile.y = love.mouse.getPosition()
  balleMilieu.x, balleMilieu.y = Milieu(balleFixe.x, balleFixe.y, balleMobile.x, balleMobile.y)
  balleQuart.x, balleQuart.y = Milieu(balleFixe.x, balleFixe.y, balleMilieu.x, balleMilieu.y)
  
  if love.keyboard.isDown("right") then
    perso.x = perso.x + 25 * dt
  end
  if love.keyboard.isDown("left") then
    perso.x = perso.x - 25 * dt
  end
  if love.keyboard.isDown("up") then
    perso.y = perso.y - 25 * dt
  end
  if love.keyboard.isDown("down") then
    perso.y = perso.y + 25 * dt
  end
  
  if ( Distance(boule.x, boule.y, perso.x, perso.y, k, a, b) < boule.r + perso.r ) then
    boule.color = boule.color1
  else
    boule.color = boule.color2
  end
end

--[[
Dans le draw on appelle la fonction DrawSprite pour dessiner boule et perso. On l'appelle en passant 
boule ou perso en argument. Ainsi la table va se "superposer" au paramètre "sprite" de la fonction:
boule <=> sprite
Et les champs de la table vont être appelés à chaque mention de "sprite" dans la fonction DrawSprite:
boule.x <=> sprite.x
boule.y <=> sprite.y
boule.r <=> sprite.r
boule.color <=> sprite.color

A la première ligne de la fonction on défini la couleur du sprite. Dans cet exemple on a pris la table
boule donc la fonction regarde ce qui se passe à boule.color. Par défaut la valeur et de boule.color1, 
on dessine donc la boule de cette couleur. Cependant dans le love.update on voit que si la distance 
entre le centre du sprite "boule" et le centre du sprite "perso" est inférieure à la distance formée
par l'addition du rayon des deux sprite alors on change la couleur de "boule" (car cela signifie que les
deux sprites sont en collision).

Ensuite on entre dans la double boucle imbriquée qui va réellement dessiner le sprite. Pour chaque 
colonne (i) sur une distance qui va de -boule.r à + boule.r (les bornes de la boucle vont en fait de 
boule.x - boule.r jusqu'à boule.x + boule.r pour dessiner le segment) on regarde à chaque ligne (j) 
si le pixel situé au coordonnées (i,j) est à une distance inférieure ou égal à boule.r ; si oui on le
dessine.

Ensuite on dessine les balles, en commençant par leur couleur.

Enfin on imprime à l'écran quelques informations de debug.
]]

function love.draw()
  DrawSprite(boule)
  DrawSprite(perso)
  
  love.graphics.setColor(balleFixe.color)
  love.graphics.circle("fill", balleFixe.x, balleFixe.y, balleFixe.r)
  
  love.graphics.setColor(balleMobile.color)
  love.graphics.circle("fill", balleMobile.x, balleMobile.y, balleMobile.r)
  
  love.graphics.setColor(balleMilieu.color)
  love.graphics.circle("fill", balleMilieu.x, balleMilieu.y, balleMilieu.r)
  
  love.graphics.setColor(balleQuart.color)
  love.graphics.circle("fill", balleQuart.x, balleQuart.y, balleQuart.r)
  
  love.graphics.setColor(1, 1, 1)
  love.graphics.print("Augmenter/Diminuer K: a/z  K = "..tostring(k), 10, 10 )
  love.graphics.print("Augmenter/Diminuer A: q/s  A = "..tostring(a), 230, 10 )
  love.graphics.print("Augmenter/Diminuer B: w/x  B = "..tostring(b), 450, 10 )
  love.graphics.print("boule.x = "..tostring(boule.x).." boule.y = "..tostring(boule.y), 10, 30 )
  love.graphics.print("perso.x = "..tostring(perso.x).." perso.y = "..tostring(perso.y), 10, 45 )
  love.graphics.print("boule.r = "..tostring(boule.r), 10, 60)
end

--[[
Dans le keypressed on défini les touches qui permettent d'influer sur les coefficient qui
change la forme des boules. Les touches a et z permettent d'augmenter ou diminuer la valeur de la 
variable k, qui sert à modifier la puissance à laquelle on élève les valeurs dans la fonction 
puissance et permet de changer la forme de la boule.

Les touches q et z permettent d'augmenter ou diminuer la valeur de la variable a, qui permet de
modifier la compression horizontale de la boule.

Les touches w et x permettent d'augmenter ou diminuer la valeur de la variable b, qui permet de
modifier la compression verticale de la boule.
]]

function love.keypressed(key)
  if key == "a" then
    k = k + 1
  elseif key == "z" then
    k = k - 1
  end
  
  if key == "q" then
    a = a + 1
  elseif key == "s" then
    a = a - 1
  end
  
  if key == "w" then
    b = b + 1
  elseif key == "x" then
    b = b - 1
  end
end