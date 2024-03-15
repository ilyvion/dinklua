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
    {"ass", {"q", "d"}, {
      "Hello there.",
      "Hi, who are you?",
      "I'm the mother duck.",
      {
        "Oh, I see.",
        "And how are your kids doing?"
      },
      "They're fine.",
      "Hey, that's great."
    }},
    {"ufza"}
  })
end

function hit()
  cs:command("say", "d", "Yeah, this is fun!")
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
end
