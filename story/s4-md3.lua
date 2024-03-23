local talker = 0

function touch()
  player:freeze()
  player:move_stop(direction.SOUTH, 318, true)

  if global.story > 10 then
    current_sprite:say_stop("`9Thank you for feeding us Dink,")
    current_sprite:say_stop("`9We all are in your debt.")
  elseif talker == 1 then
    current_sprite:say_stop("`9Please, go away.")
  else
    player.dir = direction.NORTH
    current_sprite:say_stop("`9What do you want?")
    
    local choice_menu = dink.create_choice_menu()

    local choice_in = choice_menu:add_choice("Ask to come in")
    choice_menu:add_choice("Never Mind")

    local choice_result = choice_menu:show()

    if choice_result == choice_in then
      cutscene.quick_cutscene({d = player, c = current_sprite}, {
        {"ac", "c", "9"},
        {"w", 250},
        {"ass", {"d", "c"}, {
          "May I come in?",
          "Have you come with food?  My children are starving!",
          {
            "I ... I don't have any food, I'm sorry.",
            "Why are you starving?"
          },
          {
            "I shouldn't talk to you anymore,",
            "please, just go."
          }
        }}
      })
      talker = 1
    end
  end
  player:unfreeze()
end
