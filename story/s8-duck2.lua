local enemy = include("_enemy")

local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("q", current_sprite, "3")
end

function talk()
  cs:scene({
    {"fza"},
    {"ass", {"d", "q"}, {
      "Hi giant duck.",
      {
        "Hi there.",
        "Welcome to our island."
      },
      "Thanks.",
      "Would you like to play with me?"
    }}
  })
  
  local choice_menu = dink.create_choice_menu()

  local choice_go = choice_menu:add_choice("Go ahead and play")
  choice_menu:add_choice("Not yet")
  
  local choice_result = choice_menu:show()

  if choice_result == choice_go then
    global.duckgame = 1
    cs:command("ass", {"d", "q"}, {
      "Sure, let's play something.",
      "Okay, I have just the game, follow me."
    })
    dink.script_attach(1000)
    -- fadeout & cutscene?
    dink.fade_down()
    misc.teleport(731, 112, 300)
    dink.draw_status()
    dink.fade_up()
    dink.kill_this_task()
  else
    cs:command("ss", "d", "Sorry, not yet.")
  end

  cs:command("ufza")
end

function hit()
  cs:scene({
    {"fz", "q"},
    {"ss", "q", "This is not a fun game!!!"},
    {"ufz", "q"}
  })
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
end
