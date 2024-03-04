-- this script fills life up, from a small food

local items = include("_items")

function main()
  current_sprite.touch_damage = -1
  current_sprite.nohit = true
end

function touch()
  player:say("Yum!")
  global.life = global.life + 3
  if global.life > global.lifemax then
    global.life = global.lifemax
  end
  items.pickup_item(10)
end
