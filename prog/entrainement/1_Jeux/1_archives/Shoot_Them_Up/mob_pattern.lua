--[[

    Ici seront stockés tous les patterns des différents ennemis croisés dans le jeu.
    Faire attention quand on défini le pattern, si le mob doit aller plusieurs fois dans
    la même direction, de ne pas appeler la variable qui stocke le déplacement à chaque
    fois de la même façon. Par exemple, si le mob doit aller vers la gauche puis vers la
    droite et enfin de nouveau vers la gauche, ne pas appeler les variables:
    gauche ...
    droite ...
    gauche ...
    Puisqu'il s'agirait de la même variable qui du coup serait écrasée et le pattern serait
    cassé à l'écran.

]]

local pattern = {}

function pattern.Update(dt)
  
end

function pattern.Draw()
  
end

function pattern.Keyboard(key)
  
end

function pattern.Mouse(x, y, button)
  
end

return pattern