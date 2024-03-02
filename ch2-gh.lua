-- script for chest with gold heart in it

local items = include("_items")

function main()
  dink.preload_seq(177)
end

function hit()
  items.open_chest(current_sprite, 177, 6, "gheart")
end
