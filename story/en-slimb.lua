-- slime/puddle blue, medium

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    timing = 10,
    hitpoints = 25,
    exp = 14,
    base_walk = 650,
    base_death = 660,
    touch_damage = 3,
  }, {  
    651, 653,
    661, 663
  })
  
  if dink.random(2, 1) == 1 then
    current_sprite.target = player
  end
end

function touch()
  -- slurp noise
  dink.playsound(38, 18050, 6000, nil, false)
end

function hit(enemy_sprite)
  current_sprite.target = enemy_sprite
  --lock on to the guy who just hit us
  dink.playsound(38, 38050, 6000, player, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "small"
  )
end
