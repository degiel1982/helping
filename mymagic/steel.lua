-- Galvanized steel block
	minetest.register_node("mystreets:galvanized_steel", {
		description = "Galvanized Steel",
		tiles = {"mystreets_galvanized_steel.png"},
		drawtype = "normal",
		paramtype = "light",
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})
	minetest.register_node("mystreets:galvanized_steel_block", {
		description = "Galvanized Steel Block",
		tiles = {"mystreets_galvanized_steel_block.png"},
		drawtype = "normal",
		paramtype = "light",
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})
--Craft
minetest.register_craft({
	output = "mystreets:galvanized_steel_block 4",
	recipe = {
		{'mystreets:galvanized_steel', 'mystreets:galvanized_steel',""},
		{'mystreets:galvanized_steel', 'mystreets:galvanized_steel',""},
		{"","",""}
	}
})
minetest.register_craft({
	output = "mystreets:galvanized_steel 4",
	recipe = {
		{'default:steel_ingot','default:steel_ingot','mystreets:ingot_zinc'},
		{'default:steel_ingot','default:steel_ingot','mystreets:ingot_zinc'},
		{'default:steel_ingot','default:steel_ingot','mystreets:ingot_zinc'},
	}
})

-- Galvanized steel fence
	minetest.register_node("mystreets:fence_galvanized_steel", {
		description = "Galvanized steel fence",
		drawtype = "fencelike",
		tiles = {"mystreets_galvanized_steel.png"},
		paramtype = "light",
		is_ground_content = true,
		selection_box = {
			type = "fixed",
			fixed = {-1/8, -1/2, -1/8, 1/8, 1/2, 1/8},
		},
		groups = {cracky = 2},
		sounds = default.node_sound_stone_defaults(),
	})
--Craft
minetest.register_craft({
	output = "mystreets:fence_galvanized_steel 6",
	recipe = {
		{'mystreets:galvanized_steel', 'mystreets:galvanized_steel', 'mystreets:galvanized_steel'},
		{'mystreets:galvanized_steel', 'mystreets:galvanized_steel', 'mystreets:galvanized_steel'}
	}
})

-- Truss
	minetest.register_node("mystreets:truss", {
		description = "Truss",
		tiles = {"mystreets_truss.png"},
		drawtype = "nodebox",
		paramtype = "light",
		groups = {cracky = 2},
		node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, 0.375, -0.375, 0.5, 0.5},
			{-0.5, -0.5, -0.5, -0.375, 0.5, -0.375},
			{0.375, -0.5, -0.5, 0.5, 0.5, -0.375},
			{0.375, -0.5, 0.375, 0.5, 0.5, 0.5},
			{-0.5, -0.5, 0.375, 0.5, -0.375, 0.5},
			{-0.5, -0.5, -0.5, 0.5, -0.375, -0.375},
			{-0.5, -0.5, -0.5, -0.375, -0.375, 0.5},
			{0.375, -0.5, -0.5, 0.5, -0.375, 0.5},
			{-0.5, 0.375, 0.4375, 0.5, 0.5, 0.5},
			{-0.5, 0.375, -0.5, 0.5, 0.5, -0.375},
			{-0.5, 0.375, -0.5, -0.375, 0.5, 0.5},
			{0.375, 0.4375, -0.5, 0.5, 0.5, 0.5},
		}
	}
	})
--Craft
minetest.register_craft({
	output = "mystreets:truss 5",
	recipe = {
		{'default:steel_ingot', '', 'default:steel_ingot'},
		{'', 'default:steel_ingot', ''},
		{'default:steel_ingot', '', 'default:steel_ingot'}
	}
})
