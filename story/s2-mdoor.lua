function touch()
  player:freeze()
  player:move_stop(direction.EAST, 300, 1)
  player.dir = direction.WEST

  if global.caveguy == 2 then
    player:say_stop("This looks like the place, but it's locked.")
    player:say_stop("Maybe I should try knocking..")
  elseif global.caveguy == 3 then
    player:say_stop("I hope that damn old man gives me that spell.")
  else
    player:say_stop("It's locked.")
  end

  player:unfreeze()
end

local function enter()
  dink.fade_down()
  dink.fill_screen(0)
  misc.teleport(38, 261, 350)
  dink.draw_status()
  dink.fade_up()
  dink.kill_this_task()
end

function talk()
  player:freeze()
  dink.playsound(45, 12000, 0, nil, false)
  dink.wait(700)

  if global.caveguy == 2 then
    local me = current_sprite
    dink.script_attach(1000)

    local cs = cutscene.quick_cutscene({d = player, m = me}, {
      {"w", 300},
      {"ac", "m", "0"},
      {"ass", {"d", "m"}, {
        "Hello, anyone in there?",
        {},
        "Hello?!?",
        "Who wants to know?",
        {
          "I .. I'm Dink Smallwood, I'm trying to help...",
          "a poor guy who is imprisoned in the dungeon south of here."
        },
        {
          "Young Maulwood, people get trapped in places they shouldn't go all the time.",
          "Why should I care what happens to this man?"
        },
      }},
      {"w", 500},
      {"dir", "d", "s"},
      {"dir", "d", "w"},
      {"w", 300},
      {"ass", {"d", "m"}, {
        {
          "It's Smallwood sir, and he says...",
          "he was imprisoned by agents of the Cast and that the lock can only be broken with magic!"
        },
        "Are you high?",
        "No.",
        {
          "Oh.",
          "Well, if those Cast members are involved I'd best help.",
          "Come in."
        }
      }}
    })
    enter()
    return
  elseif global.caveguy == 3 then
    local me = current_sprite
    dink.script_attach(1000)

    player:say_stop("Hey, I'm back!")
    me:say_stop("`0Ah, yes Smallwand, come in ..")
    
    enter()
    return
  else
    player:say_stop("Hello, anyone home?")
    player:unfreeze()
  end
end

function hit()
  talk()
end
