function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    base_walk = 340,
    speed = 0,

    -- set starting pic
    pseq = 349,
    pframe = 1
  }, {
    347, 349
  })
end

function hit()
  dink.wait(400)
  current_sprite:say_stop("`3Ouch!")
end
