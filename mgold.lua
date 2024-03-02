-- this script fills life up, touch_damage must be set to -1. (run script mode)

function main()
  current_sprite.pseq = 178
  current_sprite.frame = 4 -- so the seq will start
  --current_sprite.brain = brain.REPEAT
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

function touch()
  local mcrap = dink.random(30, 5)
  global.gold = global.gold + mcrap
  player:say("I found "..mcrap.." gold.")
  current_sprite.brain_parm = 10
  current_sprite.brain = brain.BRAIN_PARM_SIZE_MATCH
  current_sprite.touch_damage = 0
  current_sprite.timing = 0

  -- kill this item so it doesn't show up again for this player
  local hold = current_sprite.editor_sprite
  if hold ~= nil then
    hold.type = editor_type.KILL_COMPLETELY
  end
end
