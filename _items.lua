--[[
Common item code. In here goes code that lots of items (both on-the-ground
items and equipped items) share.
--]]

-- We'll make use of the make functions, so let's import them.
local make = include("_make")

--[[
Common use-item code. Restricts the player's direction to non-diagonal
directions, runs an animation sequence based on a base sequence plus
the direction the player is facing, waits a certain amount of time,
then plays a specific sound effect.
--]]
function use_item(base_seq, use_wait, sound_number)
  -- disallow diagonal punches
  if player.dir == direction.SOUTH_WEST or player.dir == direction.SOUTH_EAST then
    player.dir = direction.SOUTH
  elseif player.dir == direction.NORTH_WEST or player.dir == direction.NORTH_EAST then
    player.dir = direction.NORTH
  end
  
  player.seq = base_seq + player.dir -- base_seq is the 'base' for the hit animations, we just add the direction
  player.frame = 1 -- reset seq to 1st frame
  player:kill_wait() -- make sure dink will play the animaition right away
  player.nocontrol = true -- dink can't move until anim is done!
  if use_wait ~= nil then
    dink.wait(use_wait)
  end
  if sound_number ~= nil then
    dink.playsound(sound_number, 8000, 0, nil, false)
  end
end

function use_magic_item(base_seq, use_wait)
  use_item(base_seq, nil, nil)
  global.magic_level = 0
  dink.draw_status()
  dink.wait(use_wait)
end

function use_magic_projectile(p_direction, base_seq, sound_number, damage_script)
  local mholdx, mholdy = player.x, player.y
  local seq, mx, my, dir
  if p_direction == direction.SOUTH_WEST then
    mholdx = mholdx - 30
    seq = base_seq + 4
    mx = -6
    my = 2
  elseif p_direction == direction.WEST then
    mholdx = mholdx - 30
    seq = base_seq + 4
    dir = 4
  elseif p_direction == direction.NORTH_WEST then
    mholdx = mholdx - 30
    seq = base_seq + 4
    mx = -6
    my = -2
  elseif p_direction == direction.NORTH then
    seq = base_seq + 8
    dir = 8
  elseif p_direction == direction.NORTH_EAST then
    mholdx = mholdx + 30
    seq = base_seq + 6
    mx = 6
    my = -2
  elseif p_direction == direction.EAST then
    mholdx = mholdx + 30
    seq = base_seq + 6
    dir = 6
  elseif p_direction == direction.SOUTH_EAST then
    mholdx = mholdx + 30
    seq = base_seq + 6
    mx = 6
    my = 2
  elseif p_direction == direction.SOUTH then
    seq = base_seq + 2
    dir = 2
  end
  local junk = dink.create_sprite(mholdx, mholdy, brain.MISSILE, seq, 1)
  junk.seq = seq
  if mx ~= nil then
    junk.mx = mx
    junk.my = my
  else
    junk.dir = dir
  end

  -- create fake shadow effect
  dink.playsound(sound_number, 8000, 0, junk, false)
  
  junk.timing = 0
  junk.speed = 6
  junk.strength = 10
  junk.range = 10
  -- this makes it easier to hit stuff
  junk.flying = true
  junk.script = damage_script
  --[[
    when the missile hits something, it will look to this script, this way
    we can, e.g., burn trees when appropriate
  ]]
  local mshadow = dink.create_sprite(mholdx, mholdy, brain.SHADOW, 432, 3)
  mshadow.brain_parm = junk.sprite_number
  mshadow.que = -500
  -- will be drawn under everything

  -- set missile to not be able to damage Dink or the shadow
  junk.brain_parm = 1
  junk.brain_parm2 = mshadow.sprite_number
end

