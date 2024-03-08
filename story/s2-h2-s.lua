function main()
  if global["s2-aunt"] == 1 then
    global["s2-aunt"] = 2
    player:say_stop("Not a bad little room.  I think I'm going to enjoy my stay.")
    dink.wait(500)
    player:say_stop("Except for that guy Jack...", 1)
  end
end
