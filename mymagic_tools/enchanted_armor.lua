local colors = {
	{"diamond","Diamond","Orange","orange",16,14,55,0},
	{"diamond","Diamond","Green","green",17,15,60,0},
	{"diamond","Diamond","Blue","blue",18,16,65,0},
	{"diamond","Diamond","Red","red",19,17,70,1},
	}
for i in ipairs (colors) do
	local mat = colors[i][1]
	local mdes = colors[i][2]
	local des = colors[i][3]
	local col = colors[i][4]
	local ar1 = colors[i][5]
	local ar2 = colors[i][6]
	local ar3 = colors[i][7]
	local ar4 = colors[i][8]

minetest.register_tool("mymagic_tools:"..mat.."_helmet_"..col, {
		description = mdes.." Helmet Enchanted "..des,
		inventory_image = "mymagic_armor_inv_helmet_"..mat.."_"..col..".png",
		groups = {armor_head=ar1, armor_heal=ar2, armor_use=ar3, armor_fire=ar4},
		wear = 0,
})
minetest.register_tool("mymagic_tools:"..mat.."_chestplate_"..col, {
		description = mdes.." Chestplate Enchanted "..des,
		inventory_image = "mymagic_armor_inv_chestplate_"..mat.."_"..col..".png",
		groups = {armor_torso=20, armor_heal=12, armor_use=50, armor_fire=ar4},
		wear = 0,
})
minetest.register_tool("mymagic_tools:"..mat.."_leggings_"..col, {
		description = mdes.." Leggings Enchanted "..des,
		inventory_image = "mymagic_armor_inv_leggings_"..mat.."_"..col..".png",
		groups = {armor_legs=20, armor_heal=12, armor_use=50, armor_fire=ar4},
		wear = 0,
	})
minetest.register_tool("mymagic_tools:"..mat.."_boots_"..col, {
		description = mdes.." Boots Enchanted "..des,
		inventory_image = "mymagic_armor_inv_boots_"..mat.."_"..col..".png",
		groups = {armor_feet=15, armor_heal=12, armor_use=50, physics_speed=0.8, physics_jump=0.5, armor_fire=ar4},
		wear = 0,
})
end
