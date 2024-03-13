local cs

local talker = 0

function main()
  dink.preload_seq(514)
  dink.preload_seq(70)

  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("w", current_sprite, "7")

  cs:command("mve", "d", 157)

  if global.story > 10 then return end

  cs:command("say", "w", "AHHHHH!!!!!!")
  local junk = misc.create_sprite_initialized(385, 151, brain.MISSILE, 506, 1, {
    seq = 514,
    dir = direction.WEST,
    speed = 4,
    flying = true,
  })

  cs:scene({
    {"w", 0},
    {"fza"},
    {"say", "d", "AHHHHH!!!!!"},
    {"wn", 290},
    {"mvs", "d", 240},
    {"wn", 560},
    {"fn", nil, function()
      misc.create_sprite_initialized(157, 131, brain.KILL_SEQ_DONE, 168, 1, {
        seq = 70
      })
    end},
    {"w", 0},
    {"psound", 37, 22050, 0, nil, false},
    {"wn", 1200},
    {"dir", "d", "e"},
    {"wn", 500},
    {"w", 250},
    {"ss", "d", "What the hell?!?"},
    {"ss", "w", "Sorry."},
    {"ufza"}
  })
end

function talk()
  cs:command("fza")

  if global.story > 10 then
    cs:command("ass", {"w", "d"}, {
      {
        "Ah, Dink.  How are you my boy, how are you.",
        "Thank you so much for saving our town."
      },
      "Hey, no problem."
    })
  elseif talker == 2 then
    cs:command("ass", {"w", "d"}, {
      "I'm done talking to you, I have more important things to worry about.",
      "Hmmm."
    })
  else
    local choice_menu = dink.create_choice_menu()

    local choice_whup = choice_menu:add_choice("Ask what's up")
    local choice_town = choice_menu:add_choice("Ask about the town")
    choice_menu:add_choice("Leave")
  
    local choice_result = choice_menu:show()

    if choice_result == choice_whup then
      cs:command("ass", {"d", "w"}, {
        {
          "Hey, uh thanks for that fireball!",
          "What the hell's wrong with you?"
        },
        "I .. I'm sorry, I thought you were someone else.",
        "Like who?!?",
        {
          "Like maybe another raider coming for my food.",
          "I have to defend myself."
        },
        "This town is messed up."
      })
      talker = talker + 1
    elseif choice_result == choice_town then
      local junk = player.dir
      cs:scene({
        {"ass", {"d", "w"}, {
          "So, what's with the town here?",
          "We, we all worship the duck here."
        }},
        {"dir", "d", "s"},
        {"wn", 750},
        {"ss", "d", {
          "Ok, I'm gonna turn back towards you ...",
          "and you're gonna give a normal answer this time."
        }},
        {"ss", "d", "Ready ...."},
        {"dir", "d", junk},
        {"wn", 500},
        {"ass", {"w", "d"}, {
          "`7We all worship the duck here.",
          {
            "Yeah ...",
            "Is this some kind of religion?"
          },
          "Yes, we give all and owe all to the duck.",
          "Well okay then, I'll ... I'll get back to you on that."
        }}
      })
      talker = talker + 1
    end
  end

  cs:command("ufza")
end

function hit()
  cs:command("fz", "w")
  if global.story > 10 then
    cs:command("ss", "w", "Ah, some hero you are!")
  else
    cs:command("ss", "w", "Ahhh, knock it off you!")
  end
  cs:command("ufz", "w")
end
