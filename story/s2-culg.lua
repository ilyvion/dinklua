function main()
  current_sprite.hitpoints = 20
end

function talk()
  if dink.get_sprite_with_this_brain(brain.MONSTER_DIAGONAL, current_sprite) == nil then
    dink.playmidi("love.mid")

    player:freeze()
    current_sprite:freeze()

    player:say_stop("Mary, are you alright?")
    dink.wait(500)
    current_sprite:say_stop("`#Thanks to you.  Who are you?")
    dink.wait(500)
    
    local choice_menu = dink.create_choice_menu()
    choice_menu:add_choice("A friend of the land.")
    choice_menu:add_choice("A hero, in other words, your magic man.")
    choice_menu:add_choice("Your worst nightmare.")
    choice_menu:add_choice("The leader of another and more sadistic cult")
    choice_menu:show()

    dink.wait(500)
    current_sprite:say_stop("`#I see.  You will always be a hero to me.")
    dink.wait(500)
    player:say_stop("Time to go home.  Follow me.");
    player.can_walk_off_screen = true
    player:move(direction.SOUTH, 700, true)
    current_sprite:move(direction.SOUTH, 700, true)
    dink.script_attach(1000)
    dink.fade_down()
    misc.teleport(66, 320, 480)

    local mary = misc.create_sprite_initialized(320, 480, 0, 0, 0, {
      script = "s2-qgirl"
    })
    player:freeze()
    mary:freeze()
    volatile.mother:freeze()
    dink.fade_up()
    dink.wait(1500)

    cutscene.quick_cutscene({d = player, n = volatile.mother, m = mary}, {
      {"ac", "n", "5"},
      {"ac", "m", "#"},
      {"w", 0},
      {"msn", "d", 353},
      {"msne", "d", 391},
      {"w", 500},
      {"msw", "d", 388},
      {"ss", "n", "Why.. Dink.  What are you doing here?"},
      {"ss", "d", "I brought someone with me."},
      {"msn", "m", 292},
      {"ss", "m", "Mother!"},
      {"ss", "n", "Oh Mary!  You are home!"},
      {"ss", "m", "This man saved me from some naughty people!"},
      {"ss", "n", "Dink, thank you.  If you ever need anything, just ask."},
      {"ss", "d", "I was just doing my job, ma'am."},
    })

    global["s2-nad"] = 3
    global.story = 8
    dink.wait(500)
    mary:unfreeze()
    volatile.mother:unfreeze()
    player:unfreeze()
    player.can_walk_off_screen = false
    dink.kill_this_task()
  end

  local randy = dink.random(3, 1)
  if randy == 1 then
    current_sprite:say("`#Help me!")
  elseif randy == 2 then
    current_sprite:say("`#Save me!")
  else
    current_sprite:say("`#I wanna go home!")
  end
end

function hit()
  dink.playsound(12, 22050, 0, nil, false)
end

function die()
  global.life = 0
  player:say("Noooooooooooo!  The girl has died! I HAVE FAILED!!!!")
end
