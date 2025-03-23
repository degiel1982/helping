minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymagic:chest",
	wherein        = "air",
	clust_scarcity = 150*150*150,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = 1,
	height_max     = 3,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymagic:chest",
	wherein        = "default:mossycobble",
	clust_scarcity = 30*30*30,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -50,
})
--mapgen for tool blocks
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymagic:sword_block",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -25,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymagic:axe_block",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -25,
})
minetest.register_ore({
	ore_type       = "scatter",
	ore            = "mymagic:pick_block",
	wherein        = "default:stone",
	clust_scarcity = 20*20*20,
	clust_num_ores = 1,
	clust_size     = 1,
	height_min     = -31000,
	height_max     = -150,
})
