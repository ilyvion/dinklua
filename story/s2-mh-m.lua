local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("c", current_sprite, "0")

  cs:scene({
    {"fza"},
    {"ass", {"c", "d"}, {
      "Welcome young BallWood.",
      "It's Smallwood sir.",
      "Yes, now what did you want?"
    }},
    {"ufza"},
  })
end

local function grant_magic(now)
  cs:scene({
    {"ss", "c", "I sense you are powerful enough "..now.."Tallwood."},
    {"ss", "c", "You will "..now.."understand the Acid Rain magic."},
    {"ss", "d", "Rain?  Rain is the big magic you will teach?"},
    {"ss", "c", "Scoff not child or you shall burn and kill yourself with it!"},
  })
  
  -- Give magic here
  dink.add_magic("item-ice", 437, 5);

  --[[
    SETH!!!
    Give magic here
    This magic will allow Dink to free the guy in the cave ..
    Even though the guy only walks a few feet to be killed again anyway...
    Ooops
  ]]
  dink.playsound(22, 22050, 0, nil, false)
  global.caveguy = 4
  player:say_stop("I now have Rain Magic.  Yay.");
end

function talk()
  cs:command("fza")
  
  if global.caveguy == 2 then
    cs:scene({
      {"w", 250},
      {"ss", "d", "Please.  Teach me some incredibly strong sorcerous enchantment!"},
      {"ss", "d", "Er, to help the man trapped in the dungeon I mean."},
    })
    if global.magic > 4 then
      grant_magic("")
    else
      cs:scene({
        {"ss", "c", "I'm sorry Smallweed, but your magic is not powerful enough yet."},
        {"ss", "c", "You must have at least 5 magic for the new spell."},
      })
      global.caveguy = 3
    end
  elseif global.caveguy == 3 then
    -- First check him
    if global.magic > 4 then
      grant_magic("now ")
    else
      cs:scene({
        {"ss", "c", "You are still not powerful enough Brickwood."},
        {"ss", "d", "Smallwood sir."},
        {"ss", "c", "You need 5 magic for this spell."},
        {"dir", "d", "s"},
        {"ss", "d", "Aww man."},
      })
    end
  else
    cs:scene({
      {"ss", "d", "Hey Mister, you know anymore magic you can teach me?"},
      {"ss", "c", "No Smallwood, I'm too old and tired anyway."},
      {"ss", "d", "Ok, no problem... and my name isn't.. oh."},
    })
  end

  cs:command("ufza")
end
