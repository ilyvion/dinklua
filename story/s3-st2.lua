function main()
  local text = dink.say_xy("The best in bows", 18, 21)
  dink.debug("Ok, changing sprite "..text.sprite_number)
  text.kill = 0

  -- Create salesperson or something
  misc.create_sprite_initialized(300, 130, 0, 0, 0, {
    brain = brain.SMART_PEOPLE,
    base_walk = 370,
    speed = 1,
    timing = 0,
    -- set starting pic
    pseq = 373,
    pframe = 1,
    script = "s3-st2p"
  })
end
