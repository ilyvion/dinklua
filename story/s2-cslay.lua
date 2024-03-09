-- slayer

local enemy = include("_enemy")

function main()
  dink.debug("Running cslay");
  local cs = cutscene.create_cutscene(500)
  cs:add_participant("d", player)
  cs:add_participant("n", current_sprite, "4")
  misc.preload_cardinal_seq(630)
  misc.preload_diagonal_seq(640)
  cs:scene({
    {"fza"},
    {"ass", {"n", "d"}, {
      "Not bad.. not bad at all.",
      "It's all over, Nelson.",
      {
        "Is it?",
        "I think you are about to be an important part of my new religion."
      },
      "And just what part is that?",
      "The martyr."
    }},
    {"w", 0},
    {"ufz", "n"},
    {"psound", 24, 22052, 0, nil, false},
  })
  misc.create_sprite_initialized(current_sprite.x, current_sprite.y, brain.KILL_SEQ_DONE, 167, 1, {
    seq = 167
  })
  misc.initialize_sprite(current_sprite, {
    brain = brain.MONSTER_DIAGONAL,
    speed = 1,
    distance = 70,
    range = 60,
    timing = 66,
    exp = 200,
    base_walk = 640,
    target = player,
    base_attack = 630,
    defense = 5,
    strength = 15,
    touch_damage = 5,
    hitpoints = 40,
    dir = direction.NORTH_EAST
  })

  player:unfreeze()
  volatile.mary:say("`#He's a slayer shapeshifter!  No!!!!")
end

function hit()
  current_sprite.target = player
  -- lock on to the guy who just hit us
  dink.playsound(28, 22050, 0, current_sprite, false)
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
  dink.unlock_screen()
end

function attack()
  dink.playsound(27, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
