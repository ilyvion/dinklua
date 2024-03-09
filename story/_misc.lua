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

function teleport(map, x, y, dir)
  global.player_map = map
  player.x = x
  player.y = y
  if dir ~= nil then
    player.dir = dir
  end
  dink.load_screen(map)
  dink.draw_screen()
end

function sparkle_around(sprite)
  local myx, myy = sprite.x, sprite.y - 60
  create_sprite_initialized(myx, myy, brain.REPEAT, 169, 1, {
    seq = 169,
    script = "shrink"
  })

  myx, myy = myx - 30, myy - 30
  create_sprite_initialized(myx, myy, brain.REPEAT, 169, 3, {
    seq = 169,
    frame = 3,
    script = "shrink"
  })

  myx, myy = myx + 60, myy + 10
  create_sprite_initialized(myx, myy, brain.REPEAT, 169, 6, {
    seq = 169,
    frame = 6,
    script = "shrink"
  })
end

function initialize_sprite(sprite, properties, preloads)
  for _, seq in pairs(preloads or {}) do
    if type(seq) == "number" then
      dink.preload_seq(seq)
    elseif type(seq) == "table" then
      if seq[1] == "d" then
        preload_diagonal_seq(seq[2])
      elseif seq[1] == "c" then
        preload_cardinal_seq(seq[2])
      else
        error("initialize_sprite only accepts 'c' or 'd' type preloads", 2)
      end
    else
      error("initialize_sprite only accepts number or table for preloads", 2)
    end
  end
  for prop, value in pairs(properties) do
    sprite[prop] = value
  end
end

function create_sprite_initialized(x, y, brain, seq, frame, properties, preloads)
  local sprite = dink.create_sprite(x, y, brain, seq, frame)
  local success, result = pcall(initialize_sprite, sprite, properties, preloads)
  if not success then
    error(result, 2)
  end
  return sprite
end

-- Dead sprites can't speak. But with this simple trick,
-- they can! (Useful when you want somebody to talk when
-- they die.)
function death_speak(sprite, text)
  local death_sprite = dink.create_sprite(sprite.x, sprite.y, 0, 0, 0)
  death_sprite:say(text)
  return death_sprite
end
