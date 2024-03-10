function main()
  --[[
    PAP STORY IS CURRENTLY 6 after your mother dies and you read the letter
    When the guy in the cave dies it is set to 7, so the storyline with the
    Cast knights has become established.  Perhaps use this also for whatever
    way Seth decides to get by the rocks preventing entrance to sector 3.
    Seth will incriment the number to 8 after you do the cult quest.
    This event (as in right below) puts it at 9.  And at the parade
    When you finish that quest it turns to 10 and then you can go to
    Justin's duck village.
  ]]
  if global.story == 8 then
    -- Script for entering Sector 3
    local function spawn_evil(y)
      return misc.create_sprite_initialized(-30, y, 0, 0, 0, {
        brain = brain.NONE,
        base_walk = 300,
        speed = 1,
        timing = 0,
        -- set starting pic
        pseq = 303,
        pframe = 1
      }, {{"d", 300}})
    end

    -- Spawn Stuff
    local evil = spawn_evil(130)
    -- Now EVIL's friend
    local evil2 = spawn_evil(210)

    local cs = cutscene.create_cutscene()
    cs:add_participant("d", player)
    cs:add_participant("e1", evil, "5")
    cs:add_participant("e2", evil2, "7")

    cs:scene({
      {"fz", "d"},
      {"msw", "d", 580},
      {"w", 1000},
      {"psound", 40, 22050, 0, nil, false},
      {"w", 650},
      {"psound", 40, 22050, 0, nil, false},
      {"w", 500},
      {"psound", 40, 22050, 0, nil, false},
      {"dir", "d", "w"},
      {"dir", "d", "e"},
      {"dir", "d", "s"},
      {"ss", "d", "I hear someone coming!"},
      {"w", 0},
      {"msw", "d", 468},
      {"w", 500},
      {"mss", "d", 269},
      {"pmidi", "1005.mid"},
      -- Move em on screen
      {"w", 670},
      {"mvse", "e1", 110},
      {"w", 1000},
      {"mve", "e2", 130},
      {"w", 0},
      {"ss", "d", "Hey, those are some of the damn Cast knights."},
      {"mvne", "e2", 150},
      {"w", 250},
      {"mvsw", "e1", 115},
      {"w", 0},
      {"mvw", "e2", 100},
      {"w", 750},
      {"ss", "d", "What the hell are they doing here?"},
      {"w", 250},
      -- They say stuff
      {"ass", {"e2", "e1"}, {
        "Area looks clear, I'm ready to head back.",
        "I think we'll be able to raid the town during the festival.",
        "Good, right on schedule.  Only WE won't be blamed...",
        "Right.  Have you contacted Mog?",
        "Yes.  We sent Joon the bowman.  He speaks their language well."
      }},
      -- Move them away or something
      {"w", 420},
      {"mvw", "e1", -20},
      {"w", 0},
      {"msw", "e2", -20},
      {"k", "e1"},
      {"w", 500},
      {"k", "e2"},
      {"msw", "d", 300},
      {"ss", "d", {
        "Man, raiding a town!?!",
        "A group of those guys would slaughter it.",
        "They mentioned a festival ...",
        "... wonder if it's around here."
      }},
      {"ufz", "d"},
    })
    -- They have now seen this....
    global.story = 9
  end
end
