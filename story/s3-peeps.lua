local emake = include("_emake")

function main()
  -- people watching parade
  current_sprite.hitpoints = 20
  current_sprite.brain = brain.SMART_PEOPLE
end

function talk()
  local hi = dink.random(4, 1)
  if hi == 1 then
    current_sprite:say("`3Isn't this wonderful?")
  elseif hi == 2 then
    current_sprite:say("`3Not a very long parade was it...")
  elseif hi == 3 then
    current_sprite:say("`3This was even better than last year!")
  else
    current_sprite:say("`3What a great parade!")
  end
end

function hit()
  local hi = dink.random(4, 1)
  if hi == 1 then
    current_sprite:say("`3Help!  This man is going crazy!")
  elseif hi == 2 then
    current_sprite:say("`3Guards!!! Over here!!!")
  elseif hi == 3 then
    current_sprite:say("`3Help!! This Dink guy is no hero, he was behind the attack!")
  else
    current_sprite:say("`3Please sir... please...no!!!  Come on, help me fight this guy!")
    misc.initialize_sprite(current_sprite, {
      frame_delay = 50,
      brain = brain.MONSTER_DIAGONAL,
      touch_damage = 5,
      speed = 2,
      target = player
    })
  end
end

function die()
  if dink.get_sprite_with_this_brain(brain.SMART_PEOPLE, current_sprite) == nil then
    if dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite) == nil then
      -- no more brain 9 monsters here, lets unlock the screen
      dink.script_attach(1000)
      dink.wait(1000)
      player:say("Now, THAT'S entertainment!")
    end
  end

  emake.medium(current_sprite.x, current_sprite.y)
end
