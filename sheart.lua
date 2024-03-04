-- this script fills life up, touch_damage must be set to -1. (run script mode)

local items = include("_items")

function main()
  items.pulsate_item(54)
end

function touch()
  global.life = global.life + 3
  if global.life > global.lifemax then
    global.life = global.lifemax
  end
  items.pickup_item(10)
end
