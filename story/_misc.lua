--[[
Miscellaneous helper code that doesn't really fit in with other code

Use like this, e.g.:

local misc = include("_misc")
misc.preload_diagonal_seq(500)
--]]

function show_savegame_menu(hide_nevermind)
  local choice_menu = dink.create_choice_menu()
  for i=1,10 do
    choice_menu:add_savegame_choice()
  end
  
  local nevermind_choice
  if not hide_nevermind then
    nevermind_choice = choice_menu:add_choice("Nevermind")
  end
  
  local choice_result = choice_menu:show()
  
  if choice_result ~= nevermind_choice then
    return choice_result
  else
    return nil
  end
end

function show_button_menu()
  local choice_menu = dink.create_choice_menu()
  for i=1,10 do
    choice_menu:add_button_choice()
  end
  local nevermind_choice = choice_menu:add_choice("Nevermind")
  
  local choice_result = choice_menu:show()
  
  if choice_result ~= nevermind_choice then
    return choice_result
  else
    return nil
  end
end

function show_dialog(message, y, choice_text)
  y = y or 240
  choice_text = choice_text or "Ok"

  local choice_menu = dink.create_choice_menu()
  choice_menu.y = y
  choice_menu.title = message
  choice_menu:add_choice(choice_text)
  choice_menu:show()
end

function preload_diagonal_seq(base)
  dink.preload_seq(base + 1)
  dink.preload_seq(base + 3)
  dink.preload_seq(base + 7)
  dink.preload_seq(base + 9)
end

function preload_cardinal_seq(base)
  dink.preload_seq(base + 2)
  dink.preload_seq(base + 4)
  dink.preload_seq(base + 6)
  dink.preload_seq(base + 8)
end

function teleport(map, x, y)
  global.player_map = map
  player.x = x
  player.y = y
  dink.load_screen(map)
  dink.draw_screen()
end

function sparkle_around(sprite)
  local myx, myy = sprite.x, sprite.y - 60
  local mcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 1)
  mcrap.seq = 169
  mcrap.script = "shrink"

  myx, myy = myx - 30, myy - 30
  local dcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 3)
  dcrap.seq = 169
  dcrap.frame = 3
  dcrap.script = "shrink"

  myx, myy = myx + 60, myy + 10
  local rcrap = dink.create_sprite(myx, myy, brain.REPEAT, 169, 6)
  rcrap.seq = 169
  rcrap.frame = 6
  rcrap.script = "shrink"
end
