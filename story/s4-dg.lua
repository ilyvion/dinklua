local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("g", current_sprite, "5")
end

function talk()
  cs:command("fz", "d")
  
  local choice_menu = dink.create_choice_menu()

  local choice_guarding = choice_menu:add_choice("Ask what he's guarding")
  local choice_in = choice_menu:add_choice("Ask about getting in")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_guarding then
    cs:command("ass", {"d", "g"}, {
      "What are you guarding here?",
      {
        "This is the town's duck altar.",
        "We worship them here."
      },
      "Oh, I thought it might be a ranch or something.",
      "On some occasions we do offer food here to the ducks.",
      "You give the DUCKS your food?",
      "Yes, of course."
    })
  elseif choice_result == choice_in then
    cs:command("ass", {"d", "g"}, {
      "So how does one get in to see the altar?",
      {
        "It is a great honor to worship inside.. one you have not earned.",
        "You can pray to the duck from here."
      }
    })
  end
  
  cs:command("ufz", "d")
end
