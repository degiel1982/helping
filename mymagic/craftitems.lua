--Blood Drop
minetest.register_craftitem("mymagic:blood_drop",{
	inventory_image = "mymagic_blood_drop.png",
	description = "Blood Drop",
	})
	
--Gold Coin
minetest.register_craftitem("mymagic:gold_coin",{
	inventory_image = "mymagic_gold_coin.png",
	description = "Gold Coin",
	stack_max = 10000,
	})
	
--gems
core.register_craftitem("mymagic:gem_orange", {
    description = "Orange Gem",
    inventory_image = "mymagic_gem_orange.png"
})
core.register_craftitem("mymagic:gem_green", {
    description = "Green Gem",
    inventory_image = "mymagic_gem_green.png"
})
core.register_craftitem("mymagic:gem_blue", {
    description = "Blue Gem",
    inventory_image = "mymagic_gem_blue.png"
})
core.register_craftitem("mymagic:gem_red", {
    description = "Red Gem",
    inventory_image = "mymagic_gem_red.png"
})
