local people = include("_people")

function main()
  if dink.random(5, 1) == 1 then
    people.spawn_person(390, direction.SOUTH_EAST, 326, 300, "s2-wand")
  end
end
