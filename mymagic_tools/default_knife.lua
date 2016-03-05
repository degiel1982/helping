minetest.register_tool("mymagic_tools:knife_wood",{
	description = "Wood Knife",
	inventory_image = "mymagic_knife_wood.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
		}
})
minetest.register_tool("mymagic_tools:knife_stone",{
	description = "Stone Knife",
	inventory_image = "mymagic_knife_stone.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			snappy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=2},
		}
})
minetest.register_tool("mymagic_tools:knife_steel",{
	description = "Steel Knife",
	inventory_image = "mymagic_knife_steel.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.2, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=3},
		}
})
minetest.register_tool("mymagic_tools:knife_bronze",{
	description = "Bronze Knife",
	inventory_image = "mymagic_knife_bronze.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2.5, [2]=1.2, [3]=0.35}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=3},
		}
})
minetest.register_tool("mymagic_tools:knife_mese",{
	description = "Mese Knife",
	inventory_image = "mymagic_knife_mese.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=2, [2]=1, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=4},
		}
})
minetest.register_tool("mymagic_tools:knife_diamond",{
	description = "Diamond Knife",
	inventory_image = "mymagic_knife_diamond.png",
	wield_scale = {x=1.5,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			snappy={times={[1]=1.9, [2]=0.9, [3]=0.30}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=4},
		}
})
minetest.register_craft({
	output = 'mymagic_tools:knife_wood',
	recipe = {
		{'group:wood'},
		{'group:wood'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'mymagic_tools:knife_stone',
	recipe = {
		{'group:stone'},
		{'group:stone'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'mymagic_tools:knife_steel',
	recipe = {
		{'default:steel_ingot'},
		{'default:steel_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'mymagic_tools:knife_bronze',
	recipe = {
		{'default:bronze_ingot'},
		{'default:bronze_ingot'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'mymagic_tools:knife_mese',
	recipe = {
		{'default:mese_crystal'},
		{'default:mese_crystal'},
		{'group:stick'},
	}
})

minetest.register_craft({
	output = 'mymagic_tools:knife_diamond',
	recipe = {
		{'default:diamond'},
		{'default:diamond'},
		{'group:stick'},
	}
})
