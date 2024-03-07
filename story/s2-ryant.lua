function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    base_walk = 370,
    speed = 2,
    timing = 0,

    -- set starting pic
    pseq = 371,
    pframe = 1,
  }, {371, 373})
end

function talk()
  player:freeze()
  
  local cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("t", current_sprite, "2")
  
  local choice_menu = dink.create_choice_menu()

  local choice_hi = choice_menu:add_choice("Say hi")
  local choice_does = choice_menu:add_choice("Ask what he does")
  choice_does.condition = function() return global.thief == 0 end
  local choice_help = choice_menu:add_choice("Offer to help him out")
  choice_help.condition = function() return global.thief == 1 end
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_hi then
    cs:command("ass", {"d", "t"}, {
      "Hey, how's it going?",
      "Are you the guy for the job?",
      "Uh, what job?",
      "Oh, never mind."
    })
    current_sprite:say("`2Ahh, where is that guy?!")
  elseif choice_result == choice_does then
    cs:command("ass", {"d", "t"}, {
      "So what do you do pal?",
      "Who me?",
      "Yup, myself, why if you couldn't tell, I'm an adventurer.",
      "Hehe, yes well, I'm a ... a .. specialist.",
      "Oh, what do you specialize in?",
      "Let's just say I help acquire things..",
      "Ahh, I see, just what are you acquiring now?",
      {
        "Nothing that should interest you.",
        "Now be on your way."
      }
    })

    -- Set it up
    global.thief = 1
  elseif choice_result == choice_help then
    cs:scene({
      {"ass", {"t", "d"}, {
        "You again?",
        "Whatever you're doing .. I can help you out.",
        {
          "YOU?!?",
          "Are you sure?"
        },
        "Yeah, I know how to do all sorts of things.",
        {
          "Hmmmmm",
          "Well I guess my other guy's not showing up.",
          "So you're in.",
          "Meet me west of here when you're ready"
        }
      }},
      {"w", 0},
      {"msw", "t", 317},
      {"mss", "t", 430},
    })
    global.thief = 2
    current_sprite.active = false
  end

  player:unfreeze()
end
