function main()
  if global["s2-map"] == 0 then
    player:say("I don't own a map yet.")
    dink.kill_this_task()
    return
  end

  dink.show_bmp("tiles\\map1.bmp", true)
  dink.kill_this_task()
end
