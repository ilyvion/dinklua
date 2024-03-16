local enemy = include("_enemy")
local items = include("_items")

local cs

function main()
  misc.initialize_sprite(current_sprite, {
    hitpoints = 30,
    base_walk = 370,
    speed = 1,
    timing = 33
  }, {{"d", 370}, 375})

  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("g", current_sprite, "5")
end

function talk()
  cs:command("fza")
  if global.story < 14 then
    cs:command("ass", {"g", "d"}, {
      "I am working on the most powerful bow in the world!",
      "Great!  Give it to me now!",
      "I'm not finished yet.  Come back later."
    })
  else
    local mcrap = dink.count_item("item-b3")
  
    local choice_menu = dink.create_choice_menu()
    choice_menu.y = 240
    choice_menu.title_color = 5
    choice_menu.title = [["My masterpiece is finished!"]]

    local choice_buy = choice_menu:add_choice("Buy the FlameBow for $25,000")
    choice_menu:add_choice("Leave")
    
    local choice_result = choice_menu:show()

    if choice_result == choice_buy then
      if items.try_buy_item(25000, "item-b3", 438, 13) then
        player:say("`0* FLAMEBOW BOUGHT *")
        dink.playsound(43, 22050, 0, nil, false);
      end
    end

  end
  cs:command("ufza")
end

function hit()
  cs:command("say", "g", "Help!!! Murderer!")
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
end
