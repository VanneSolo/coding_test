function Wrap_Around(obj)
  if obj.transform.move.x > game.fenetre.size.x  then
    obj.transform.move.x = 0
  elseif obj.transform.move.x < 0 then
    obj.transform.move.x = game.fenetre.size.x
  end
  
  if obj.transform.move.y > game.fenetre.size.y then
    obj.transform.move.y = 0
  elseif obj.transform.move.y < 0 then
    obj.transform.move.y = game.fenetre.size.y
  end
end