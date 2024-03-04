-- script for chest with gold heart in it

local items = include("_items")

function main()
  dink.preload_seq(175)
end

function hit()
  items.open_chest(current_sprite, 175, 4, "papgold")
end
