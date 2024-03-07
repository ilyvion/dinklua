local function mainloop()
  local cs = cutscene.create_cutscene()
  cs:add_participant("m1", volatile.man1, "3")
  cs:add_participant("m2", current_sprite, "0")
  cs:add_participant("b", volatile.barkeep, "4")
  while true do
    dink.wait(2000)
    -- Phoenix: fix for the barfight
    if volatile.barkeep.custom.guards > 0 then
      if dink.random(5, 1) == 1 then
        current_sprite:say_stop_npc("`0Fight!!!")
      end
      goto continue
    end

    local myrand = dink.random(8, 1)
    if myrand == 1 then
      current_sprite.pseq = 411
    elseif myrand == 2 then
      current_sprite.pseq = 413
    end

    myrand = dink.random(28, 1)
    if myrand == 1 then
      cs:command("ssn", "m1", "Nathan, how about another story?")
      cs:command("ssn", "m2", {
        "Alright.",
        "One time I was fighting this dragon...",
        "As I was about to deliver the death blow....",
        "He begged me for his life.  Have you ever seen a dragon cry?"
      })
      dink.wait(400)
      cs:command("ssn", "m1", "Nope.")
      dink.wait(400)

      if volatile.barkeep.custom.busy == 0 then
        cs:command("ssn", "b", "Haw, those old codgers are so full of it...")
      end
      
      cs:command("assn", {"m2", "m1"}, {
        "Anyway, it wasn't pretty so I killed him.",
        "And just where did you see a Dragon?",
        "Uh.. Joppa Isle!",
        "Liar.. Joppa Isle doesn't exist, it's a story for kids."
      })
    elseif myrand == 2 then
      cs:command("assn", {"m2", "m1"}, {
        "Did I ever tell you about the time I trained a slayer?",
        "You trained a slayer!?!",
        "Yup.  I raised him from when he was a pup.  He would do anything I told him to.",
        "Where is he now??!", 
        "Had to kill 'em.  Ever had slayer meat?"
      })

      if volatile.barkeep.custom.busy == 0 then
        cs:command("assn", {"b", "m2"}, {
          "Give me a break...",
          "It tastes better than what you serve here, barkeep!",
          "I'll make a note of that..."
        })
      end
    elseif myrand == 3 then
      cs:command("assn", {"m2", "m1"}, {
        "Then there was the time I found a magic scroll",
        "Oh yeah?",
        {
          "Sure did, some strange fire spell it was.",
          "I may have helped that big fire back a few seasons ago.",
          "Quite toasty things got!"
        },
        "Whatever, you've had too much to drink."
      })
    elseif myrand == 4 then
      cs:command("assn", {"m2", "m1"}, {
        "You wanna go hunting?",
        "Sure I guess, why you wanna go hunting?",
        "I hear there's a cave to the northeast with quite a catch inside it.",
        "I don't know..."
      })
    end

    ::continue::
  end
end

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.NONE,
    base_walk = 410,
    speed = 0,

    -- set starting pic
    pseq = 411,
    pframe = 1
  }, {
    411, 413
  })
  mainloop()
end

function hit()
  dink.wait(400)
  current_sprite:say_stop_npc("`0You'd best learn some manners quickly, boy.")
  dink.wait(800)
  mainloop()
end

