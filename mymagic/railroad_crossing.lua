minetest.register_node("mystreets:railroad_light", {
	description = "Railroad Light",
	tiles = {
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		{name="mystreets_railroad_light.png", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.3125, 0.375, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, -0.25, 0.3125, 0.5},
			{0.25, -0.3125, 0.25, 0.3125, 0.3125, 0.5},
			{-0.3125, 0.25, 0.125, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.3125, 0.375, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, -0.25, 0.3125, 0.5},
			{0.25, -0.3125, 0.25, 0.3125, 0.3125, 0.5},
			{-0.3125, 0.25, 0.125, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.5},
		}
	},
})
minetest.register_node("mystreets:railroad_light2", {
	description = "Railroad Light 2",
	tiles = {
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		"default_obsidian.png",
		{name="mystreets_railroad_light.png^[transformFXR180", animation={type="vertical_frames",
		aspect_w=16, aspect_h=16, length=2}},
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.3125, 0.375, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, -0.25, 0.3125, 0.5},
			{0.25, -0.3125, 0.25, 0.3125, 0.3125, 0.5},
			{-0.3125, 0.25, 0.125, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.3125, -0.3125, 0.375, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, -0.25, 0.3125, 0.5},
			{0.25, -0.3125, 0.25, 0.3125, 0.3125, 0.5},
			{-0.3125, 0.25, 0.125, 0.3125, 0.3125, 0.5},
			{-0.3125, -0.3125, 0.25, 0.3125, -0.25, 0.5},
		}
	},
})
minetest.register_node("mystreets:railroad_sign", {
	description = "Railroad Sign",
	tiles = {
		"default_clay.png",
		"default_clay.png",
		"default_clay.png",
		"default_clay.png",
		"default_clay.png",
		"default_clay.png",
	},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, -0.3125, 0.5},
			{-0.375, -0.375, 0.3125, -0.1875, -0.1875, 0.5},
			{-0.25, -0.25, 0.3125, -0.0625, -0.0625, 0.5},
			{-0.125, -0.125, 0.3125, 0.0625, 0.0625, 0.5},
			{0, 0, 0.3125, 0.1875, 0.1875, 0.5},
			{0.125, 0.125, 0.3125, 0.3125, 0.3125, 0.5},
			{0.25, 0.25, 0.3125, 0.4375, 0.4375, 0.5},
			{0.25, -0.5, 0.3125, 0.4375, -0.3125, 0.5},
			{0.125, -0.375, 0.3125, 0.3125, -0.1875, 0.5},
			{0, -0.25, 0.3125, 0.1875, -0.0625, 0.5},
			{-0.25, 0, 0.3125, -0.0625, 0.1875, 0.5},
			{-0.375, 0.125, 0.3125, -0.1875, 0.3125, 0.5},
			{-0.5, 0.25, 0.3125, -0.3125, 0.4375, 0.5},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.3125, -0.3125, -0.3125, 0.5},
			{-0.375, -0.375, 0.3125, -0.1875, -0.1875, 0.5},
			{-0.25, -0.25, 0.3125, -0.0625, -0.0625, 0.5},
			{-0.125, -0.125, 0.3125, 0.0625, 0.0625, 0.5},
			{0, 0, 0.3125, 0.1875, 0.1875, 0.5},
			{0.125, 0.125, 0.3125, 0.3125, 0.3125, 0.5},
			{0.25, 0.25, 0.3125, 0.4375, 0.4375, 0.5},
			{0.25, -0.5, 0.3125, 0.4375, -0.3125, 0.5},
			{0.125, -0.375, 0.3125, 0.3125, -0.1875, 0.5},
			{0, -0.25, 0.3125, 0.1875, -0.0625, 0.5},
			{-0.25, 0, 0.3125, -0.0625, 0.1875, 0.5},
			{-0.375, 0.125, 0.3125, -0.1875, 0.3125, 0.5},
			{-0.5, 0.25, 0.3125, -0.3125, 0.4375, 0.5},
		}
	},
})
--Crafting
minetest.register_craft({
	output = "mystreets:railroad_light 2",
	recipe = {
		{"mystreets:block_zinc","mystreets:block_zinc",""},
		{"mystreets:block_zinc","default:torch",""},
		{"mystreets:block_zinc","mystreets:block_zinc",""},
	}
})
minetest.register_craft({
	output = "mystreets:railroad_light2",
	recipe = {
		{"mystreets:railroad_light","",""},
		{"","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "mystreets:railroad_light",
	recipe = {
		{"mystreets:railroad_light2","",""},
		{"","",""},
		{"","",""},
	}
})
minetest.register_craft({
	output = "mystreets:railroad_sign 2",
	recipe = {
		{"default:stick","","default:stick"},
		{"","default:stick",""},
		{"default:stick","","default:stick"},
	}
})
