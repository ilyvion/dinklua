--this script is for the red potion

local items = include("_items")

function main()
  items.pulsate_item(56)
end

function touch()
  global.strength = global.strength + 1
  items.pickup_item(5)
end
