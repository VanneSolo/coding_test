balle = require("entities.balle")
pad = require("entities.pad")
wall = require("entities.wall")
brick = require("entities.brick")
pause_text = require("entities.pause_text")
gameover = require("entities.gameover_text")
stage_cleared_text = require("entities.stage_cleared_text")
levels = require ("levels")

local nb_bricks = 38

local obj =  {
  wall(400, -6, 800, 10, "mur_haut"),
  wall(400, 606, 800, 10, "mur_bas"),
  wall(806, 300, 10, 600, "mur_droit"),
  wall(-6, 300, 10, 600, "mur_gauche"),
  pad(200, 560, "player"),
  balle(200, 200, "balle"),
  pause_text(),
  gameover(),
  stage_cleared_text(),
  levels(dt)
}

return obj