function main()
  misc.preload_diagonal_seq(250)

  if global.mayor == 1
  or global.mayor == 2
  or global.mayor == 7 then
    return
  elseif global.mayor == 5 then
    dink.playmidi("lovin.mid")
    
    -- Actually Spawn the girl, and her script
    local woman = misc.create_sprite_initialized(400, 110, 0, 0, 0, {
      brain = brain.SMART_PEOPLE,
      base_walk = 250,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 253,
      pframe = 1
    }, {{"d", 250}})

    local function create_peeps(x, y, base_walk, dir)
      return misc.create_sprite_initialized(x, y, 0, 0, 0, {
        brain = brain.SMART_PEOPLE,
        base_walk = base_walk,
        speed = 1,
        timing = 0,
        script = "s3-peeps",
        -- set starting pic
        pseq = base_walk + dir,
        pframe = 1
      }, {{"d", base_walk}})
    end
    -- Create more & more & more
    local pp1 = create_peeps(125, 115, 270, 3)
    local pp2 = create_peeps(250, 141, 280, 3)
    local pp3 = create_peeps(45, 370, 370, 9)
    local pp4 = create_peeps(410, 380, 360, 7)
    local pp5 = create_peeps(520, 360, 410, 7)
    local pp6 = create_peeps(70, 180, 220, 3)
    local pp7 = create_peeps(320, 400, 220, 9)
    local pp8 = create_peeps(295, 50, 370, 3)
    local pp9 = create_peeps(175, 350, 390, 9)
    
    -- Let's Go movers!!
    local function create_mover(x, y, base_walk, timing)
      return misc.create_sprite_initialized(x, y, 0, 0, 0, {
        brain = brain.NONE,
        base_walk = base_walk,
        speed = 1,
        timing = timing,
        -- set starting pic
        pseq = base_walk + 1,
        pframe = 1
      }, {{"d", base_walk}})
    end
    local mp1 = create_mover(640, 200, 290, 0)
    local mp2 = create_mover(640, 305, 290, 33)
    local mp3 = create_mover(640, 320, 380, 20)
    local mp4 = create_mover(700, 340, 370, 0)
    local mp5 = create_mover(670, 210, 390, 33)
    local mp6 = create_mover(710, 180, 410, 0)
    local mp7 = create_mover(640, 175, 410, 0)
    -- Let's Go
    local cs = cutscene.create_cutscene()
    cs:add_participant("d", player)
    cs:add_participant("w", woman, "9")
    for i, p in pairs({pp1, pp2, pp3, pp4, pp5, pp6, pp7, pp8, pp9}) do
      cs:add_participant("pp"..i, p)
    end
    for i, p in pairs({mp1, mp2, mp3, mp4, mp5, mp6, mp7}) do
      cs:add_participant("mp"..i, p)
    end

    cs:command("fza")
    for i=1,7 do
      cs:command("mvw", "mp"..i, -1500)
      cs:remove_participant("mp"..i)
    end
    cs:scene({
      {"wn", 500},
      {"ss", "w", "Dink, Dink, over here."},
      {"mss", "d", 105},
      {"mse", "d", 450},
      {"ss", "w", "Isn't it just beautiful?"},
      {"dir", "d", "w"},
      {"w", 250},
      {"ass", {"d", "w"}, {
        {
          "Yup, it's a parade allright.",
          "A lot of people too, I shudder at what could've happened."
        },
        {
          "You really saved the town Dink...",
          "I'm really proud of you."
        },
        "Thanks, but I couldn't have done it without you.",
        {
          "Well I have to be going, I have to meet with my father.",
          "Take care Dink, I hope I'll see you again."
        }
      }},
      {"wn", 750},
      {"w", 0},
      {"ufza"},
      {"fz", "d"},
      {"fz", "w"},
      {"dir", "d", "s"},
      {"msse", "w", 660},
      {"ss", "d", "Oh, you will baby, you will..."},
      {"k", "w"},
      {"ufz", "d"}
    })
    global.story = 10
    global.mayor = 6
  elseif global.mayor == 6 then
    local loser = misc.create_sprite_initialized(350, 210, 0, 0, 0, {
      brain = brain.SMART_PEOPLE,
      base_walk = 410,
      speed = 1,
      timing = 0,
      pseq = 413,
      pframe = 1,
      script = "s3-loser"
    })
  else
    local woman = misc.create_sprite_initialized(300, 130, 0, 0, 0, {
      brain = brain.SMART_PEOPLE,
      base_walk = 250,
      speed = 1,
      timing = 0,
      -- set starting pic
      pseq = 253,
      pframe = 1,
      script = "s3-chick"
    })
  end
end
