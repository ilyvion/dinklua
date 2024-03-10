local cs

function main()
  current_sprite.hitpoints = 40
  
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("l", current_sprite, "6")
end

function talk()

  local convo
  if global.mayor == 6 then
    convo = {"ass", {"d", "l"}, {
      "Hey, uhh ... where did everyone go?",
      {
        "The parade's over already man.",
        "Everyone took off."
      },
      "That quick?!?",
      "I don't know man, I just work here."
    }}
    global.mayor = 7
  elseif global.mayor == 7 then
    convo = {"ass", {"d", "l"}, {
      "Hey, uhh ... where did everyone go?",
      {
        "I already told you buddy, they left.",
        "What are you, some kind of freak?"
      },
      "I see ..."
    }}
  end
  cs:scene({
    {"fza"},
    convo,
    {"ufza"}
  })
end

function hit()
  cs:scene({
    {"w", 0},
    {"fz", "l"},
    {"ss", "l", "Like oowwww man."},
    {"wn", 500},
    {"ufz", "l"}
  })
end
