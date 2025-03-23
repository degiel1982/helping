minetest.register_node("mystreets:billboard", {
	description = "Billboard",
	tiles = {
		"default_pine_wood.png",
		"default_pine_wood.png",
		"default_pine_wood.png",
		"default_pine_wood.png",
		"default_pine_wood.png",
		"mystreets_billboard.png"
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-1.25, -0.5, 0.375, 1.25, 0.875, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-1.25, -0.5, 0.375, 1.25, 0.875, 0.5},
		}
	},
	
	on_place = minetest.rotate_node
	--Add checks for each side and top
})
minetest.register_node("mystreets:billboard_post", {
	description = "Billboard",
	tiles = {
		"mystreets_power_pole.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, 0.25, 0.125, 0.5, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, 0.25, 0.125, 0.5, 0.5},
		}
	},
	
	on_place = minetest.rotate_node
})
--Crafting
minetest.register_craft({
	output = "mystreets:billboard_post 8",
	recipe = {
		{"","",""},
		{"","group:tree",""},
		{"","group:tree",""},
	}
})
minetest.register_craft({
	output = "mystreets:billboard 3",
	recipe = {
		{"","group:wood",""},
		{"","group:wood",""},
		{"","group:wood",""},
	}
})
