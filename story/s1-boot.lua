local items = include("_items")

function main()
  current_sprite.hitpoints = 30
end

function talk()
  local mcrap = dink.count_item("item-bt")

  player:freeze()
  current_sprite:freeze()

  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title_color = 5
  choice_menu.title =
  [["I'm a cobbler/pharmacist.  I make
  special herb boots.  When the herb
  touches your skin, you'll want to
  dance and be hyper."]]

  local choice_buy = choice_menu:add_choice("Buy his boots ($500)", mcrap == 0)
  local choice_complain1 = choice_menu:add_choice("Complain about the price", mcrap == 0)
  local choice_complain2 = choice_menu:add_choice("Complain about the price", mcrap ~= 0)
  local choice_leave = choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  local cs = cutscene.create_cutscene(300)
  cs:add_participant("d", player)
  cs:add_participant("b", current_sprite, "5")
  
  if choice_result == choice_complain1 then
    cs:command("ass", {"d", "b"}, {
      "You know, I bought the ones I'm wearing for only 1 piece of gold.",
      "You get what you pay for.",
      "Do you sell a lot of these?",
      "I've never sold one.",
      "Nice."
    })
  elseif choice_result == choice_complain2 then
    cs:command("ass", {"d", "b"}, {
      "You know, the price is too much, could you please lower it?",
      "Sure, how about 2 gold?",
      {
        "Great!  I'll take.. hey!",
        "I already bought them at the rip off price!"
      },
      "What a pity.",
      "I would like to make a return.",
      "And I would like to ask you to leave."
    })
  elseif choice_result == choice_buy then
    if global.gold < 500 then
      player:say("I don't have enough money!")
    else
      if items.check_has_free_items() then
        player:say("`0* HYPER BOOTS BOUGHT *")
        dink.playsound(43, 22050, 0, nil, false)
        global.gold = global.gold - 500
        dink.add_item("item-bt", 438, 22)
      end
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end
