-- this script fills magic

local items = include("_items")

function main()
  items.pulsate_item(57)
end

function touch()
  global.magic = global.magic + 1
  items.pickup_item(5)
end
