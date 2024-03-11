local cs

local function mainloop()
  while true do
    if dink.get_sprite_with_this_brain(brain.DUCK, current_sprite) == nil then
      -- no more brain 3 (ducks) on the screen.
      if dink.random(4, 1) == 1 then
        local force = dink.random(4, 1)
        if force == 1 then
          cs:command("say", "f", "Where are you, little guys?")
        elseif force == 2 then
          cs:command("say", "f", "My ducks!!!!!!!! ALL DEAD!!!!!!! DAMN YOU!")
        elseif force == 3 then
          cs:command("say", "f", "GET OUT OF HERE!!!!!")
        else
          cs:command("say", "f", "There go my chances of impressing the Mayor's daughter!!!!")
        end
      end
    else
      if dink.random(4, 1) == 1 then
        local force = dink.random(4, 1)
        if force == 1 then
          cs:command("say", "f", "This parade is gonna rule!!!")
        elseif force == 2 then
          cs:command("say", "f", "I love my ducks.")
        elseif force == 3 then
          cs:command("say", "f", "Ready for our act little pals?")
        else
          cs:command("say", "f", "Gettin' ready to rock!!")
        end
      end
    end
    cs:scene({
      {"w", 0},
      {"mse", "f", 530},
      {"msw", "f", 100}
    })
  end
end

local duck1, duck2, duck3, duck4

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("f", current_sprite, "9")

  if dink.get_sprite_with_this_brain(brain.DUCK, current_sprite) == nil then
    cs:command("say", "f", "Muderer!")
  else
    duck1 = dink.get_editor_sprite(33).sprite
    duck2 = dink.get_editor_sprite(34).sprite
    duck3 = dink.get_editor_sprite(35).sprite
    duck4 = dink.get_editor_sprite(36).sprite
  end

  current_sprite.frame_delay = 30
  mainloop()
end

function talk()
  if dink.get_sprite_with_this_brain(brain.DUCK, current_sprite) == nil then
    cs:command("ss", "f", "Get lost!! You have completely destroyed my act!")
    mainloop()
  end
  
  cs:scene({
    {"fza"},
    {"ss", "f", "What do you want man?  I gotta keep moving!"}
  })

  local choice_menu = dink.create_choice_menu()

  local choice_running = choice_menu:add_choice("Ask why he's running")
  choice_running.condition = global.mayor < 6
  local choice_ducks = choice_menu:add_choice("Ask about the ducks")
  choice_ducks.condition = global.mayor < 6
  local choice_parade = choice_menu:add_choice("Ask about the parade")
  choice_parade.condition = global.mayor > 5
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_running then
    cs:command("ass", {"d", "f"}, {
      "Why are you running around so fast?",
      "Cause I'm excited!!",
      "About what?",
      {
        "The big parade happening soon man!!",
        "It's gonna rock!!!!!!"
      }
    })
  elseif choice_result == choice_ducks then
    cs:command("ass", {"d", "f"}, {
      "What's with all the ducks?",
      "Oh, they're my pets.  We're gonna be in the parade together.",
      "I see ...",
      "Wanna see what we do?",
      "Not really.",
      {
        "Okay, here it goes ...",
        "Ready guys?  Follow me!"
      }
    })
    duck1.follow = current_sprite
    duck2.follow = current_sprite
    duck3.follow = current_sprite
    cs:scene({
      {"w", 0},
      {"msw", "f", 100},
      {"mse", "f", 530},
      {"say", "d", "Hey.."},
      {"msw", "f", 100},
      {"mse", "f", 300},
      {"w", 250},
      {"ass", {"f", "d"}, {
        "Yeah?",
        "What's with that other one?",
        {
          "Oh ...",
          "he has issues."
        }
      }},
      {"w", 100},
      {"wn", 750},
      {"ufz", "f"},
      {"dir", "d", "s"},
      {"ss", "d", "Oh boy ..."}
    })
  elseif choice_result == choice_parade then
    cs:scene({
      {"ass", {"d", "f"}, {
        "Soooo ... didn't see you at the parade.",
        {
          "Oh .. hehe .. yeah, I uhh ... I ...",
          "one of the ducks got sick, and well .. we couldn't perform."
        }
      }},
      {"w", 0},
      {"dir", "d", "s"},
      {"wn", 1000},
      {"dir", "d", "w"},
      {"w", 250},
      {"ass", {"d", "f"}, {
        "I'm sure.  That's too bad, after all that practice.",
        {
          "Well hey, don't worry ...",
          "we're practicing for next year."
        },
        "Aww man..."
      }},
      {"w", 0},
      {"ufz", "f"},
      {"wn", 500},
      {"dir", "d", "s"},
      {"ss", "d", "Note to self:  Don't come here next year."}
    })
  end

  player:unfreeze()
  current_sprite:unfreeze()
  mainloop()
end
