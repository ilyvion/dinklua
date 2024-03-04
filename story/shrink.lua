function main()
  -- shrink to nothing in 1 second
  dink.wait(1000)
  current_sprite.brain_parm = 40
  current_sprite.brain = brain.BRAIN_PARM_SIZE_MATCH
end
