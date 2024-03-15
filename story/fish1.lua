-- script for fish to jump out of water randomly, and be killed.

local enemy = include("_enemy")

local function mainloop()
  while true do
    -- can't be hit or seen yet
    current_sprite.nohit = true
    current_sprite.nodraw = true

    -- random wait
    dink.wait(dink.random(6000, 0))
    dink.playsound(35, 20000, 3000, current_sprite, false)

    -- let's splash around
    current_sprite.nohit = false
    current_sprite.nodraw = false
    current_sprite.seq = 434
    dink.wait(700)

    -- create splash sprite where fish is
    local x, y = current_sprite.x - 30, current_sprite.y + 1
    misc.create_sprite_initialized(x, y, brain.KILL_SEQ_DONE, 0, 0, {
      nohit = true,
      seq = 433
    })
  end
end

function main()
  misc.initialize_sprite(current_sprite, {
    frame_delay = 110,
    hitpoints = 25,
    size = 100,
    brain = brain.MONSTER_DIAGONAL,
  }, {434, 433})
  current_sprite:freeze()

  mainloop()
end

function die()
  -- let's give 'em a random amount of exp, what fun!
  dink.add_exp(dink.random(100, 50), current_sprite)

  current_sprite.brain = brain.NONE

  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )

  current_sprite.active = false
end
