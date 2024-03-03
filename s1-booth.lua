local misc = include("_misc")

function main()
  misc.preload_diagonal_seq(380)
  -- Spawn guy
  local pep = dink.create_sprite(348, 175, brain.NONE, 0, 0)
  pep.brain = brain.SMART_PEOPLE
  pep.base_walk = 380
  pep.speed = 1
  pep.timing = 0
  -- set starting pic
  pep.pseq = 383
  pep.pframe = 1
  pep.script = "s1-boot"
end
