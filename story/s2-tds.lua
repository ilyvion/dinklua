function main()
  if global.thief == 2 then
    global.vision = 1
    -- so the real warping door will appear
    local poop = dink.create_sprite(300, 200, 0, 0, 0)
    poop.script = "s2-ryan2"
  elseif global.thief == 3 then
    player:freeze()
    local bad = misc.create_sprite_initialized(370, 190, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 370,
      speed = 2,
      timing = 0,
      -- set starting pic
      pseq = 371,
      pframe = 1
    }, {{"d", 370}})
    
    local poop = misc.create_sprite_initialized(410, 250, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 290,
      speed = 2,
      timing = 0,
      -- set starting pic
      pseq = 297,
      pframe = 1
    }, {{"d", 290}})
    
    local poop2 = misc.create_sprite_initialized(300, 175, 0, 0, 0, {
      brain = brain.NONE,
      base_walk = 290,
      speed = 2,
      timing = 0,
      -- set starting pic
      pseq = 293,
      pframe = 1
    }, {{"d", 290}})
    
    dink.wait(500)

    local cs = cutscene.create_cutscene(250)
    cs:add_participant("d", player)
    cs:add_participant("b", bad)
    cs:add_participant("p", poop, "3")
    cs:add_participant("p2", poop2, "4")

    cs:scene({
      {"ss", "p", "Thanks for helping us catch this guy, Dink."},
      {"ss", "p2", "Yeah, he's been hounding us for a long time."},
      {"ss", "d", "Oh, uh .. glad to be of assistance guys."},
      {"ss", "p2", "He won't be bothering anyone for quite a while."},
      {"ss", "p", "Yeah, say, are Tom and Bob ok inside?"},
      {"ss", "d", "Uh.. Yes, they're fine."},
      {"ss", "p", "I guess they'll be right out."},
      {"w", 0},
      {"ss", "p2", "Come on, let's get this loser to the jail."},
      {"mvn", "b", 130},
      {"mvn", "p", 190},
      {"msn", "p2", 115},
      {"mvw", "b", -20},
      {"mvw", "p2", -20},
      {"msw", "p", -20},
      {"k", "b"},
      {"k", "p"},
      {"k", "p2"}
    })
    global.tombob = 1
    global.thief = 4
    player:unfreeze()
  end
end
