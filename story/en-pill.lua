-- pillbug brain

local enemy = include("_enemy")
local misc = include("_misc")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    exp = 5,
    base_walk = 130,
    base_death = 140,
    touch_damage = 1,
    hitpoints = 8
  }, {  
    131, 133,
    141, 143
  })
  
  if dink.random(2, 1) == 1 then
    current_sprite.target = player
  end
end

function hit(enemy_sprite)
  current_sprite.target = enemy_sprite
  dink.playsound(30, 21050, 4000, current_sprite, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "small"
  )
end
