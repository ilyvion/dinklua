local misc = include("_misc")

function main()
  if global.little_girl < 2 then
    local ran = dink.random(2, 1)
    if ran == 1 then
      misc.preload_diagonal_seq(330)
      
      local girl = dink.create_sprite(630, 180, brain.MONSTER_DIAGONAL, 331, 4)
      girl.script = "s1-lg"
      girl.base_walk = 330
      girl.timing = 33
      girl.speed = 1
      girl:move(direction.WEST, 590, true)
    end
  end
  
  if global.story == 1 or global.story == 5 then
    global.vision = 1
  end
end
