-- Bonca.. medium strength

local bonc = include("en-bonc")

function main()
  bonc.main()
  
  local mtarget = dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite)
  if mtarget ~= nil then
    current_sprite.target = mtarget
  end
end

hit = bonc.hit
die = bonc.die
attack = bonc.attack
