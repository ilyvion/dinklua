function main()
  misc.create_sprite_initialized(300, 130, 0, 0, 0, {
    brain = brain.MONSTER_DIAGONAL,
    base_walk = 230,
    speed = 1,
    timing = 33,
    -- set starting pic
    pseq = 233,
    pframe = 1,
    script = "s3-st1p"
  })

  if global.mayor == 2 or global.mayor == 4 then
    misc.create_sprite_initialized(400, 280, 0, 0, 0, {
      brain = brain.SMART_PEOPLE,
      base_walk = 380,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 383,
      pframe = 1,
      script = "s3-mayor"
    })
  end
end
