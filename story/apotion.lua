-- adds one to all stats

local items = include("_items")

function main()
  dink.preload_seq(55)
  dink.preload_seq(56)
  dink.preload_seq(57)
  
  items.pulsate_item(75)
end

function touch()
  global.magic = global.magic + 1
  global.strength = global.strength + 1
  global.defense = global.defense + 1
  player:say("Megapotion!  All stats raised by one.")
  items.pickup_item(200)
end
