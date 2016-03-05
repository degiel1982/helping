minetest.register_tool(":default:shovel_wood", {
	description = "Wooden Shovel",
	inventory_image = "mymagic_shovel_wood.png",
	wield_image = "mymagic_shovel_wood.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.2,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=3.00, [2]=1.60, [3]=0.60}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})
minetest.register_tool(":default:shovel_stone", {
	description = "Stone Shovel",
	inventory_image = "mymagic_shovel_stone.png",
	wield_image = "mymagic_shovel_stone.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.4,
		max_drop_level=0,
		groupcaps={
			crumbly = {times={[1]=1.80, [2]=1.20, [3]=0.50}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
	},
})
minetest.register_tool(":default:shovel_steel", {
	description = "Steel Shovel",
	inventory_image = "mymagic_shovel_steel.png",
	wield_image = "mymagic_shovel_steel.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=30, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})
minetest.register_tool(":default:shovel_bronze", {
	description = "Bronze Shovel",
	inventory_image = "mymagic_shovel_bronze.png",
	wield_image = "mymagic_shovel_bronze.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.1,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.50, [2]=0.90, [3]=0.40}, uses=40, maxlevel=2},
		},
		damage_groups = {fleshy=3},
	},
})
minetest.register_tool(":default:shovel_mese", {
	description = "Mese Shovel",
	inventory_image = "mymagic_shovel_mese.png",
	wield_image = "mymagic_shovel_mese.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=3,
		groupcaps={
			crumbly = {times={[1]=1.20, [2]=0.60, [3]=0.30}, uses=20, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})
minetest.register_tool(":default:shovel_diamond", {
	description = "Diamond Shovel",
	inventory_image = "mymagic_shovel_diamond.png",
	wield_image = "mymagic_shovel_diamond.png^[transformR90",
	tool_capabilities = {
		full_punch_interval = 1.0,
		max_drop_level=1,
		groupcaps={
			crumbly = {times={[1]=1.10, [2]=0.50, [3]=0.30}, uses=30, maxlevel=3},
		},
		damage_groups = {fleshy=4},
	},
})
