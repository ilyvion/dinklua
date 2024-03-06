local function animate_bomb(bomb, spark)
  local x, y = spark.x, spark.y
  local pframe = {
    [0] = 1,
    [1] = 3,

    [2] = 3,
    [3] = 2,

    [4] = 1,
    [5] = 2,
    [6] = 3,
    [7] = 2,
  }
  for i=1,5 do
    dink.wait(500)
    x = x + 1
    y = y + 1
    spark.x = x
    spark.y = y
    bomb.pframe = pframe[i % 2]
  end
  spark.pframe = 2
  for i=6,7 do
    dink.wait(100)
    bomb.pframe = pframe[(i % 2) + 2]
  end
  dink.wait(50)
  x = x + 1
  y = y + 1
  spark.x = x
  spark.y = y
  dink.wait(30)
  for i=8,20 do
    dink.wait(20)
    bomb.pframe = pframe[i % 4 + 4]
  end
  dink.wait(20)
end

function main()
  local bomb = misc.create_sprite_initialized(player.x, player.y, brain.NONE, 420, 1, {
    script = "dam-bomn"
  })
  local spark = misc.create_sprite_initialized(player.x - 17, player.y - 19, brain.REPEAT, 166, 1, {
    seq = 166,
    que = -50
  })
  animate_bomb(bomb, spark)
  spark.active = false
  bomb.range = 30
  bomb.brain = brain.MISSILE_KILL_SEQ_DONE
  dink.playsound(6, 22050, 0, nil, false)
  bomb.seq = 161
  bomb.strength = 8

end
