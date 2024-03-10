function main()
  -- Spawn the guy...
  local guy = misc.create_sprite_initialized(258, 146, 0, 0, 0, {
    brain = brain.NONE,
    base_walk = 410,
    speed = 1,
    timing = 0,
    -- set starting pic
    pseq = 417,
    pframe = 1
  })

  -- Conversation
  local cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("g", guy, "9")

  cs:scene({
    {"fza"},
    {"msn", "d", 222},
    {"msse", "g", 265},
  })
  local what = dink.random(3, 1)
  if what == 1 then
    cs:scene({
      {"ass", {"g", "d"}, {
        "Can I HELP you?",
        "Uhh ... maybe.",
        "Yeah well, what the hell are you doing??",
        "What do you mean?",
        {
          "I mean you just barging in here, no knocking, nothing!",
          "What's with that?"
        }
      }},
      {"w", 500},
      {"dir", "d", "s"},
      {"dir", "d", "n"},
      {"w", 250},
      {"ss", "d", "And there's like ... something WRONG with that?"},
      {"ss", "g", "YES, now get the HELL OUT!!"}
    })
  elseif what == 2 then
    cs:command("ass", {"g", "d"}, {
      "Can I HELP you?",
      "Nope, just looking through houses and stuff.",
      "You know, you've got a lot of nerve.",
      "Yea whatever ...",
      "Hmmmph.",
      {
        "Hey old man, the funeral house called ...",
        "they're ready for you now!"
      },
      "WHAT, now get OUT!!"
    })
  else
    cs:command("ass", {"g", "d"}, {
      "What do you want?",
      "I've come for your daughter.",
      "Just ... just please leave."
    })
  end

  player:unfreeze()
  player:move_stop(2, 640, false)
  guy:unfreeze()
end
