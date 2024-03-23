-- this script fills life up, touch_damage must be set to -1. (run script mode)

local items = include("_items")

function main()
  current_sprite.pseq = 178
  current_sprite.frame = 4
  current_sprite.touch_damage = -1
  current_sprite.nohit = true
end

function touch()
  local mcrap = 1
  global.gold = global.gold + mcrap
  player:say("I found "..mcrap.." gold.")
  items.pickup_item(10)
end
