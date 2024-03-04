-- this script fills life up, touch_damage must be set to -1. (run script mode)

local items = include("_items")

function main()
  items.pulsate_item(53)
end

function touch()
  global.lifemax = global.lifemax + 10
  items.pickup_item(500)
  dink.playsound(22, 22050, 0, nil, false)
end
