-- script for box type 2 with spotion in it

local items = include("_items")

function main()
  dink.preload_seq(444)
end

function hit()
  items.break_box(current_sprite, 444, "spotion")
end
