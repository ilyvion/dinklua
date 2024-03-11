-- Goblin George

local enemy = include("_enemy")
local gh = include("s3-gh")

function main()
  gh.main()
  current_sprite.exp = 50
  current_sprite.defense = 2
  current_sprite.touch_damage = 0

  cs = cutscene.create_cutscene(500)
  cs:add_participant("d", player)
  cs:add_participant("g", current_sprite, "6")

  cs:command("say", "g", "heeloo, freen.  We kan took tegether?")
end

function hit()
  dink.playsound(28, 22050, 0, current_sprite, false)
  misc.initialize_sprite(current_sprite, {
    frame_delay = 30,
    timing = 0,
    speed = 2,
    brain = brain.MONSTER_DIAGONAL
  })

  local mcounter = dink.random(3, 1)
  if mcounter == 1 then
    cs:command("say", "g", "osh!  Puheaze hooman! We chan bey freens!")
  elseif mcounter == 2 then
    cs:command("say", "g", "doon hort meeee!")
  else
    cs:command("say", "g", "i won oose vilens!")
  end
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_COMPLETELY
  )
  cs:command("say", "d", "Let that be a clear message to his people.  Haw!")
end

function talk()
  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_name = choice_menu:add_choice("Ask the Goblin's name")
  local choice_here = choice_menu:add_choice("Ask what he is doing way out here")
  local choice_sanctuary = choice_menu:add_choice("Ask about the Goblin Sanctuary")
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_name then
    cs:command("ass", {"d", "g"}, {
      "What is your name, Goblin?",
      "my nam is george.  whe kin bey gud frins?",
      "I don't understand a thing you're saying."
    })
  elseif choice_result == choice_here then
    cs:command("ass", {"d", "g"}, {
      "Say, why aren't you in the Goblin sanctuary?",
      "i wans tu leaf weth hoomankind.",
      "Many people are afraid of goblins, you know.",
      "george is hoomankind.",
      "Ah, I see.  Good luck to you."
    })
  elseif choice_result == choice_sanctuary then
    cs:command("ass", {"d", "g"}, {
      "So what's with that Goblin Sanctuary place?",
      "they ar BAD.  they can oonly anderstund ONE theng.",
      "And just what thing is that?  I may need to know this.",
      "voilense.  too summon mog yoo mus KILL many guuards.",
      "Ah.  I'm not entirely sure who Mog is but..uh thanks."
    })
  end

  player:unfreeze()
  current_sprite:unfreeze()
end
