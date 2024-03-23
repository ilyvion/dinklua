function talk()
  if global.story > 10 then
    current_sprite:say_stop("`%Super-Fry Chicken opening soon.")
  else
    player:freeze()
    cutscene.quick_cutscene({c = current_sprite}, {
      {"ac", "c", "%"},
      {"ss", "c", {
        "Hear ye, hear ye ...",
        "By order of our great ducks the monthly tax shall be doubled.",
        "This also applies to food donations.",
        "Long live the ducks."
      }}
    })
    player:unfreeze()
  end
end
