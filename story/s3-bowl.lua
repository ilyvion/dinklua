local cs

function main()
  if global.bowlore > 0 then
    current_sprite.active = false
    return
  end
  
  misc.initialize_sprite(current_sprite, {
    base_walk = 380,
    hitpoints = 5,
    brain = brain.SMART_PEOPLE,
    speed = 1,
    timing = 33
  }, {{"d", 380}, 385})
end

function talk()
  player:freeze()
  current_sprite:freeze()

  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title_color = 4
  choice_menu.title = [["Hello, friend.  I will teach you bow lore for $1500 gold."]]

  local choice_lore = choice_menu:add_choice("Learn bow lore")
  choice_lore.condition = function() return global.bowlore == 0 end
  choice_menu:add_choice("Leave")

  local choice_result = choice_menu:show()
  if choice_result == choice_lore then
    if global.gold < 1500 then
      player:say("I don't have enough money!")
    else
      player:say("`4* YOU LEARN BOW LORE *")
      dink.playsound(43, 22050, 0, nil, false)
      global.bowlore = 1
      global.gold = global.gold - 1500
    end
  end
    
  player:unfreeze()
  current_sprite:unfreeze()
end
