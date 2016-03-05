minetest.register_tool(":default:axe_wood",{
	description = "Wood Axe",
	inventory_image = "mymagic_axe_wood.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			choppy={times={[2]=1.6, [3]=0.40}, uses=10, maxlevel=1},
		},
		damage_groups = {fleshy=2},
		}
})
minetest.register_tool(":default:axe_stone",{
	description = "Stone Axe",
	inventory_image = "mymagic_axe_stone.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 1,
		max_drop_level=0,
		groupcaps={
			choppy={times={[2]=1.4, [3]=0.40}, uses=20, maxlevel=1},
		},
		damage_groups = {fleshy=4},
		}
})
minetest.register_tool(":default:axe_steel",{
	description = "Steel Axe",
	inventory_image = "mymagic_axe_steel.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.5, [2]=1.2, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=6},
		}
})
minetest.register_tool(":default:axe_bronze",{
	description = "Bronze Axe",
	inventory_image = "mymagic_axe_bronze.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.8,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2.5, [2]=1.2, [3]=0.35}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=6},
		}
})
minetest.register_tool(":default:axe_mese",{
	description = "Mese Axe",
	inventory_image = "mymagic_axe_mese.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=2, [2]=1, [3]=0.35}, uses=30, maxlevel=1},
		},
		damage_groups = {fleshy=7},
		}
})
minetest.register_tool(":default:axe_diamond",{
	description = "Diamond Axe",
	inventory_image = "mymagic_axe_diamond.png^mymagic_leather_grip.png",
	wield_scale = {x=1,y=1.5,z=0.5},
	tool_capabilities = {
		full_punch_interval = 0.7,
		max_drop_level=1,
		groupcaps={
			choppy={times={[1]=1.9, [2]=0.9, [3]=0.30}, uses=40, maxlevel=1},
		},
		damage_groups = {fleshy=8},
		}
})
