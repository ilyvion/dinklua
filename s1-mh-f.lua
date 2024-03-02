function talk()
  if global.wizard_see > 3 then return end
  
  local cs = cutscene.create_cutscene(200)
  cs:add_participant("d", player)
  cs:add_participant("l", current_sprite, "0")
  cs:scene({
    {"fz", "d"},
    {"ss", "d", {
      "Hey, it's a scroll from Martridge!",
      "Let's see ..."
    }},
    {"ass", {"l"}, {
      {
        "Dear Dink,",
        "If you're able to see this then it means you",
        "truly do possess the ability for magic."
      },
      {
        "I unfortunately have been called away and cannot",
        "instruct you any further.  But there are many",
        "teachers out there, you will find one and further",
        "your training.",
      },
      "There are 200 gold pieces enclosed, spend them wisely."
    }},
    {"fn", nil, function() global.gold = global.gold + 200 end},
    {"ass", {"l", "d"}, {
      {
        "For now I leave you with this, your first spell.",
        "Enjoy it Dink, you've earned it."
      },
      "All right, my first spell! Maybe I can burn down some trees..."
    }}
  })

  dink.script_attach(1000);

  dink.playsound(22, 22050, 0, nil, false)
  global.wizard_see = 4
  current_sprite.brain_parm = 5
  current_sprite.brain = brain.BRAIN_PARM_SIZE_MATCH
  current_sprite.touch_damage = 0
  current_sprite.timing = 0
  global.magic = global.magic + 1
  dink.add_magic("item-fb", 437, 1);
  player:say_stop("I now have fireball magic!")

  player:unfreeze()
  dink.kill_this_task()
end
