function main()
  -- Spawn guy
  misc.create_sprite_initialized(300, 200, 0, 0, 0, {
    brain = brain.SMART_PEOPLE,
    base_walk = 410,
    speed = 1,
    timing = 0,
    -- set starting pic
    pseq = 413,
    pframe = 1,
    script = "s3-larry"
  })
end
