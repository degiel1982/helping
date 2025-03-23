----------ZINC--------
--Ore In Stone
minetest.register_node("mystreets:zinc", {
	description = ("Zinc Ore"),
	tiles = {"default_stone.png^mystreets_instone_zinc.png"},
	groups = {cracky = 2},
	drop = "mystreets:lump_zinc",
	sounds = default.node_sound_stone_defaults(),
})
--Block
minetest.register_node("mystreets:block_zinc", {
	description = ("Zinc Block"),
	tiles = {"mystreets_block_zinc.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
--Lump
minetest.register_craftitem("mystreets:lump_zinc", {
	description = ("Zinc Lump"),
	inventory_image = "mystreets_lump_zinc.png"
})
--Ingot
minetest.register_craftitem("mystreets:ingot_zinc", {
	description = ("Zinc Ingot"),
	inventory_image = "mystreets_ingot_zinc.png"
})
--Crafting
minetest.register_craft({
	output = "mystreets:block_zinc",
	recipe = {
		{"mystreets:ingot_zinc","mystreets:ingot_zinc","mystreets:ingot_zinc"},
		{"mystreets:ingot_zinc","mystreets:ingot_zinc","mystreets:ingot_zinc"},
		{"mystreets:ingot_zinc","mystreets:ingot_zinc","mystreets:ingot_zinc"},
	}
})
minetest.register_craft({
	type = "cooking",
	output = "mystreets:ingot_zinc",
	recipe = "mystreets:lump_zinc",
})
--Mapgen
	minetest.register_ore({
		ore_type        = "scatter",
		ore             = "mystreets:zinc",
		wherein         = {"default:stone"},
		clust_scarcity  = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size      = 3,
		y_max           = -10,
		y_min           = -30000,
	})
--------------------------------------------------------------

-------LEAD-------
--Ore In Stone
minetest.register_node("mystreets:lead", {
	description = ("Lead Ore"),
	tiles = {"default_stone.png^mystreets_instone_lead.png"},
	groups = {cracky = 2},
	drop = "mystreets:lump_lead",
	sounds = default.node_sound_stone_defaults(),
})
--Block
minetest.register_node("mystreets:block_lead", {
	description = ("Lead Block"),
	tiles = {"mystreets_block_lead.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
--Lump
minetest.register_craftitem("mystreets:lump_lead", {
	description = ("Lead Lump"),
	inventory_image = "mystreets_lump_lead.png"
})
--Ingot
minetest.register_craftitem("mystreets:ingot_lead", {
	description = ("Lead Ingot"),
	inventory_image = "mystreets_ingot_lead.png"
})
--Crafting
minetest.register_craft({
	output = "mystreets:block_lead",
	recipe = {
		{"mystreets:ingot_lead","mystreets:ingot_lead","mystreets:ingot_lead"},
		{"mystreets:ingot_lead","mystreets:ingot_lead","mystreets:ingot_lead"},
		{"mystreets:ingot_lead","mystreets:ingot_lead","mystreets:ingot_lead"},
	}
})
minetest.register_craft({
	type = "cooking",
	output = "mystreets:ingot_lead",
	recipe = "mystreets:lump_lead",
})
--Mapgen
	minetest.register_ore({
		ore_type        = "scatter",
		ore             = "mystreets:lead",
		wherein         = {"default:stone"},
		clust_scarcity  = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size      = 3,
		y_max           = -10,
		y_min           = -30000,
	})
--------------------------------------------------------------

-------NICKLE-------
--Ore In Stone
minetest.register_node("mystreets:nickel", {
	description = ("Nickel Ore"),
	tiles = {"default_stone.png^mystreets_instone_nickel.png"},
	groups = {cracky = 2},
	drop = "mystreets:lump_nickel",
	sounds = default.node_sound_stone_defaults(),
})
--Block
minetest.register_node("mystreets:block_nickel", {
	description = ("Nickel Block"),
	tiles = {"mystreets_block_nickel.png"},
	is_ground_content = false,
	groups = {cracky = 1, level = 2},
	sounds = default.node_sound_metal_defaults(),
})
--Lump
minetest.register_craftitem("mystreets:lump_nickel", {
	description = ("Nickel Lump"),
	inventory_image = "mystreets_lump_nickel.png"
})
--Ingot
minetest.register_craftitem("mystreets:ingot_nickel", {
	description = ("Nickel Ingot"),
	inventory_image = "mystreets_ingot_nickel.png"
})
--Crafting
minetest.register_craft({
	output = "mystreets:block_nickel",
	recipe = {
		{"mystreets:ingot_nickel","mystreets:ingot_nickel","mystreets:ingot_nickel"},
		{"mystreets:ingot_nickel","mystreets:ingot_nickel","mystreets:ingot_nickel"},
		{"mystreets:ingot_nickel","mystreets:ingot_nickel","mystreets:ingot_nickel"},
	}
})
minetest.register_craft({
	type = "cooking",
	output = "mystreets:ingot_nickel",
	recipe = "mystreets:lump_nickel",
})
--Mapgen
	minetest.register_ore({
		ore_type        = "scatter",
		ore             = "mystreets:nickel",
		wherein         = {"default:stone"},
		clust_scarcity  = 7 * 7 * 7,
		clust_num_ores = 5,
		clust_size      = 3,
		y_max           = -10,
		y_min           = -30000,
	})
--------------------------------------------------------------
