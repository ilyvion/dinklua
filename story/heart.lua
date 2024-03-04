-- this script fills life up, touch_damage must be set to -1. (run script mode)

local items = include("_items")

function main()
  items.pulsate_item(52)
end

function touch()
  global.life = global.lifemax
  items.pickup_item(5)
end
