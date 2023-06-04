entites = {}

function Create_Rect_Shape(pWorld, pos_x, pos_y, pType, pWidth, pHeight)
  rect_shape = {}
  rect_shape.body = love.physics.newBody(pWorld, pos_x, pos_y, pType)
  rect_shape.shape = love.physics.newRectangleShape(pWidth, pHeight)
  rect_shape.fixture = love.physics.newFixture(rect_shape.body, rect_shape.shape)
  table.insert(entites, rect_shape)
  return rect_shape
end

function Create_Circle_Shape(pWorld, pos_x, pos_y, pType, pRadius)
  circle_shape = {}
  circle_shape.body = love.physics.newBody(pWorld, pos_x, pos_y, pType)
  circle_shape.shape = love.physics.newCircleShape(pRadius)
  circle_shape.fixture = love.physics.newFixture(circle_shape.body, circle_shape.shape)
  table.insert(entites, circle_shape)
  return circle_shape
end

function Create_Edge_Shape(pWorld, pos_x, pos_y, pType, x1, y1, x2, y2)
  edge_shape = {}
  edge_shape.body = love.physics.newBody(pWorld, pos_x, pos_y, pType)
  edge_shape.shape = love.physics.newEdgeShape(x1, y1, x2, y2)
  edge_shape.fixture = love.physics.newFixture(edge_shape.body, edge_shape.shape)
  table.insert(entites, edge_shape)
  return edge_shape
end

function Create_Polygon_Shape(pWorld, pos_x, pos_y, pType, x1, y1, x2, y2, x3, y3, ...)
  verticies = {x1, y1, x2, y2, x3, y3, ...}
  polygon_shape = {}
  polygon_shape.body = love.physics.newBody(pWorld, pos_x, pos_y, pType)
  polygon_shape.shape = love.physics.newPolygonShape(verticies)
  polygon_shape.fixture = love.physics.newFixture(polygon_shape.body, polygon_shape.shape)
  table.insert(entites, polygon_shape)
  return polygon_shape
end