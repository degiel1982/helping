local helmet = {}
local make_helmet = false
local chest = {}
local make_chest = false
local pants = {}
local make_pants = false
local boots = {}
local make_boots = false




minetest.register_node("mymagic_tools:forge_armor",{
	description = "Armor Forge",
	tiles = {
			{name="mymagic_forge_top.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			"mymagic_forge_back.png",
			"mymagic_forge_side.png^[transformFX",
			"mymagic_forge_side.png",
			"mymagic_forge_back.png",
			{name="mymagic_forge_front_armor.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	groups = {cracky=1,oddly_breakable_by_hand=2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.5, -0.5, -0.375, -0.375, 0.5, 0.375},
			{-0.5, -0.5, 0.375, 0.5, 0.5, 0.5},
			{0.375, -0.5, -0.375, 0.5, 0.5, 0.375},
			{-0.5, -0.5, -0.5, 0.5, 0.25, -0.375},
			{-0.375, -0.5, -0.375, 0.375, 0.3125, 0.375},
			{-0.375, -0.5, -0.3125, 0.375, 0.375, 0.375},
		}
	},

after_place_node = function(pos, placer)
	local meta = minetest.get_meta(pos);
			meta:set_string("infotext",  "Armor Forge");
end,
can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if not 	inv:is_empty("input") then
		return false
	elseif not	inv:is_empty("output") then
		return false
	end
	return true
end,
on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[11,4;]"..
		"background[-0.5,-0.5;12,5;mymagic_forge_bg.png]"..
		"listcolors[#191515;#464545;#000000]"..
		"label[0,0;wood,cactus,]"..
		"label[0,0.25;steel,bronze,]"..
		"label[0,0.5;gold,diamond]"..
		"label[0,1;Input]"..
		"list[current_name;input;0,1.5;1,1;]"..
		"image_button[1.5,0;1,1;3d_armor_inv_helmet_diamond.png;helmet;x5]"..
		"image_button[1.5,1;1,1;3d_armor_inv_chestplate_diamond.png;chest;x6]"..
		"image_button[1.5,2;1,1;3d_armor_inv_leggings_diamond.png;pants;x5]"..
		"image_button[1.5,3;1,1;3d_armor_inv_boots_diamond.png;boots;x4]"..
		--output
		"label[0,2.5;Output]"..
		"list[current_name;output;0,3;1,1;]"..
		--Show Inventory
		"list[current_player;main;3,0;8,4;]")
	meta:set_string("infotext", "Armor Forge")
	local inv = meta:get_inventory()
	inv:set_size("input", 1)
	inv:set_size("output", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
local meta = minetest.get_meta(pos)
local inv = meta:get_inventory()
local istack = inv:get_stack("input",1)

if fields["helmet"]then
		make_helmet = false
		local siz = istack:get_count("input")
		if siz <= 4  then
			minetest.chat_send_player(sender:get_player_name(), "You need 5 items to make a Helmet!")
			return
		end
		if inv:is_empty("output") == false then
			return
		end

	local helmets = {
			{"default:wood",			"3d_armor:helmet_wood"},
			{"default:cactus",			"3d_armor:helmet_cactus"},
			{"default:steel_ingot",		"3d_armor:helmet_steel"},
			{"default:bronze_ingot",	"3d_armor:helmet_bronze"},
			{"default:gold_ingot",		"3d_armor:helmet_gold"},
			{"default:diamond",			"3d_armor:helmet_diamond"},
			}
	for i in ipairs (helmets) do
		local mat = helmets[i][1]
		local arm = helmets[i][2]

		if   istack:get_name() == mat then
				helmet = arm
				make_helmet = true
		end
	end
		if make_helmet == true then
			inv:add_item("output",helmet)
			
			istack:take_item(5)
			inv:set_stack("input",1,istack)
		end

elseif fields["chest"]then
		make_chest = false
		local siz = istack:get_count("input")
		if siz <= 5 then
			minetest.chat_send_player(sender:get_player_name(), "You need 6 items to make a Chestplate!")
			return
		end
		if inv:is_empty("output") == false then
			return
		end

	local chests = {
			{"default:wood",			"3d_armor:chestplate_wood"},
			{"default:cactus",			"3d_armor:chestplate_cactus"},
			{"default:steel_ingot",		"3d_armor:chestplate_steel"},
			{"default:bronze_ingot",	"3d_armor:chestplate_bronze"},
			{"default:gold_ingot",		"3d_armor:chestplate_gold"},
			{"default:diamond",			"3d_armor:chestplate_diamond"},
			}
	for i in ipairs (chests) do
		local mat = chests[i][1]
		local arm = chests[i][2]

		if   istack:get_name() == mat then
				chest = arm
				make_chest = true
		end
	end
		if make_chest == true then
			inv:add_item("output",chest)
			
			istack:take_item(6)
			inv:set_stack("input",1,istack)
		end
		
elseif fields["pants"]then
		make_pants = false

		local siz = istack:get_count("input")
		if siz <= 4 then
			minetest.chat_send_player(sender:get_player_name(), "You need 5 items to make Leggings!")
			return
		end
		if inv:is_empty("output") == false then
			return
		end

	local pant = {
			{"default:wood",			"3d_armor:leggings_wood"},
			{"default:cactus",			"3d_armor:leggings_cactus"},
			{"default:steel_ingot",		"3d_armor:leggings_steel"},
			{"default:bronze_ingot",	"3d_armor:leggings_bronze"},
			{"default:gold_ingot",		"3d_armor:leggings_gold"},
			{"default:diamond",			"3d_armor:leggings_diamond"},
			}
	for i in ipairs (pant) do
		local mat = pant[i][1]
		local arm = pant[i][2]

		if   istack:get_name() == mat then
				pants = arm
				make_pants = true
		end
	end
		if make_pants == true then
			inv:add_item("output",pants)
			
			istack:take_item(5)
			inv:set_stack("input",1,istack)
		end
		
elseif fields["boots"]then
		make_boots = false
		local siz = istack:get_count("input")
		if siz <= 3 then
			minetest.chat_send_player(sender:get_player_name(), "You need 4 items to make Boots!")
			return
		end
		if inv:is_empty("output") == false then
			return
		end

	local boot = {
			{"default:wood",			"3d_armor:boots_wood"},
			{"default:cactus",			"3d_armor:boots_cactus"},
			{"default:steel_ingot",		"3d_armor:boots_steel"},
			{"default:bronze_ingot",	"3d_armor:boots_bronze"},
			{"default:gold_ingot",		"3d_armor:boots_gold"},
			{"default:diamond",			"3d_armor:boots_diamond"},
			}
	for i in ipairs (boot) do
		local mat = boot[i][1]
		local arm = boot[i][2]

		if   istack:get_name() == mat then
				boots = arm
				make_boots = true
		end
	end
		if make_boots == true then
			inv:add_item("output",boots)
			
			istack:take_item(4)
			inv:set_stack("input",1,istack)
		end
end
end,
})
minetest.register_craft({
	output = "mymagic_tools:forge_armor",
	recipe = {
			{"default:steel_ingot","default:coalblock","default:steel_ingot"},
			{"default:steel_ingot","default:clay","default:steel_ingot"},
			{"default:steel_ingot","default:steel_ingot","default:steel_ingot"}
			},
})















