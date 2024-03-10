local cs
local girl

function main()
  girl = false

  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("l", current_sprite, "4")

  if dink.random(3, 1) == 1 then
    cs:scene({
      {"fz", "l"},
      {"ss", "l", "Hello sir."},
      {"ufz", "l"}
    })
  end
end

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_store = choice_menu:add_choice("Ask about the store")
  local choice_sale = choice_menu:add_choice("See what's for sale")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_store then
    cs:command("ass", {"d", "l"}, {
      "Hey, what kind of store you got here?",
      {
        "We're Robinson Cabinets.",
        "We can supply all your wood furnishing needs."
      },
      {
        "Oh, not for me then.  I've had bad experiences with furniture in the past.",
        "Things tend to light on fire, and people I know just die. :'(",
      },
      "Okay then, if you need anything I'll be ...  over ... there."
    })
  elseif choice_result == choice_sale then
    if girl then
      cs:command("ass", {"d", "l", "p", "l"}, {
        "So, any other deals?",
        "Please sir, no more, I need to tend to my daughter.",
        "DADDY!!!!!!!!!",
        "See what I mean.."
      })
    else
      local prom = misc.create_sprite_initialized(310, 460, 0, 0, 0, {
        brain = brain.SMART_PEOPLE,
        base_walk = 330,
        speed = 1,
        timing = 0,
        -- set starting pic
        pseq = 339,
        pframe = 1
      })
      cs:add_participant("p", prom, "6")
      girl = true
      cs:scene({
        {"fz", "p"},
        {"ass", {"d", "l"}, {
          "Any goofy specials this month?",
          {
            "Nope, sorry.  We pretty much contract out by jobs",
            "on individual houses.  We also do countertops and the like."
          },
          "I see, well I don't own a house, but thanks for the info.",
          "Yeah, no problem ..."
        }},
        {"say", "p", "DADDY!!!!!!!!!"},
        {"ss", "l", "Oh no ..."},
        {"say", "p", "DADDY!!!!!!!!!"},
        {"msn", "p", 250},
        {"ass", {"l", "p"}, {
          "Yes dear, what is it?",
          "I need a new dress.",
          "But dear, we already got you one just last week.",
          {
            "Well THAT one doesn't look as good in the sunlight,",
            "let's just return it and get a new one."
          },
          "Promise, I just don't know ....",
          "I SAID NOW!!",
          "Okay, okay."
        }},
        {"ufz", "p"}
      })
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  cs:scene({
    {"fz", "l"},
    {"say", "l", "Hey, stop that, you'll hurt the wood."},
    {"ufz", "l"}
  })
end
