--sack of grain

local items = include("_items")

function main()
  current_sprite.touch_damage = -1
end

function hit()
  player:say("I hate you, sack of feed!")
end

function talk()
  player:say("A big sack.")
end

function touch()
  items.pickup_item(10)
  dink.add_item("item-pig", 438, 2)
  player:say("I now have a sack of pig feed.")
end
