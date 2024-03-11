function main()
  misc.create_sprite_initialized(333, 129, 0, 0, 0, {
    brain = brain.SMART_PEOPLE,
    base_walk = 390,
    speed = 4,
    timing = 0,
    -- set starting pic
    pseq = 391,
    pframe = 1,
    script = "s3-freak"
  })
end
