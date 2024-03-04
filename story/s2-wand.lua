function main()
  if dink.random(15, 1) == 1 then
    current_sprite:say_stop("`4Hello there sir.")
  end
end

function talk()
  player:freeze()
  current_sprite:freeze()

  local choice_menu = dink.create_choice_menu()

  local choice_hi = choice_menu:add_choice("Say Hi")
  local choice_tales = choice_menu:add_choice("Ask about his tales")
  local choice_leave = choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  local cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("w", current_sprite, "4")
  
  if choice_result == choice_hi then
    cs:command("ass", {"d", "w"}, {
      "So what do you do?",
      {
        "Well, I'm a hunter.",
        "Hope to find some good furs in these parts."
      },
      {
        "That's a good job",
        "Any luck lately?"
      },
      {
        "No, not really.  It's been kinda weird.",
        "I've seen a lot of monsters around lately though,",
        "it's like maybe they scared off all the animals."
      }
    })
  elseif choice_result == choice_tales then
    if dink.random(2, 1) == 1 then
      cs:command("ss", "w", {
        "I've heard many strange tales in my day.",
        "One particular tale spoke of an island in the sea.",
        "Where both humans and dragons lived.",
        "And in peace, no wars, no fighting.",
        "I even heard there was an underground tunnel to it.",
        "They say it was a beautiful island to visit.",
        "But I don't think it exists, just an old tale."
      })
    else
      cs:command("ss", "w", {
        "A long time ago there used to be an entire goblin castle",
        "in this land.",
        "It's said they launched attack and attack from it,",
        "terrorizing the land.",
        "But they say a magic user came and cast a mighty spell on the castle.",
        "So strong that it teleported the castle to the icelands in the north.",
        "Presumably the goblins died in the harsh weather.",
        "Otherwise, no one has heard of the castle since."
      })
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end
