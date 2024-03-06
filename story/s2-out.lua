-- script for store manager, actually attached to the bench

local items = include("_items")

local manager

local function mainloop()
  while true do
    dink.wait(500)
    local myrand = dink.random(8, 1)
    if myrand == 1 then
      manager.pseq = 383
    elseif myrand == 2 then
      manager.pseq = 389
    end

    if dink.random(20, 1) == 1 then
      manager:say_stop_npc("`6Let me know if I can help you find something.")
    end
  end
end

function main()
  manager = misc.create_sprite_initialized(180, 260, 0, 0, 0, {
    brain = brain.NONE,
    base_walk = 380,
    speed = 0,

    -- set starting pic
    pseq = 383,
    pframe = 1
  }, {383, 389})
  -- used from s2-stat to let the manager talk about the statue
  volatile.manager = manager

  mainloop()
end

function hit()
  current_sprite.speed = 0
  dink.wait(400)
  manager:say_stop("`6Please don't wreck the place, thanks.")
  dink.wait(800);
  mainloop()
end

local function buy()
  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title = [["Our wares are the finest quality around.  We'll beat any price!"]]
  choice_menu.title_color = 6
  
  local choice_sword = choice_menu:add_choice("Longsword - $400")
  local choice_bomb = choice_menu:add_choice("Bomb - $20")
  local choice_leave = choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_sword then
    items.try_buy_item(400, "item-sw1", 438, 7)
  elseif choice_result == choice_bomb then
    items.try_buy_item(20, "item-bom", 438, 3)
  end
end

local function sell()
  -- let's sell some stuff back
  
  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title = [["We'll buy a few things.  What have you got?"]]
  choice_menu.title_color = 6
  
  local choice_sword = choice_menu:add_choice("Sell a Longsword - $200", function() return dink.count_item("item-sw1") > 0 end)
  local choice_nut = choice_menu:add_choice("Sell a nut - $2", function() return dink.count_item("item-nut") > 0 end)
  local choice_leave = choice_menu:add_choice("Sell nothing")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_sword then
    items.sell_item(200, "item-sw1")
  elseif choice_result == choice_nut then
    items.sell_item(2, "item-nut")
  end
end

function talk()
  player:freeze()
  
  local choice_menu = dink.create_choice_menu()
  choice_menu.y = 240
  choice_menu.title = [["What can I do for you today, sir?"]]
  choice_menu.title_color = 6
  
  local choice_buy = choice_menu:add_choice("Buy")
  local choice_sell = choice_menu:add_choice("Sell")
  local choice_leave = choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_buy then
    buy()
  elseif choice_result == choice_sell then
    sell()
  end
  
  player:unfreeze()
  mainloop()
end
