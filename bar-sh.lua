-- script for barrel with small heart in it

local items = include("_items")

function main()
  dink.preload_seq(173)
  dink.preload_seq(54)
end

function hit()
  items.break_barrel(current_sprite, "sheart")
end

