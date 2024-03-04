-- big pillbug brain

local enemy = include("_enemy")

function main()
  enemy.initialize_enemy(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 3,
    nohit = false,
    exp = 50,
    base_walk = 130,
    base_death = 140,
    base_attack = -1,
    touch_damage = 4,
    hitpoints = 35
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
  dink.playsound(30, 17050, 4000, current_sprite, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "medium"
  )
end
