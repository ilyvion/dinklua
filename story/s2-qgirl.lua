function main()
  dink.debug("Making girl")
  misc.preload_diagonal_seq(330)
  misc.initialize_sprite(current_sprite, {
    base_walk = 330,
    speed = 1,
    pseq = 331,
    pframe = 1,
    brain = brain.SMART_PEOPLE
  })
end

function talk()
  current_sprite:say("`#Hi, Dink.")
end
