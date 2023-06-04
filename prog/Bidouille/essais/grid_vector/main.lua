io.stdout:setvbuf('no')
love.graphics.setDefaultFilter("nearest")
if arg[arg] == "-debug" then require("mobdebug").start() end

require "vector"
require "dist"

function love.load()
  largeur = love.graphics.getWidth()
  hauteur = love.graphics.getHeight()
  
  circle_radius = 10
  
  origin_a = NewVector(0, 0)
  origin_b = NewVector(0, 0)
  point_a = NewVector(50, 350)
  point_b = NewVector(450, 150)
  point_c = NewVector(740, 220)
  point_d = NewVector(0, 0)
  point_e = NewVector(600, 420)
  point_f = NewVector(0, 0)
  point_g = NewVector(0, 0)
  
  translate_a_b = Distance(point_a.x, point_a.y, point_b.x, point_b.y, 2, 1, 1)
  translate_a_b_2 = math.sqrt( ((point_b.x-point_a.x)^2) + ((point_b.y-point_a.y)^2) )
  print(translate_a_b)
  print(translate_a_b_2)
  translate_b_c = Distance(point_b.x, point_b.y, point_c.x, point_c.y, 2, 1, 1)
  print(translate_b_c)
  
  translate_angle = 2.6
  translate_angle = translate_angle + math.pi
  point_d.x = point_a.x + translate_a_b_2 * math.cos(translate_angle)
  point_d.y = point_a.y + translate_a_b_2 * math.sin(translate_angle)
  
  translate_angle_2 = -2
  translate_angle_2 = translate_angle_2 + math.pi
  point_f.x = point_e.x - translate_a_b * math.cos(translate_angle_2)
  point_f.y = point_e.y - translate_a_b * math.sin(translate_angle_2)
  
  translate_angle_3 = 3.4
  translate_angle_3 = translate_angle_3 + math.pi
  point_g.x = point_b.x + translate_b_c * math.cos(translate_angle_3)
  point_g.y = point_b.y + translate_b_c * math.sin(translate_angle_3)
  
  --Creation de AC en additionnant AB et BC
  
  dist_ab_x = DistanceSimple(point_b.x, point_a.x)
  dist_ab_y = DistanceSimple(point_b.y, point_a.y)
  
  dist_bc_x = DistanceSimple(point_c.x, point_b.x)
  dist_bc_y = DistanceSimple(point_c.y, point_b.y)
  
  coord_x_c = dist_ab_x + dist_bc_x
  coord_y_c = -dist_ab_y + dist_bc_y
  
  vector_c = NewVector(coord_x_c, coord_y_c)
  
  print("dist_ab_x: "..dist_ab_x)
  print("dist_ab_y: "..dist_ab_y)
  print("dist_bc_x: "..dist_bc_x)
  print("dist_bc_y: "..dist_bc_y)
  
  print("coord_x_c: "..coord_x_c)
  print("coord_y_c: "..coord_y_c)
  
  print("point_a.x: "..point_a.x)
  print("point_a.y: "..point_a.y)
  
  print("point_b.x: "..point_b.x)
  print("point_b.y: "..point_b.y)
  
  print("point_c.x: "..point_c.x)
  print("point_c.y: "..point_c.y)
  
  function AddVectors(ax, ay, bx, by, cx, cy)
    point_origine = NewVector(ax, ay)
    
    dist_h_vec_1 = DistanceSimple(ax, bx)
    dist_v_vec_1 = DistanceSimple(ay, by)
    dist_h_vec_2 = DistanceSimple(cx, bx)
    dist_v_vec_2 = DistanceSimple(cy, by)
    
    long_h_vect_1_2 = dist_h_vec_1 + dist_h_vec_2
    long_v_vect_1_2 = dist_v_vec_1 + dist_v_vec_2
    
    vect_a_c = NewVector(long_h_vect_1_2, long_v_vect_1_2)
    
    vect_final = NewVector(point_origine.x + vect_a_c.x, point_origine.y + vect_a_c.y)
    return vect_final
  end
  
  test_a = NewVector(100, 80)
  test_b = NewVector(380, 230)
  test_c = NewVector(500, 400)
  
  test_add = AddVectors(test_a.x, test_a.y, test_b.x, test_b.y, test_c.x, test_c.y)
  --print(vect_final.x, vect_final.y)
  --print(test_add.x)
end

function love.update(dt)
  
end

function love.draw()
  i, j = 0
  for i = 0, largeur, 10 do
    for j = 0, hauteur, 10 do
      love.graphics.setColor(0.5, 0.5, 0.5)
      love.graphics.rectangle("line", i, j, 50, 50)
    end
  end
  
  --rouge
  love.graphics.setColor(1, 0, 0)
  love.graphics.line(40, 450, 760, 450)
  love.graphics.line(40, 40, 40, 450)
  
  --bleu
  love.graphics.setColor(0, 0, 1)
  love.graphics.circle("fill", point_a.x, point_a.y, circle_radius)
  love.graphics.line(point_a.x, point_a.y+10, point_a.x+400, point_a.y+10)
  
  --vert
  love.graphics.setColor(0, 1, 0)
  love.graphics.circle("fill", point_b.x, point_b.y, circle_radius)
  love.graphics.line(point_a.x, point_a.y, point_d.x, point_d.y)
  
  --jaune
  love.graphics.setColor(1, 1, 0)
  love.graphics.circle("fill", point_c.x, point_c.y, circle_radius)
  love.graphics.line(point_a.x, point_a.y, point_b.x, point_b.y)
  
  --cyan
  love.graphics.setColor(0, 1, 1)
  love.graphics.line(point_a.x, point_a.y, point_a.x + translate_a_b, point_a.y)
  love.graphics.circle("fill", point_e.x, point_e.y, circle_radius)
  
  --violet
  love.graphics.setColor(1, 0, 1)
  love.graphics.line(point_a.x, point_a.y-10, point_a.x + translate_a_b_2, point_a.y-10)
  love.graphics.line(point_b.x, point_b.y, point_g.x, point_g.y)
  
  --blanc
  love.graphics.setColor(1, 1, 1)
  love.graphics.line(point_e.x, point_e.y, point_f.x, point_f.y)
  love.graphics.line(point_a.x, point_a.y, point_a.x + vector_c.x, point_a.y + vector_c.y)
  
  --orange
  love.graphics.setColor(0.84, 0.45, 0)
  love.graphics.circle("fill", test_a.x, test_a.y, circle_radius)
  love.graphics.circle("fill", test_b.x, test_b.y, circle_radius)
  love.graphics.circle("fill", test_c.x, test_c.y, circle_radius)
  
  love.graphics.line(test_a.x, test_a.y, test_add.x, test_add.y)
end