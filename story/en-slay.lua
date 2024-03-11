-- slayer

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    distance = 60,
    range = 45,
    frame_delay = 45,
    timing = 0,
    exp = 200,
    base_walk = 640,
    base_attack = 630,
    defense = 5,
    strength = 20,
    touch_damage = 10,
    hitpoints = 100,
  }, {{"c", 630}, {"d", 640}})
end

function hit(enemy_sprite)
  current_sprite.target = enemy_sprite
  --lock on to the guy who just hit us
  dink.playsound(28, 22050, 6000, current_sprite, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "xlarge"
  )
end

function attack()
  dink.playsound(27, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
