local items = {
	{"Orange Crystal - 1","crystal_orange",10},
	{"Green Crystal - 2","crystal_green",20},
	{"Blue Crystal - 3","crystal_blue",30},
	{"Red Crystal - 4","crystal_red",40},
	}
for i in ipairs(items) do
local des = items[i][1]
local itm = items[i][2]
local man = items[i][3]

minetest.register_craftitem("mymagic:"..itm,{
	description = des,
	inventory_image = "mymagic_"..itm..".png",
	})
end
local items = {
	{"Orange Energy Orb - 1","orb_orange",20},
	{"Green Energy Orb - 2","orb_green",40},
	{"Blue Energy Orb - 3","orb_blue",60},
	{"Red Energy Orb - 4","orb_red",80},
	}
for i in ipairs(items) do
local des = items[i][1]
local itm = items[i][2]
local man = items[i][3]

minetest.register_craftitem("mymagic:"..itm,{
	description = des,
	inventory_image = "mymagic_"..itm..".png",
	})
end
minetest.override_item("default:stone",{
	drop = {
		max_items = 2,
		items = {
		{items = {"default:cobble"},rarity = 1},
		{items = {"mymagic:orb_orange"},rarity = 150},
		{items = {"mymagic:orb_green"},rarity = 300},
		{items = {"mymagic:orb_blue"},rarity = 450},
		{items = {"mymagic:orb_red"},rarity = 600},
		{items = {"mymagic:crystal_orange"},rarity = 150},
		{items = {"mymagic:crystal_green"},rarity = 300},
		{items = {"mymagic:crystal_blue"},rarity = 450},
		{items = {"mymagic:crystal_red"},rarity = 600},
		}},
})









