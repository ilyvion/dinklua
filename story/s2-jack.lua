local aunt = include("s2-aunt")

function main()
  misc.preload_diagonal_seq(340)

  if global["s2-aunt"] > 2 then
    current_sprite.hitpoints = 50
  end

  misc.initialize_sprite(current_sprite, {
    base_walk = 340,
    speed = 1,
    pseq = 341,
    pframe = 1,
    brain = brain.SMART_PEOPLE
  })
end

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("j", current_sprite, "6")
  cs:add_participant("m", volatile.aunt, "#")
  aunt.add_punch_commands(cs)
  
  local choice_menu = dink.create_choice_menu()

  local choice_hi = choice_menu:add_choice("Say hi to Jack")
  choice_hi.condition = function() return global["s2-aunt"] == 1 end
  local choice_thank = choice_menu:add_choice("Thank Jack for his hospitality")
  choice_thank.condition = function() return global["s2-aunt"] == 1 end
  local choice_rude = choice_menu:add_choice("Say something rude to Jack")
  choice_rude.condition = function() return global["s2-aunt"] == 1 end
  local choice_layoff = choice_menu:add_choice("Tell Jack to lay off Maria")
  choice_layoff.condition = function() return global["s2-aunt"] == 3 end
  local choice_coerce = choice_menu:add_choice("Coerce Jack into hitting Maria again")
  choice_coerce.condition = function() return global["s2-aunt"] == 3 end
  
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_hi then
    cs:command("ass", {"d", "j"}, {
      "Hi Jack! Whacha doing?",
      "Get lost."
    })
  elseif choice_result == choice_thank then
    cs:command("ass", {"d", "j"}, {
      "It's real nice of you letting me stay here and all.",
      "<grumble>  You find a new place tomorrow."
    })
  elseif choice_result == choice_rude then
    cs:command("ass", {"d", "j"}, {
      "Hey Jack!",
      "Yeah?",
      "Eat me!",
      "Why you little!!  Take this!"
    })
    misc.initialize_sprite(current_sprite, {
      touch_damage = 10,
      speed = 2,
      brain = brain.MONSTER_DIAGONAL,
      target = player
    })
  elseif choice_result == choice_layoff then
    cs:command("ass", {"d", "j"}, {
      "Jack.  I know I'm your guest and all but...",
      "Yeah?",
      "If you touch Maria again, you won't live to see tomorrow.",
      "How about I touch you right now?",
      "Sorry, not into that.  But I know this guy named Milder..."
    })
  elseif choice_result == choice_coerce then
    cs:scene({
      {"ass", {"d", "j"}, {
        "Jack.  Guess who was badmouthing you a second ago...",
        "My bitch wife?",
        "Yup.  Better lay a bit o law into her, if you know what I mean.",
        "Ok."
      }},
      {"w", 0},
      {"msn", "j", 140},
      {"mss", "j", 140},
      {"msw", "j", 255},
      {"mse", "j", 256},
      {"w", 500},
      {"ss", "j", "`6Oh honey.. could you come here a sec?"},
      {"fn", "d", function(cs, d)
        if player.x < 255 then
          player.dir = direction.EAST
        elseif player.y > 310 then
          player.dir = direction.WEST
        elseif player.y < 140 then
          player.dir = direction.SOUTH
        else
          player.dir = direction.NORTH
        end
      end},
      {"fz", "m"},
      {"w", 0},
      {"ss", "m", "Yes, Jack."},
      {"msn", "m", 140},
      {"mss", "m", 140},
      {"mse", "m", 310},
      {"w", 500},
      {"msw", "m", 309},
      {"ss", "m", "What is it?"},
      {"ss", "j", "Just this"},
      {"w", 100},
      {"pl", 309, 100, 17050},
      {"pr", 309, 100, 22050},
      {"pl", 309, 100, 17050},
      {"w", 500},
      {"pr", 309, 100, 22050},
      {"ss", "d", "Haw!  Good one Jack!"},
      {"ss", "j", "Now go clean up."},
      {"ss", "m", "<sob>  Dink... I..thought you were different."},
      {"ss", "d", "Get a clue, honey.  How do you think I kept my mom in line?  Haw!"},
      {"ufz", "m"}
    })
  end
  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  current_sprite:say("Oh, NOW YOU'VE DONE IT!")
  misc.initialize_sprite(current_sprite, {
    touch_damage = 10,
    speed = 2,
    brain = brain.MONSTER_DIAGONAL,
    target = player
  })
end

function die()
  dink.script_attach(1000)
  player:freeze()
  volatile.aunt:freeze()
  dink.wait(500)
  volatile.aunt:say_stop("`#Dink!  What have you done!")
  dink.wait(500)
  player:say_stop("I guess I just killed your husband.")
  dink.wait(500)
  volatile.aunt:say_stop("`#Jack wasn't always like that.  He used to be.. <bursts into tears>")
  dink.wait(500)
  player:say_stop("I know.  It's ok, I'm here now.");
  global.exp = global.exp + 100
  global["s2-aunt"] = 4
  player:unfreeze()
  volatile.aunt:unfreeze()
end
