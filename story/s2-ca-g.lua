local enemy = include("_enemy")

local function enter()
  local gate = dink.get_editor_sprite(4).sprite
  gate.seq = 68
  dink.script_attach(1000)
  dink.wait(1000)
  dink.fade_down()
  misc.teleport(102, 314, 349);
  dink.fade_up()
  player:unfreeze()
  dink.kill_this_task()
end

function main()
  misc.initialize_sprite(current_sprite, {
    base_attack = 720,
    distance = 60,
    strength = 50,
    hitpoints = 100,
  })
end

function attack()
  dink.playsound(36, 22050, 0, current_sprite, false)
  current_sprite.attack_wait = dink.random(4000, 0)
end

function hit()
  if global.story > 15 then
    current_sprite:say("`2Nice, you win the game, then start killing guards?  Get 'em!")
  else
    current_sprite:say("`2The guy just hit me!  I am now going to kill him.")
  end
  
  current_sprite.timing = 0
  current_sprite.speed = 3
end

local choice_menu = dink.create_choice_menu()
local choice_castlehistory = choice_menu:add_choice("Ask about the history of the castle")
local choice_kinghistory = choice_menu:add_choice("Ask about the history of the King")
local choice_audience = choice_menu:add_choice("Request an audience with King Daniel")
local choice_leave = choice_menu:add_choice("Leave")

function talk()
  player:freeze()
  current_sprite:freeze()

  local choice_result = choice_menu:show()
  
  local cs = cutscene.create_cutscene(500)
  cs:add_participant("d", player)
  cs:add_participant("g", current_sprite, "2")
  
  if choice_result == choice_castlehistory then
    cs:command("ass", {"d", "g"}, {
      "Tell me about this grand castle, friendly Knight.",
      {
        "Castle Goodheart has stood here for centuries.",
        "It is a magnificent testament to what a monarchy can do."
      },
      "That castle actually doesn't look that big.",
      "It's bigger from the inside.",
      "Ah."
    })
  elseif choice_result == choice_kinghistory then
    cs:command("ass", {"d", "g"}, {
      "Tell me about our good King.",
      {
        "King Daniel has ruled with an iron hand for nearly a decade now.",
        "It was his strategic brilliance that stopped the Great Goblin invasion of '23."
      },
      "Did he kill them all?",
      "No.  After the war was won he created a special place for them to live in peace.",
      "Wow, quite a guy."
    })
  elseif choice_result == choice_audience then
    cs:command("ss", "d", "I must see the King at once.")
    if global.story < 9 then
      cs:command("ass", {"g", "d"}, {
        "And you are?",
        "Dink Smallwood."
      })
    end
    if global.story < 8 then
      cs:command("ss", "g", "I've never heard of you.  Please, go back to your village and play hero there.")
    elseif global.story == 8 then
      cs:command("ass", {"g", "d"}, {
        "Ah, the one that saved that little girl.  Nice work.",
        "So you will grant me access?",
        "I'm sorry, the King is otherwise engaged today."
      })
    elseif global.story == 9 then
      cs:command("ass", {"g", "d"}, {
        "Ah, the one that saved that little girl.  Nice work.",
        "I have news about a Cast plot!",
        "I'm sorry, the King is otherwise engaged today."
      })
    elseif global.story == 10 then
      cs:command("ass", {"g", "d"}, {
        "Hello, Smallwood.  Congratulations on foiling that attack in KernSin.",
        "It was no more than any other man would have done.",
        "But alas, the King is visiting abroad.",
        "Damn."
      })
    elseif global.story == 11 then
      cs:command("ass", {"g", "d"}, {
        "Hey, it's Sir Smallwood!",
        "So is the King home?",
        "No - He's seeing Milder off before his journey to the Darklands.",
        "Milder?",
        "Yes, Flatstomp is the bravest man in the kingdom.",
        "Grrrrrrr."
      })
    elseif global.story > 11 then
      cs:command("ss", "g", "Hello, Smallwood.  Of course you may see the King!")
      cs:command("ss", "g", "GUARD, OPEN THE GATE!")
      enter()
    end
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
  dink.script_attach(1000)
  dink.wait(500)
  player:say("Killing guards is fun!");
  dink.kill_this_task()
end
