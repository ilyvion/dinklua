--[[
Common people code. In here goes code that lots of people share.

Use like this, e.g.:

local people = include("_people")
people.spawn_person(390, direction.SOUTH_EAST, 326, 300, "s2-wand")
--]]


function spawn_person(base_walk, dir, x, y, script)
  -- Right now just spawn the dang guy
  misc.preload_diagonal_seq(base_walk)
  -- Spawn guy
  misc.create_sprite_initialized(x, y, brain.NONE, 0, 0, {
    brain = brain.SMART_PEOPLE,
    base_walk = base_walk,
    speed = 1,
    timing = 0,
    -- set starting pic
    pseq = base_walk + 3,
    pframe = 1,
    script = script
  })
end
