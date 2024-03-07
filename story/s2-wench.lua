-- script for wench

local function mainloop()
  while true do
    dink.wait(2500)
    current_sprite:unfreeze()
    if volatile.barkeep.custom.guards > 0 then
      current_sprite.speed = 2
      current_sprite.timing = 0
      -- Phoenix: fix for the barfight
      goto continue
    else
      current_sprite.speed = 1
      current_sprite.timing = 33
    end

    local myrand = dink.random(50, 1)
    if myrand <= 4 then
      current_sprite:freeze()
      if myrand == 1 then
        current_sprite:say_stop_npc("`#Another round over here?")
      elseif myrand == 2 then
        current_sprite:say_stop_npc("`#I'm so tired.. arg.")
      elseif myrand == 3 then
        current_sprite:say_stop_npc("`#My feet hurt..")
      else
        current_sprite:say_stop_npc("`#Can I take a break, boss?")
        if volatile.barkeep.custom.busy == 0 then
          volatile.barkeep:say_stop_npc("`4Did hell freeze over?")
        end
      end
    end

    ::continue::
  end
end

function main()
  misc.preload_diagonal_seq(220)

  misc.initialize_sprite(current_sprite, {
    brain = brain.SMART_PEOPLE,
    base_walk = 220,
    speed = 1,

    -- set starting pic
    pseq = 223,
    pframe = 1
  })

  mainloop()
end

function hit()
  current_sprite:freeze()
  dink.wait(400)
  current_sprite:say_stop_npc("`#Look with your eyes, not with your hands, honey.")
  dink.wait(800)
  mainloop()
end

function talk()
  local cs = cutscene.create_cutscene(400)
  cs:add_participant("d", player)
  cs:add_participant("w", current_sprite, "#")

  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_date = choice_menu:add_choice("Ask for a date")
  local choice_belittle = choice_menu:add_choice("Belittle her in front of the others to appear macho")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_date then
    if global.story > 15 then
      cs:command("ass", {"d", "w"}, {
        "Wanna go get some food later?",
        "Oh yes!  Hey, hero Smallwood just asked me out!",
        "Ah, it's going to be easy to get used to this..."
      })
    else
      cs:command("ass", {"d", "w"}, {
        "Wanna go get some food later?",
        "Sorry, I'm working later.",
        "Ah."
      })
    end
  elseif choice_result == choice_belittle then
    cs:command("ass", {"d", "w"}, {
      "Hey wench!  How much is the beer here?",
      "Two gold, sir.",
      "How much for you?",
      "I'm not for sale, you lout!",
      "Come on honey, I got three gold jingling in my pocket!",
      "Get LOST!"
    })
  end

  player:unfreeze()
  mainloop()
end
