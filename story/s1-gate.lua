local misc = include("_misc")

function main()
  if global.little_girl < 2 then
    local ran = dink.random(2, 1)
    if ran == 1 then
      misc.preload_diagonal_seq(330)
      
      local girl = misc.create_sprite_initialized(630, 180, brain.MONSTER_DIAGONAL, 331, 4, {
        script = "s1-lg",
        base_walk = 330,
        timing = 33,
        speed = 1
      })
      girl:move(direction.WEST, 590, true)
    end
  end
  
  if global.story == 1 or global.story == 5 then
    global.vision = 1
  end
end
