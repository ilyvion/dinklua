--[[
Miscellaneous helper code that doesn't really fit in with other code

Use like this, e.g.:

local misc = include("_misc")
make.preload_diagonal_seq(500)
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
