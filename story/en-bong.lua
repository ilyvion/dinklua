-- Bonca..strong

local enemy = include("_enemy")

local function new_target()
  local mtarget = dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite)
  if mtarget ~= nil then
    current_sprite.target = mtarget
  end
end

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 2,
    nohit = false,
    distance = 50,
    frame_delay = 30,
    range = 30,
    timing = 0,
    exp = 120,
    base_walk = 600,
    base_death = 550,
    base_attack = 590,
    defense = 0,
    strength = 10,
    touch_damage = 5,
    hitpoints = 40
  }, {{"d", 600}, {"d", 550}, {"c", 590}})

  dink.wait(500)
  new_target()

  dink.set_callback_random("target", 2000, 0)
end

function target()
  local mtarget = current_sprite.target
  if mtarget == nil then
    -- get new target
    new_target()
  end
end

function hit(enemy_sprite)
  dink.playsound(29, 18050, 0, current_sprite, false)
  current_sprite.target = enemy_sprite
  -- lock on to the guy who just hit us
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES,
    "large"
  )
end

function attack()
  dink.playsound(31, 18050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(2000, 0)
end
