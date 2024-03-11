-- goblin with axe

local gs = include("en-gs")

main = gs.main
hit = gs.hit
talk = gs.talk
attack = gs.attack

function die()
  gs.die()

  if global.gobpass == 1
  and dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite) == nil
  and dink.get_sprite_with_this_brain(brain.SMART_PEOPLE, current_sprite) == nil then
    -- no more brain 9 or 16 monsters here, lets introduce 'mog'
    dink.spawn("s3-mog")
  end
end
