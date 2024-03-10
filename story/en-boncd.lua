-- Bonca.. medium strength

local bonc = include("en-bonc")

function main()
  bonc.main()
  
  local mtarget = dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite)
  if mtarget ~= nil then
    current_sprite.target = mtarget
  end
end

function hit(enemy_sprite)
  bonc.hit(enemy_sprite)
end

function die()
  bonc.die()
end

function attack()
  bonc.attack()
end
