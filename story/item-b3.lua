-- item fire bow (+15)

local b1 = include("item-b1")
b1.bowlore_dividend = 1
b1.bonus_strength = 15

use = b1.use
disarm = b1.disarm
arm = b1.arm
pickup = b1.pickup
drop = b1.drop
