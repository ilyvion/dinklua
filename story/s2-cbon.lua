-- Bonca.. medium strength

local enemy = include("_enemy")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    distance = 50,
    timing = 33,
    exp = 20,
    base_walk = 530,
    base_death = 550,
    base_attack = 540,
    defense = 3,
    strength = 8,
    touch_damage = 4,
    hitpoints = 20,
    target = player
  }, {{"d", 530}, {"d", 550}, {"c", 540}})
end

function hit()
  dink.playsound(29, 22050, 0, current_sprite, false)
  current_sprite.target = player
  -- lock on to the guy who just hit us
end

function die()
  if dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite) == nil then
    dink.debug("Ok, all monsters are dead.")
    volatile.nelson.script = "s2-cslay"
    dink.debug("Aw yeah.")
  end

  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "medium"
  )
end

function attack()
  current_sprite.target = player
  dink.playsound(31, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
