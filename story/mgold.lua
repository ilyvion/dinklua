-- this script fills life up, touch_damage must be set to -1. (run script mode)

local items = include("_items")

function main()
  items.shiny_item(178, 4)
end

function touch()
  local mcrap = dink.random(30, 5)
  global.gold = global.gold + mcrap
  player:say("I found "..mcrap.." gold.")
  items.pickup_item(10)
end
