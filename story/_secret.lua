-- script for secret tree/rock

local make = include("_make")

args = nil

function main()
  dink.preload_seq(167)
end

function die()
  missile_target.seq = 20
  dink.playsound(6, 8000, 0, missile_target, false)
  dink.wait(500)
  dink.wait(500)
  dink.playsound(43, 22050, 0, nil, false)

  local mcrap = dink.create_sprite(current_sprite.x, current_sprite.y, 7, 167, 1)
  mcrap.seq = 167

  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    size = 100,
    touch_damage = -1,
    seq = 0,
    pseq = 89,
    pframe = 10
  })
end

function touch()
  if args == nil then
    error("args is nil. Forgot to set?")
  end

  if global.life < 1 then return end
  dink.playsound(39, 22050, 0, nil, false)
  dink.script_attach(1000)
  misc.teleport(table.unpack(args))
  dink.kill_this_task()
end

-- script for secret rock

function hit()
  if args == nil then
    error("args is nil. Forgot to set?")
  end

  local rcrap = missile_source:compare_script("dam-bomn")
  if rcrap then
    -- rock just got hit by a sprite with a script named dam-bomn, I'm gonna
    -- guess it was the bomb.
    local x,y = current_sprite.x, current_sprite.y + 1

    local make_item, make_item_arg = table.unpack(args)
    if make_item_arg == nil then
      make[make_item](x, y)
    else
      make[make_item](x, y, make_item_arg)
    end

    --remove rocks hardness and sprite
    current_sprite.hard = true
    current_sprite:draw_hard()
    current_sprite.active = false
    dink.playsound(43, 22050, 0, nil, false)

    -- kill this item so it doesn't show up again for this player
    local hold = current_sprite.editor_sprite
    if hold ~= nil then
      hold.type = editor_type.KILL_COMPLETELY
    end
  end
end
