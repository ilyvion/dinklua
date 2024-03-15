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
      "Hey duck, thanks for the game.",
      "Hey, no problem."
    }},
    {"ufza"}
  })
end

function hit()
  cs:scene({
    {"fz", "q"},
    {"ss", "q", "Hey man, don't make me put you in the arena!"},
    {"ufz", "q"}
  })
end
