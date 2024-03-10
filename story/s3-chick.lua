local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("w", current_sprite, "9")
end


function talk()
  if global.gobpass == 5 and global.mayor == 0 then
    current_sprite:say_stop("** FIXING BUG.. RESETTING GOBLIN VILLAGE **")
    return
  end

  player:freeze()
  current_sprite:freeze()
  
  local choice_menu = dink.create_choice_menu()

  local choice_hi = choice_menu:add_choice("Say hi")
  local choice_does = choice_menu:add_choice("Ask what she does")
  local choice_assault = choice_menu:add_choice("Tell her about the planned assault")
  choice_assault.condition = function() return global.mayor == 0 end
  local choice_since = choice_menu:add_choice("See what's happened since")
  choice_since.condition = function() return global.mayor == 3 end
  local choice_scroll = choice_menu:add_choice("Show her the scroll")
  choice_scroll.condition = function() return global.mayor == 4 end
  choice_menu:add_choice("Leave")
  
  local choice_result = choice_menu:show()
  dink.wait(400)

  if choice_result == choice_hi then
    cs:command("ass", {"d", "w"}, {
      "Hey, how's it going?",
      "Oh hi, pretty good.",
      "My name's Dink, pleasure to meet you.",
      "Hello Dink, I'm Christina.",
      "Just having a stroll around town?",
      "I was just taking a look at the town square.",
      "What for?",
      "For the big parade happening soon, what else silly?",
      "Ahh, yes.. I've ... heard of that parade."
    })
  elseif choice_result == choice_does then
    cs:command("ass", {"d", "w"}, {
      "So what do you do?",
      "Oh, I'm a painter.",
      "Ahh, I see.  What are you painting here?",
      "I hope to make a portrait of the parade happening soon.",
      "Hmm"
    })
  elseif choice_result == choice_assault then
    cs:command("ass", {"d", "w"}, {
      "You know, I've heard some things about this parade.",
      {
        "Yeah me too, everyone's happy as can be.",
        "The music can be heard all around the land."
      },
      {
        "Yeah well ...",
        "I've heard different things...",
        "Like that Cast Knights are planning to come and kill everyone here."
      },
      {
        "What...?",
        "You're kidding right?"
      },
      "Wish I was, but I heard it myself just outside of town.",
      "We're all gonna die!",
      "We've gotta call off the parade.",
      {
        "Wait no .. there's another answer.",
        "The Mayor, he knows some of the Royal guard of the land.",
        "If we can convince him, maybe we can save the parade.",
        "Follow me."
      }
    })
    global.mayor = 1
    local x, y = current_sprite.x, current_sprite.y
    cs.wait_time = 0
    if y < 200 then
      cs:command("mss", "w", 210)
    end
    if y > 322 then
      cs:command("mse", "w", 660)
    end
    if x < 500 then
      cs:command("mse", "w", 440)
    end
    if x > 500 then
      cs:command("mss", "w", 250)
    end
    cs:command("mse", "w", 660)
    cs:command("ufz", "d")
    cs:command("k", "w")
  elseif choice_result == choice_since then
    cs:command("ass", {"d", "w"}, {
      "Had any luck talking to people?",
      {
        "Not really, no one's been here.",
        "It's a yearly event and everyone knows when it is,",
        "they don't come beforehand, they just show up."
      },
      "That could be bad.",
      {
        "I did hear one rumor though.",
        "A man said he was traveling near the Goblin Sanctuary and one",
        "attacked him.  Very rare these days."
      },
      "That could be something, I'll check it out."
    })
  elseif choice_result == choice_scroll then
    cs:command("ass", {"d", "w"}, {
      {
        "Take a look at this!",
        "The Cast's battle plan for the city."
      },
      {
        "My god, look at this plan.",
        "They aren't even focusing their attack at the military",
        "they're attacking the whole populace here."
      },
      "We've got to stop them!",
      "Quick, get this information to my father ... hurry!"
    })
  end

  player:unfreeze()
  current_sprite:unfreeze()
end

function hit()
  dink.playsound(12, 22050, 0, nil, false)
  current_sprite:freeze()
  local say = dink.random(3, 1)
  if say == 1 then
    current_sprite:say_stop("`9Hey watch it sucka!")
  elseif say == 2 then
    current_sprite:say_stop("`9Help me, someone help me!")
  else
    current_sprite:say_stop("`9Guards, guards, tis a bloodbath!")
  end
  current_sprite:unfreeze()
end
