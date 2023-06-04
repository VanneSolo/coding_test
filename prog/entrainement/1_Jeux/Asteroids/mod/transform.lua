function New_Object_Transform(position_x, position_y, rotation_x, rotation_y, rotation_speed, scale_x, scale_y)
  return {
    move = Vector(position_x or 0, position_y or 0),
    rotation = {x=rotation_x or 0, y=rotation_y or 0, speed=rotation_speed or 0},
    scale = Vector(scale_x or 0, scale_y or 0)
  }
end