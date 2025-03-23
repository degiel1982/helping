minetest.register_node("mystreets:powerpole", {
	description = "Power Pole",
	drawtype = "nodebox",
    tiles = {"mystreets_power_pole.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
			{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
			{-0.1875, -0.5, -0.3125, 0.1875, 0.5, 0.3125},
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			{-0.3125, -0.5, -0.1875, 0.3125, 0.5, 0.1875},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
			{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
			{-0.1875, -0.5, -0.3125, 0.1875, 0.5, 0.3125},
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			{-0.3125, -0.5, -0.1875, 0.3125, 0.5, 0.1875},
		}
	},
	on_place = minetest.rotate_node,
})
minetest.register_node("mystreets:powerpole_top", {
	description = "Power Pole Top",
	drawtype = "nodebox",
    tiles = {"mystreets_power_pole_top_tb.png^[transformFXR90",
    		"mystreets_power_pole_top_tb.png^[transformFXR90",
    		"mystreets_power_pole_top_side.png",
    		"mystreets_power_pole_top_side.png",
    		"mystreets_power_pole_top.png",
    		"mystreets_power_pole_top.png",
    		},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
			{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
			{-0.1875, -0.5, -0.3125, 0.1875, 0.5, 0.3125},
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			{-0.3125, -0.5, -0.1875, 0.3125, 0.5, 0.1875},
			{-0.5, -0.1875, -0.5, 0.5, 0.1875, -0.375},
			{-0.5, -0.1875, 0.375, 0.5, 0.1875, 0.5},
			{-0.375, -0.1875, -0.375, 0.375, 0.1875, 0.375},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{-0.125, -0.5, -0.375, 0.125, 0.5, 0.375},
			{-0.375, -0.5, -0.125, 0.375, 0.5, 0.125},
			{-0.1875, -0.5, -0.3125, 0.1875, 0.5, 0.3125},
			{-0.25, -0.5, -0.25, 0.25, 0.5, 0.25},
			{-0.3125, -0.5, -0.1875, 0.3125, 0.5, 0.1875},
			{-0.5, -0.1875, -0.5, 0.5, 0.1875, -0.375},
			{-0.5, -0.1875, 0.375, 0.5, 0.1875, 0.5},
			{-0.375, -0.1875, -0.375, 0.375, 0.1875, 0.375},
		}
	},
	on_place = minetest.rotate_node,
})
minetest.register_node("mystreets:powerpole_wires", {
	description = "Power Pole Wires",
	drawtype = "nodebox",
    tiles = {"default_obsidian.png"},
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {oddly_breakable_by_hand=3},
	node_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.25, 0.0625, 0.5, -0.1875},
			{0, -0.5, 0.1875, 0.0625, 0.5, 0.25},
		}
	},
	selection_box = {
		type = "fixed",
		fixed = {
			{0, -0.5, -0.25, 0.0625, 0.5, -0.1875},
			{0, -0.5, 0.1875, 0.0625, 0.5, 0.25},
		}
	},
	on_place = minetest.rotate_node,
})
--Crafting
minetest.register_craft({
	output = "mystreets:powerpole 3",
	recipe = {
		{"","group:tree",""},
		{"","group:tree",""},
		{"","group:tree",""},
	}
})
minetest.register_craft({
	output = "mystreets:powerpole_top 3",
	recipe = {
		{"","group:tree",""},
		{"default:stick","group:tree","default:stick"},
		{"","group:tree",""},
	}
})
minetest.register_craft({
	output = "mystreets:powerpole_wires 6",
	recipe = {
		{"","",""},
		{"default:copper_ingot","default:copper_ingot","default:copper_ingot"},
		{"","",""},
	}
})
