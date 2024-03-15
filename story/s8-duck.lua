local enemy = include("_enemy")

local cs

function main()
  cs = cutscene.create_cutscene(250)
  cs:add_participant("d", player)
  cs:add_participant("q", current_sprite, "3")
end

function talk()
  local nut = player.dir
  cs:scene({
    {"fza"},
    {"ss", "q", {
      "Hi, we are the giant ducks of Koka Isle.",
      "Who are you?"
    }},
    {"wn", 250},
    {"dir", "d", "s"},
    {"wn", 750},
    {"dir", "d", nut},
    {"ss", "d", "Uh, I'm Dink"},
    {"ss", "q", "Hello Dink."},
    {"ufza"}
  })
end

function hit()
  cs:scene({
    {"fz", "q"},
    {"ss", "q", "Quack.  No!!"},
    {"ufz", "q"}
  })
end

function die()
  enemy.kill_enemy(
    current_sprite,
    editor_type.KILL_RETURN_AFTER_FIVE_MINUTES
  )
end
