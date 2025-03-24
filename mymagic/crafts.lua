--floor
minetest.register_craft({
	output = "mymagic:stone_floor 4",
	recipe = {
		{"","default:cobble","default:cobble"},
		{"","default:cobble",""},
		{"default:cobble","default:cobble",""},
	}
})
--Orb Powder
minetest.register_craft({
		type = "cooking",
		output = "mymagic:powder_orb_orange",
		recipe = "mymagic:orb_orange",
		cooktime = 5
	})
minetest.register_craft({
		type = "cooking",
		output = "mymagic:powder_orb_green",
		recipe = "mymagic:orb_green",
		cooktime = 5
	})
minetest.register_craft({
		type = "cooking",
		output = "mymagic:powder_orb_blue",
		recipe = "mymagic:orb_blue",
		cooktime = 5
	})
minetest.register_craft({
		type = "cooking",
		output = "mymagic:powder_orb_red",
		recipe = "mymagic:orb_red",
		cooktime = 5
	})

--Dark Stones
minetest.register_craft({
		type = "cooking",
		output = "mymagic:dark_stone",
		recipe = "mymagic:dark_cobble",
		cooktime = 5
	})
minetest.register_craft({
		type = "cooking",
		output = "mymagic:dark_desert_stone",
		recipe = "mymagic:dark_desert_cobble",
		cooktime = 5
	})
--Dark Stone Bricks
minetest.register_craft({
	type = "shapeless",
	output = "mymagic:dark_stone_brick 4",
	recipe = {
		"mymagic:dark_stone","mymagic:dark_stone",
		"mymagic:dark_stone","mymagic:dark_stone"
	}
})
minetest.register_craft({
	type = "shapeless",
	output = "mymagic:dark_desert_stone_brick 4",
	recipe = {
		"mymagic:dark_desert_stone","mymagic:dark_desert_stone",
		"mymagic:dark_desert_stone","mymagic:dark_desert_stone"
	}
})