function talk()
  player:freeze()
  
  local cs = cutscene.create_cutscene()
  cs:add_participant("d", player)
  cs:add_participant("m1", volatile.man1, "3")
  cs:add_participant("m2", current_sprite, "0")
  cs:add_participant("b", volatile.barkeep, "4")
  
  local choice_menu = dink.create_choice_menu()

  local choice_valor = choice_menu:add_choice("Impress the men with your tales of valour")
  choice_valor.condition = function() return global["s2-milder"] == 0 end
  local choice_convince = choice_menu:add_choice("Convince the men that you ARE a warrior")
  choice_convince.condition = function() return global["s2-milder"] == 1 end
  local choice_argue = choice_menu:add_choice("Argue with the men even more")
  choice_argue.condition = function() return global["s2-milder"] == 2 and global.story < 8 end
  local choice_chat = choice_menu:add_choice("Chat with the men")
  choice_chat.condition = function() return global["s2-milder"] == 2 and global.story > 7 end
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_valor then
    -- scene with Milder
    misc.preload_diagonal_seq(400)

    cs:scene({
      {"w", 500},
      {"ss", "d", "Greetings men.  I bring stories of my adventures from the East."},
      {"fn", "m2", function(m2) m2.pseq = 413 end},
      {"ss", "m2", "Oh really?  And who might you be?"},
      {"ss", "d", "My name is Dink Smallwood.  I am a warrior!"},
      {"fn", "m1", function(m1) m1.pseq = 349 end},
      {"ss", "m1", "You've had adventures, eh?"},
      {"ss", "d", "Oh yes.  Once, I was in this really scary cave..."},
      {"ss", "m2", "Yes, go on!"},
      {"ss", "d", "Next thing I knew I was face to face with a huge monster..."},
      {"pmidi", "bullythe.mid"},
    })

    local milder = misc.create_sprite_initialized(261, 440, brain.NONE, 0, 0, {
      base_walk = 400,
      speed = 1,
      timing = 0,
    })
    cs:add_participant("m", milder, "6")

    cs:scene({
      {"msne", "m", 420},
      {"msnw", "m", 386},
      {"w", 300},
      {"ss", "m", "What nonsense is this pig farmer filling your heads with?"},
      {"ss", "m2", "He's a PIG FARMER?!"},
      {"dir", "d", "e"},
      {"ss", "d", "Damn you, Milder!  What are you doing here?"},
      {"msw", "m", 300},
      {"ss", "m", "Just passing through... what are you doing away from the farm?"},
      {"ss", "m1", "Farm?!  What a loser!"},
      {"dir", "d", "w"},
      {"ss", "d", "I don't tend pigs anymore, I'm a mighty warrior."},
      {"ss", "m2", "Oh hogwash!"},
      {"w", 0},
      {"say", "m1", "Hahahah!"},
      {"w", 400},
      {"ss", "m", "Hahaha!  Good one, peasant!"},
      {"ss", "d", "That IS NOT funny."},
      {"ss", "m2", "I'm sorry Dink.. I'll make it up by buying you a drink."},
      {"ss", "d", "Great, what kind?"},
      {"ss", "m2", "Is a bottle of SWINE ok? Bawahahah!"},
      {"w", 0},
      {"say", "m1", "Hahahah!"},
      {"w", 200},
      {"ss", "m", "Hahaha!"},
      {"ss", "d", "You stupid rubes!  I hate you both!"},
      {"ss", "m", "This has been fun, pig boy, but I have REAL adventuring to do.  See ya."},
      {"w", 0},
      {"msse", "m", 370},
      {"mssw", "m", 210},
      {"pmidi", "5.mid"},
      {"w", 400},
      {"ss", "m2", "He said pig boy..."},
      {"w", 0},
      {"say", "m1", "Hahahah!"},
      {"w", 400},
      {"say", "m2", "Hahaha!"},
    })
    cs:remove_participant("m")
    global["s2-milder"] = 1
  elseif choice_result == choice_convince then
    cs:scene({
      {"w", 500},
      {"ss", "d", "Look... My farming days are over, ok?"},
      {"ss", "m2", "Ok, you really want some adventure?"},
      {"ss", "d", "Oh yes!"},
      {"ss", "m2", "Go plow Harper's field, farmer boy."},
      {"w", 0},
      {"say", "m1", "Hahahah!"},
      {"w", 500},
      {"ss", "m2", "Hahahah!"},
      {"ss", "d", "How 'bout I plow your momma?"},
    })
    global["s2-milder"] = 2
  elseif choice_result == choice_argue then
    cs:scene({
      {"w", 500},
      {"ss", "d", "Look..."},
      {"ss", "m2", "Save it boy, come back when you've done something important."},
    })
  elseif choice_result == choice_chat then
    cs:scene({
      {"w", 500},
      {"ss", "m2", "Hey, it's Dink!  Great job on saving that girl!"},
      {"ss", "m1", "I told you he had the makings of a hero!"},
      {"ss", "d", "Actually, didn't you both laugh at me and such?"},
      {"ss", "m2", "No.  That was uh, two other guys..."},
    })
  end

  player:unfreeze()
  mainloop()
end
