-- item massive bow (+8)

local b1 = include("item-b1")
b1.bowlore_dividend = 2
b1.bonus_strength = 8

use = b1.use
disarm = b1.disarm
arm = b1.arm
pickup = b1.pickup
drop = b1.drop
