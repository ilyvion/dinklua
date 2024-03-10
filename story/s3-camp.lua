function main()
  if global.mayor == 3 and global.gobpass >= 5 then
    local function spawn_evil(x, y)
      return misc.create_sprite_initialized(x, y, 0, 0, 0, {
        brain = brain.NONE,
        base_walk = 300,
        speed = 1,
        timing = 0,
        -- set starting pic
        pseq = 303,
        pframe = 1
      }, {{"d", 300}})
    end

    -- Do the Palette fade
    global.vision = 1

    -- Spawn a bad guy
    local evil = spawn_evil(350, 280)
    -- His friend
    local evil2 = spawn_evil(620, 50)
    -- Done

    local cs = cutscene.create_cutscene()
    cs:add_participant("d", player)
    cs:add_participant("e1", evil)
    cs:add_participant("e2", evil2, "5")

    cs:scene({
      {"fz", "d"},
      {"mve", "e1", 660},
      {"w", 3000},
      {"mvw", "e2", -20},
      {"w", 0},
      {"ss", "d", "This must be it!"},
      {"ss", "d", "I have to make it into that tent."},
      {"w", 1000},
      {"msw", "d", 50},
      {"w", 500},
      {"msn", "d", 250},
      {"w", 1000},
      {"mse", "d", 169},
      {"w", 500},
      {"msn", "d", 215},
      {"w", 0},
      {"say", "d", "Here goes nothing..."},
      {"mss", "e2", 270},
      {"mvn", "d", 214},
      -- Uhhh ???
      {"fn", "d", function(d) d.nodraw = true end},
      {"mse", "e2", 310},
      {"w", 1000},
      {"mvn", "e2", 0},
      {"w", 0},
      {"dir", "d", "s"},
      {"fn", "d", function(d) d.nodraw = false end},
      {"say", "d", "Gotta run!!  Gotta run!!"},
      {"mssw", "d", 70},
      {"mvs", "e2", 370},
      {"say", "e2", "Hey!!"},
      {"mvs", "d", 410},
    })
    dink.fade_down()
    -- Fade out & stuff
  end
end
