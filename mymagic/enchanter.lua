local enchanted_tool = {}
local enchant = false




minetest.register_node("mymagic:enchantment_table",{
	description = "Enchantment Table",
	tiles = {
			{name="mymagic_enchantment_table_top_ani.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			"mymagic_enchantment_table_bottom.png",
			{name="mymagic_enchantment_table_side_ani.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			{name="mymagic_enchantment_table_side_ani.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			{name="mymagic_enchantment_table_side_ani.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			{name="mymagic_enchantment_table_side_ani.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 7,
	groups = {choppy = 2},
	node_box = {
		type = "fixed",
		fixed = {
			{-0.4375, -0.5, 0.25, -0.25, 0.125, 0.4375},
			{0.25, -0.5, 0.25, 0.4375, 0.125, 0.4375},
			{-0.4375, -0.5, -0.4375, -0.25, 0.125, -0.25},
			{0.25, -0.5, -0.4375, 0.4375, 0.125, -0.25},
			{-0.5, 0.125, -0.5, 0.5, 0.25, 0.5},
			{-0.375, -0.0625, -0.375, 0.375, 0.125, 0.375},
			{-0.4375, 0.25, 0.125, -0.375, 0.5, 0.1875},
			{0.375, 0.25, 0.125, 0.4375, 0.5, 0.1875},
			{-0.0625, 0.25, 0.375, 0, 0.5, 0.4375},
			{-0.25, 0.25, -0.375, -0.1875, 0.5, -0.3125},
			{0.1875, 0.25, -0.375, 0.25, 0.5, -0.3125},
		}
	},

after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("infotext",  "Enchantment Table");
end,
can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if not 	inv:is_empty("tool") then
		return false
	elseif not	inv:is_empty("orb1") then
		return false
	elseif not	inv:is_empty("orb2") then
		return false
	elseif not	inv:is_empty("orb3") then
		return false
	elseif not	inv:is_empty("orb4") then
		return false
	elseif not	inv:is_empty("output") then
		return false
	end
	return true
end,
on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "size[10,8;]"..
		"background[-2,-2;13,12;mymagic_enchantment_table_bg.png]"..
		"listcolors[#00000000;#00000000;#000000]"..
		--top row
		"label[1,0.5;Tool]"..
		"label[3,0.5;Orbs]"..
		"list[current_name;tool;1,1;1,1;]"..
		"list[current_name;orb1;3,1;1,1;]"..
		"list[current_name;orb2;4,1;1,1;]"..
		--bottom row
		"list[current_name;orb3;3,2;1,1;]"..
		"list[current_name;orb4;4,2;1,1;]"..
		--Output
		"button[5.5,1;2,1;button;Enchant]"..
		--"label[6,1.5;Enchanted Tool]"..
		"list[current_name;output;6,2;1,1;]"..
		--Show Inventory
		"list[current_player;main;0.5,4;8,4;]")
	meta:set_string("infotext", "Tool Upgrade")
	local inv = meta:get_inventory()
	inv:set_size("tool", 1)
	inv:set_size("orb1", 1)
	inv:set_size("orb2", 1)
	inv:set_size("orb3", 1)
	inv:set_size("orb4", 1)
	inv:set_size("output", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
local meta = minetest.get_meta(pos)
local inv = meta:get_inventory()

if fields["button"]
then
		enchant = false

	if inv:is_empty("tool") or
		 inv:is_empty("orb1") or
		 inv:is_empty("orb2") or
		 inv:is_empty("orb3") or
		 inv:is_empty("orb4") then
			return
		end

	local tool = inv:get_stack("tool", 1)
	local orba = inv:get_stack("orb1", 1)
	local orbb = inv:get_stack("orb2", 1)
	local orbc = inv:get_stack("orb3", 1)
	local orbd = inv:get_stack("orb4", 1)
	local t = {"pick","axe","shovel","sword"}
	local c = {"orange","green","blue","red"}
	local m = {"wood","stone","steel","bronze","mese","diamond"}
	for i, tls in pairs(t) do
	--for i, clr in pairs(c) do
	for i, mtr in pairs(m) do
	local tool_list = {
			{"default:"..tls.."_"..mtr,								"orange",	"mymagic_tools:"..tls.."_enchanted_"..mtr.."_orange"},
			{"mymagic_tools:"..tls.."_enchanted_"..mtr.."_orange",	"green",	"mymagic_tools:"..tls.."_enchanted_"..mtr.."_green"},
			{"mymagic_tools:"..tls.."_enchanted_"..mtr.."_green",	"blue",		"mymagic_tools:"..tls.."_enchanted_"..mtr.."_blue"},
			{"mymagic_tools:"..tls.."_enchanted_"..mtr.."_blue",	"red",		"mymagic_tools:"..tls.."_enchanted_"..mtr.."_red"},
			
			{"mymagic_tools:knife_"..mtr,							"orange",	"mymagic_tools:knife_enchanted_"..mtr.."_orange"},
			{"mymagic_tools:knife_enchanted_"..mtr.."_orange",	"green",	"mymagic_tools:knife_enchanted_"..mtr.."_green"},
			{"mymagic_tools:knife_enchanted_"..mtr.."_green",	"blue",		"mymagic_tools:knife_enchanted_"..mtr.."_blue"},
			{"mymagic_tools:knife_enchanted_"..mtr.."_blue",	"red",		"mymagic_tools:knife_enchanted_"..mtr.."_red"},

			{"3d_armor:helmet_diamond",			"orange",	"mymagic_tools:diamond_helmet_orange"},
			{"3d_armor:chestplate_diamond",		"orange",	"mymagic_tools:diamond_chestplate_orange"},
			{"3d_armor:leggings_diamond",		"orange",	"mymagic_tools:diamond_leggings_orange"},
			{"3d_armor:boots_diamond",			"orange",	"mymagic_tools:diamond_boots_orange"},
			
			{"mymagic_tools:diamond_helmet_orange",		"green",	"mymagic_tools:diamond_helmet_green"},
			{"mymagic_tools:diamond_chestplate_orange",	"green",	"mymagic_tools:diamond_chestplate_green"},
			{"mymagic_tools:diamond_leggings_orange",	"green",	"mymagic_tools:diamond_leggings_green"},
			{"mymagic_tools:diamond_boots_orange",		"green",	"mymagic_tools:diamond_boots_green"},
			
			{"mymagic_tools:diamond_helmet_green",		"blue",	"mymagic_tools:diamond_helmet_blue"},
			{"mymagic_tools:diamond_chestplate_green",	"blue",	"mymagic_tools:diamond_chestplate_blue"},
			{"mymagic_tools:diamond_leggings_green",	"blue",	"mymagic_tools:diamond_leggings_blue"},
			{"mymagic_tools:diamond_boots_green",		"blue",	"mymagic_tools:diamond_boots_blue"},
			
			{"mymagic_tools:diamond_helmet_blue",		"red",	"mymagic_tools:diamond_helmet_red"},
			{"mymagic_tools:diamond_chestplate_blue",	"red",	"mymagic_tools:diamond_chestplate_red"},
			{"mymagic_tools:diamond_leggings_blue",		"red",	"mymagic_tools:diamond_leggings_red"},
			{"mymagic_tools:diamond_boots_blue",		"red",	"mymagic_tools:diamond_boots_red"},
			}

	for i in ipairs (tool_list) do
		local tin = tool_list[i][1]
		local col = tool_list[i][2]
		local tout = tool_list[i][3]

		if   tool:get_name() == tin and
		     orba:get_name() == "mymagic:orb_"..col and
		     orbb:get_name() == "mymagic:orb_"..col and
		     orbc:get_name() == "mymagic:orb_"..col and
		     orbd:get_name() == "mymagic:orb_"..col then
				enchanted_tool = tout
				enchant = true
		end
	end
			end
			end
	
	local tool_wear = tool:get_wear()
		if enchant == true then
			
			inv:add_item("output",enchanted_tool)
			local out = inv:get_stack("output", 1)
			out:set_wear(tool_wear)
			inv:set_stack("output",1,out)
			
			orba:take_item()
			inv:set_stack("orb1",1,orba)
			
			orbb:take_item()
			inv:set_stack("orb2",1,orbb)
			
			orbc:take_item()
			inv:set_stack("orb3",1,orbc)
			
			orbd:take_item()
			inv:set_stack("orb4",1,orbd)
			
			tool:take_item()
			inv:set_stack("tool",1,tool)
		end
end
end,
})

minetest.register_craft({
	output = "mymagic:enchantment_table",
	recipe = {{"default:torch","mymagic:orb_red","default:torch"},
			 {"default:wood","default:wood","default:wood"},
			 {"default:stick","","default:stick"}}
})














