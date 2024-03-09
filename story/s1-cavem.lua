function main()
  dink.debug("Wizard see is "..global.wizard_see)
  
  if global.wizard_see < 2 or global.wizard_see > 2 then
    current_sprite.active = false
    return
  end
  -- fixed Pap's error here!!!
  
  misc.initialize_sprite(current_sprite, {
    distance = 50,
    base_attack = 540,
    base_walk = 530,
    strength = 5,
    touch_damage = 2,
    hitpoints = 35,
    exp = 100
  }, {{"d", 540}, {"d", 530}})
  local mcrap = dink.get_editor_sprite(36).sprite
  if mcrap ~= nil then
    -- duck is still alive, lets have the monster target it for fun
    current_sprite.target = mcrap
  else
    -- if no duck, Dink becomes the new target!
    current_sprite.target = player
  end
  
  dink.playmidi("battle.mid")
  local bot = dink.random(2, 1)
  if bot == 1 then
    bot = dink.random(3, 1)
    if bot == 1 then
      current_sprite:say_stop("`3Who dares enter my cave?")
    elseif bot == 2 then
      current_sprite:say_stop("`3I sense someone in my domain.")
    elseif bot == 3 then
      current_sprite:say_stop("`3I feel I'm threatened ...")
    end
  end
end

function die()
  current_sprite:freeze()
  current_sprite.seq = 0
  global.wizard_see = 3
  dink.playsound(29, 17050, 0, nil, false)
  --make mini explosions?
  dink.playmidi("wanderer.mid")
  
  dink.wait(2000)
  --draw dead body
  --dink.kill_this_task()
end

function hit()
  dink.playsound(29, 22050, 0, current_sprite, false)
end

function attack()
  dink.playsound(31, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end
