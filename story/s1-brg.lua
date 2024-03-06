local misc = include("_misc")

function main()
  if global.story > 6 then
    return
  end
  
  global.vision = 1
  local guy = dink.create_sprite(400, 250, brain.MONSTER_DIAGONAL, 373, 4)
  guy:freeze()
  misc.initialize_sprite(guy, {
    speed = 1,
    timing = 33,
    base_walk = 270,
    script = "s1-brg2"
  })
end
