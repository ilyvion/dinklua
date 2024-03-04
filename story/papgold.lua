local items = include("_items")

function main()
  items.shiny_item(178, 4)
end

function touch()
  global.gold = global.gold + 200
  player:say("I found 200 gold.")
  items.pickup_item(10)
end
