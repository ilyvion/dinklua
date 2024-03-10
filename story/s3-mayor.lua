local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("m", current_sprite, "5")
end

function hit()
  cs:command("say", "d", "Let me show you MY version of politics, friend!")
end

function talk()
  player:freeze()
  current_sprite:freeze()

  local choice_menu = dink.create_choice_menu()

  local choice_hi = choice_menu:add_choice("Say hi")
  local choice_assault = choice_menu:add_choice("Tell him about the planned assault")
  choice_assault.condition = function() return global.mayor == 2 end
  local choice_proof = choice_menu:add_choice("Show him the proof")
  choice_proof.condition = function() return global.mayor == 3 end
  local choice_scroll = choice_menu:add_choice("Show him the scroll with the plans")
  choice_scroll.condition = function() return global.mayor == 4 end
  
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()
  dink.wait(400)

  if choice_result == choice_hi then
    if global.mayor < 4 then
      cs:command("ass", {"d", "m"}, {
        "Hello Mayor, nice town you have here.",
        "Thank you fair citizen.",
        "Yeah, noted."
      })
    else
      cs:command("ass", {"d", "m"}, {
        "Hello Mayor, how's it going?",
        "Pretty good fair citizen.",
        "Hey, that's just great."
      })
    end
  elseif choice_result == choice_assault then
    cs:command("ass", {"d", "m"}, {
      "Mayor, I have urgent news, your town is going to be attacked!",
      "What?!?  That's preposterous, you've got to be joking!",
      {
        "No, I'm dead serious!  It's the Cast Knights.",
        "They're planning to attack during the parade."
      },
      "That's crazy!!  ... so many people would be hurt.",
      {
        "All the more reason for you to believe me.",
        "Now the girl by the fountain said you knew some Royal guards."
      },
      "You talked with my daughter?",
      "She's your daughter??  Is she single?",
      "What?",
      "Never mind, so you have some connections right?",
      {
        "Yes they could help.",
        "But I need proof before I can go calling them in."
      },
      "Ok, so if I get proof you'll help?",
      "Yes, without it my hands are tied.",
      "Allright, then I'm off."
    })
    global.mayor = 3
  elseif choice_result == choice_proof then
    cs:command("ass", {"d", "m"}, {
      "I finally got the proof we need.",
      "No you didn't you liar!",
      "Oops, my bad."
    })
  elseif choice_result == choice_scroll then
    cs:command("ass", {"d", "m"}, {
      {
        "I've got your proof mayor.",
        "They plan to slaughter the entire city."
      },
      {
        "Oh my god, this attack would destroy our defenses!",
        "I can't believe they would attack us like this."
      },
      "Now will you call the Guard?",
      "Yes, I just hope they can get here in time..."
    })
    global.mayor = 5
    dink.wait(250)
    dink.script_attach(1000)
    dink.fade_down()
    misc.teleport(586, 266, 80)
    dink.draw_status()
    dink.fade_up()
    dink.kill_this_task()
    return
  end

  player:unfreeze()
  current_sprite:unfreeze()
end
