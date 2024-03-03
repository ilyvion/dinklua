--[[
Common people code. In here goes code that lots of people share.

Use like this, e.g.:

local people = include("_people")
people.spawn_person(390, direction.SOUTH_EAST, 326, 300, "s2-wand")
--]]

local misc = include("_misc")

function spawn_person(base_walk, dir, x, y, script)
  -- Right now just spawn the dang guy
  misc.preload_diagonal_seq(base_walk)
  -- Spawn guy
  local pep = dink.create_sprite(x, y, brain.NONE, 0, 0)
  pep.brain = brain.SMART_PEOPLE
  pep.base_walk = base_walk
  pep.speed = 1
  pep.timing = 0
  -- set starting pic
  pep.pseq = base_walk + 3
  pep.pframe = 1
  pep.script = script
end
