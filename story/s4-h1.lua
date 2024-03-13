function main()
  misc.create_sprite_initialized(404, 151, 0, 0, 0, {
    brain = brain.SMART_PEOPLE,
    base_walk = 220,
    speed = 1,
    timing = 0,
    -- set starting pic
    pseq = 221,
    pframe = 1,
    script = "s4-h1p"
  }, {{"d", 220}})
end
