--this is run when dink is loaded, directly after the dink.ini file
--is processed.

function main()
  --dink.playavi("anim\rtlogo.avi")
  
  dink.debug("Loading sounds..")
  dink.load_sound("QUACK.WAV", 1)
  dink.load_sound("PIG1.WAV", 2)
  dink.load_sound("PIG2.WAV", 3)
  dink.load_sound("PIG3.WAV", 4)
  dink.load_sound("PIG4.WAV", 5)
  dink.load_sound("BURN.WAV", 6)
  dink.load_sound("OPEN.WAV", 7)
  dink.load_sound("SWING.WAV", 8)
  dink.load_sound("PUNCH.WAV", 9)
  dink.load_sound("SWORD2.WAV", 10)
  dink.load_sound("SELECT.WAV", 11)
  dink.load_sound("WSCREAM.WAV", 12)
  dink.load_sound("PICKER.WAV", 13)
  dink.load_sound("GOLD.WAV", 14)
  dink.load_sound("GRUNT1.WAV", 15)
  dink.load_sound("GRUNT2.WAV", 16)
  dink.load_sound("SEL1.WAV", 17)
  dink.load_sound("ESCAPE.WAV", 18)
  dink.load_sound("NONO.WAV", 19)
  dink.load_sound("SEL2.WAV", 20)
  dink.load_sound("SEL3.WAV", 21)
  dink.load_sound("HIGH2.WAV", 22)
  dink.load_sound("FIRE.WAV", 23)
  dink.load_sound("SPELL1.WAV", 24)
  dink.load_sound("CAVEENT.WAV", 25)
  dink.load_sound("SNARL1.WAV", 26)
  dink.load_sound("SNARL2.WAV", 27)
  dink.load_sound("SNARL3.WAV", 28)
  dink.load_sound("HURT1.WAV", 29)
  dink.load_sound("HURT2.WAV", 30)
  dink.load_sound("ATTACK1.WAV", 31)
  dink.load_sound("CAVEENT.WAV", 32)
  dink.load_sound("LEVEL.WAV", 33)
  dink.load_sound("SAVE.WAV", 34)
  dink.load_sound("SPLASH.WAV", 35)
  dink.load_sound("SWORD1.WAV", 36)
  dink.load_sound("BHIT.WAV", 37)
  dink.load_sound("SQUISH.WAV", 38)
  dink.load_sound("STAIRS.WAV", 39)
  dink.load_sound("STEPS.WAV", 40)
  dink.load_sound("ARROW.WAV", 41)
  dink.load_sound("FLYBY.WAV", 42)
  dink.load_sound("SECRET.WAV", 43)
  dink.load_sound("BOW1.WAV", 44)
  dink.load_sound("KNOCK.WAV", 45)
  dink.load_sound("DRAG1.WAV", 46)
  dink.load_sound("DRAG2.WAV", 47)
  dink.load_sound("AXE.WAV", 48)
  dink.load_sound("BIRD1.WAV", 49)
  
  dink.fill_screen(0)
  
  player.seq = 0
  player.brain = brain.MOUSE
  player.pseq = 10
  player.pframe = 8
  player.que = 20000
  player.noclip = true
  
  local dinklogo = dink.create_sprite(320, 240, brain.NONE, 196, 1)

  local truecolor = dink.get_truecolor()
  if not truecolor then
    dink.say_xy("`4Error - Lua version requires True color mode! Restart game with -truecolor argument.", 0, 390)
    dink.wait(1)
    dink.wait(10000)
    dink.kill_game()
    return
  end

  local lualogo = dink.create_sprite(320, 385, brain.NONE, 98, 1)
  lualogo.noclip = true

  -- Considering we need DinkLua support to even run, this is rather outdated code at this point.
  -- Leaving it in as a comment for completeness.
  --
  -- local version = dink.get_version()
  -- if version < 103 then
  --   --can't play with old .exe, not all command are supported
  --   dink.say_xy("`4Error - Scripts require version V1.03+ of dink.exe.  Upgrade!", 0, 390)
  --   dink.wait(1)
  --   dink.wait(5000)
  --   dink.kill_game()
  --   return
  -- end
  
  local crap = misc.create_sprite_initialized(76, 40, brain.BUTTON, 194, 1, {
    script = "start-1",
    noclip = true,
    touch_damage = -1
  })
  
  crap = misc.create_sprite_initialized(524, 40, brain.BUTTON, 195, 1, {
    script = "start-2",
    noclip = true,
    touch_damage = -1
  })
  
  -- crap = misc.create_sprite_initialized(104, 440, brain.BUTTON, 192, 1, {
  --   noclip = true,
  --   script = "start-3",
  --   touch_damage = -1
  -- })
  
  crap = misc.create_sprite_initialized(560, 440, brain.BUTTON, 193, 1, {
    noclip = true,
    script = "start-4",
    touch_damage = -1
  })
  
  dink.playmidi("1003.mid")
  dink.kill_this_task()
end
