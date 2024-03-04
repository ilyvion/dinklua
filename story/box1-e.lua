-- script for box type 1 with nothing in it

local items = include("_items")

function main()
  dink.preload_seq(443)
end

function hit()
  items.break_box(current_sprite, 443)
end
