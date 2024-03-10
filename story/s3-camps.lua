function main()
  if global.mayor == 3 and global.gobpass >= 5 then
    local function spawn_evil(x, y)
      return misc.create_sprite_initialized(x, y, 0, 0, 0, {
        brain = brain.MONSTER_DIAGONAL,
        base_walk = 300,
        speed = 1,
        timing = 0,
        -- set starting pic
        pseq = 303,
        pframe = 1
      }, {{"d", 300}})
    end

    -- Make Em
    local evil = spawn_evil(120, -30)
    evil.brain = brain.NONE
    -- Now EVIL's friend
    local evil2 = spawn_evil(490, -30)
    -- One more
    local evil3 = spawn_evil(310, -30)
    -- Hell
    local evil4 = spawn_evil(210, 470)
    -- Done, now move on

    local cs = cutscene.create_cutscene()
    cs:add_participant("d", player)
    cs:add_participant("e1", evil, "4")
    cs:add_participant("e2", evil2, "7")
    cs:add_participant("e3", evil3)
    cs:add_participant("e4", evil4)

    cs:scene({
      {"fza"},
      -- Should just be escaping from the Camp
      {"fdu"},
      {"mse", "d", 300},
      {"mvs", "d", 210},
      {"wn", 1000},
      {"ss", "d", "Man, that was close!"},
      {"wn", 500},
      {"ss", "d", "It looks like this scroll might just be the proof I need."},
      {"wn", 1000},
      {"pmidi", "1004.mid"},
      {"mvs", "e1", 120},
      {"wn", 75},
      {"mvs", "e2", 174},
      {"wn", 65},
      {"mvs", "e3", 140},
      {"wn", 24},
      {"mvn", "e4", 370},
      {"say", "e1", "Not so fast ..."},
      {"ss", "e2", "Ha Ha Haaa"},
      {"wn", 500},
      {"mvw", "e2", 450},
      {"mss", "d", 290},
      {"msn", "d", 280},
      {"wn", 400},
      {"w", 250},
      {"ass", {"e1", "d"}, {
        {
          "Looks like you have trouble learning, small one.",
          "I thought I told you to stay away from us."
        },
        {
          "Yeah well, my foot still has an appointment with you.",
          "What do you freaks want with town anyway?"
        },
        {
          "Our business doesn't need to be told to the dead..",
          "Finish him."
        }
      }},
      {"w", 0},
      {"ls"},
      {"msn", "e1", -30},
      {"k", "e1"}
    })
    -- Battle starts
    for _, s in pairs({evil2, evil3, evil4}) do
      misc.initialize_sprite(s, {
        base_attack = 740,
        strength = 10,
        defense = 8,
        touch_damage = 6,
        script = "s3-dorks",
        hitpoints = 40,
        target = player
      })
      s:unfreeze()
    end
    player:unfreeze()
    -- Like if Dink lives ... give him the proof
    global.mayor = 4
  end
end
