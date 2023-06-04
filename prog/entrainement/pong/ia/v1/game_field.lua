field_dim = {}
field_dim.w = 400
field_dim.h = 350
field_dim.x = 0
field_dim.y = 0
field_dim.pos_x = 10
field_dim.pos_y = 10

bord_haut = field_dim.pos_y
bord_droit = field_dim.pos_x + field_dim.w
bord_bas = field_dim.pos_y + field_dim.h
bord_gauche = field_dim.pos_x

middle_field_x = field_dim.pos_x + (field_dim.w/2)
middle_field_y = field_dim.pos_y + (field_dim.h/2)

function Load_Field()
  field = love.graphics.newCanvas(field_dim.w, field_dim.h)
  love.graphics.setCanvas(field)
  love.graphics.setColor(0, 1, 0)
  love.graphics.rectangle("fill", field_dim.x, field_dim.y, field_dim.w, field_dim.h)
  love.graphics.setColor(1, 1, 1)
  love.graphics.setCanvas()
end

function Draw_Field()
  love.graphics.draw(field, field_dim.pos_x, field_dim.pos_y)
  
  love.graphics.setColor(1, 1, 0)
  love.graphics.line(bord_gauche, bord_haut, bord_droit, bord_haut)
  love.graphics.line(bord_droit, bord_haut, bord_droit, bord_bas)
  love.graphics.line(bord_gauche, bord_bas, bord_droit, bord_bas)
  love.graphics.line(bord_gauche, bord_haut, bord_gauche, bord_bas)
  love.graphics.setColor(1, 1, 1)
end