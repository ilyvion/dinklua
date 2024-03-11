-- goblin with hammer

local gs = include("en-gs")

function main()
  misc.initialize_sprite(current_sprite, {
    brain = brain.SMART_PEOPLE,
    speed = 1,
    distance = 50,
    timing = 66,
    exp = 150,
    base_walk = 760,
    base_attack = 750,
    defense = 1,
    strength = 15,
    touch_damage = 10,
    hitpoints = 40,
  }, {{"c", 750}, {"d", 760}, 765})
end

hit = gs.hit
talk = gs.talk
attack = gs.attack
die = gs.die