-- Used from bar-e.lua, bar-sh.lua and bar-f1.lua
function break_barrel(barrel_sprite, make_item, make_item_arg)
  -- play noise
  dink.playsound(37, 22050, 0, nil, false)
  
  local hold = barrel_sprite.editor_sprite
  if hold ~= nil then
    -- this was placed by the editor, lets make the barrel stay flat
    hold.type = editor_type.DRAW_BACKGROUND_WITHOUT_HARDNESS
    hold.seq = 173
    hold.frame = 6
  end
  
  barrel_sprite.seq = 173
  barrel_sprite.brain = brain.KILL_SEQ_DONE_LEAVE_LAST_FRAME
  barrel_sprite.notouch = true
  barrel_sprite.nohit = true
  
  if make_item ~= nil then
    --[[
      At this point, remember (or learn) that table.entry is really just
      syntactic sugar for table["entry"], which makes this equivalent to
      calling the function named whatever make_item is set to in the
      _make.lua file, e.g. make.sheart(x, y).
    --]]
    if make_item_arg == nil then
      make[make_item](barrel_sprite.x, barrel_sprite.y)
    else
      make[make_item](barrel_sprite.x, barrel_sprite.y, make_item_arg)
    end
  end
  
  barrel_sprite.hard = true
  -- sprite ain't hard no more!  Let's redraw the hard map in one area
  barrel_sprite:draw_hard()
  dink.kill_this_task()
end

-- Used from ch*.lua
function open_chest(chest_sprite, chest_seq, chest_frame, make_item, make_item_arg)
  -- play noise
  
  local hold = chest_sprite.editor_sprite
  if hold ~= nil then
    -- this was placed by the editor, lets make the chest stay open
    hold.type = editor_type.DRAW_WITH_HARDNESS
    hold.seq = chest_seq
    hold.frame = chest_frame
  end
  
  if make_item ~= nil then
    --[[
      At this point, remember (or learn) that table.entry is really just
      syntactic sugar for table["entry"], which makes this equivalent to
      calling the function named whatever make_item is set to in the
      _make.lua file, e.g. make.sheart(x, y).
    --]]
    if make_item_arg == nil then
      make[make_item](chest_sprite.x, chest_sprite.y)
    else
      make[make_item](chest_sprite.x, chest_sprite.y, make_item_arg)
    end
  end
  
  chest_sprite.seq = chest_seq
  chest_sprite.script = ""
  chest_sprite.notouch = true
  chest_sprite.nohit = true
  
  dink.kill_this_task()
end

function check_has_free_items()
  local junk = dink.free_items()
  if junk < 1 then
    local choice_menu = dink.create_choice_menu()
    choice_menu.y = 240
    choice_menu.title = "You are carrying too much."
    choice_menu:add_choice("Ok")
    choice_menu:show()
    return false
  else
    return true
  end
end

function pulsate_item(seq)
  current_sprite.touch_damage = -1
  current_sprite.seq = seq
  current_sprite.frame = 1 -- so the seq will start
  current_sprite.brain = brain.REPEAT
  current_sprite.nohit = true
end

function shiny_item(pseq, frame)
  current_sprite.pseq = pseq
  current_sprite.frame = frame
  current_sprite.touch_damage = -1
  current_sprite.nohit = true

  -- create shiny thingie
  local save_x, save_y = current_sprite.x, current_sprite.y
  save_y = save_y + dink.random(5, 1)
  local spark = dink.create_sprite(save_x, save_y, brain.SHADOW, 165, 1)
  spark.seq = 165
  spark.nohit = true
  spark.frame = dink.random(5, 1)
  spark.brain_parm = current_sprite.sprite_number
end

function pickup_item(size_match, sound)
  sound = sound or 10
  dink.playsound(sound, 22050, 0, nil, false)
  -- shrink to this percent then die
  current_sprite.brain_parm = size_match
  current_sprite.brain = brain.BRAIN_PARM_SIZE_MATCH
  current_sprite.touch_damage = 0
  current_sprite.timing = 0
  
  local hold = current_sprite.editor_sprite
  if hold ~= nil then
    -- this was placed by the editor, lets make it not come back
    hold.type = editor_type.KILL_COMPLETELY
  end
end
