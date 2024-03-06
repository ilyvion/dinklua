-- script for store manager, actually attached to the bench

local items = include("_items")

local manager

local function mainloop()
  while true do
    dink.wait(500)
    local myrand = dink.random(8, 1)
    if myrand == 1 then
      manager.pseq = 243
    elseif myrand == 2 then
      manager.pseq = 241
    end
  end
end

function main()
  manager = misc.create_sprite_initialized(185, 150, 0, 0, 0, {
    brain = brain.NONE,
    base_walk = 240,
    speed = 0,

    -- set starting pic
    pseq = 243,
    pframe = 1
  })

  mainloop()
end

function hit()
  current_sprite.speed = 0
  dink.wait(400)
  manager:say_stop("`%Please don't wreck the place, thanks.")
  dink.wait(800);
  mainloop()
end

function talk()
  local amount_hurt = global.lifemax - global.life
  local title
  if amount_hurt <= 0 then
    title = [["You are the perfect picture of health, sir."]]
  else
    title = [["You are injured!  It will cost $]]..amount_hurt..[[ gold to heal you."]]
  end
  
  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title = title
  
  local choice_heal = choice_menu:add_choice("Get healed", amount_hurt > 0)
  local choice_elixer = choice_menu:add_choice("Buy a bottle of elixer for $25")
  local choice_leave = choice_menu:add_choice("Leave")
  
  while true do
    local choice_result = choice_menu:show()

    if choice_result == choice_heal then
      if global.gold < amount_hurt then
        misc.show_dialog("You don't have enough gold.")
        goto continue
      end

      global.life = global.lifemax
      global.gold = global.gold - amount_hurt
      dink.playsound(22, 22050, 0, nil, false)
      player:say("I am healed.")
    elseif choice_result == choice_elixer then
      if not items.check_has_free_items() then
        goto continue
      end
      if global.gold < 25 then 
        misc.show_dialog("You don't have enough gold.")
        goto continue
      end

      global.gold = global.gold - 25
      dink.add_item("item-eli", 438, 9);
    end

    break
    
    ::continue::
  end
  
  player:unfreeze()
  mainloop()
end
