local charged_tool = {}
local recharge = false
local repair_time = 0



minetest.register_node("mymagic:tool_recharge",{
	description = "Tool Recharging Station",
	tiles = {
			"mymagic_tool_recharge_top.png",
			"mymagic_tool_recharge_top.png",
			"mymagic_tool_recharge.png",
			"mymagic_tool_recharge.png",
			"mymagic_tool_recharge.png",
			"mymagic_tool_recharge.png",
		},
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 7,
	groups = {cracky=1},

after_place_node = function(pos, placer)
	local meta = minetest.env:get_meta(pos);
			meta:set_string("infotext",  "Tool Recharging Station");
end,
can_dig = function(pos,player)
	local meta = minetest.get_meta(pos);
	local inv = meta:get_inventory()
	if not 	inv:is_empty("tool") then
		return false
	elseif not	inv:is_empty("orb") then
		return false
	elseif not	inv:is_empty("output") then
		return false
	end
	return true
end,
on_construct = function(pos)
	local meta = minetest.env:get_meta(pos)
	meta:set_string("formspec", "size[4,3;]"..
		"background[-0.5,-0.5;5,4;mymagic_gem_block_bg.png]"..
		"listcolors[#5e4300;#936800;#000000]"..

		"label[0,0;Tool]"..
		"label[1,0;Orb]"..
		"list[current_name;tool;0,0.5;1,1;]"..
		"list[current_name;orb;1,0.5;1,1;]"..
		"button[2,0.5;1,1;button;Charge]"..
		"list[current_name;output;3,0.5;1,1;]"..
		
		--Show Inventory
		"list[current_player;main;0,2;4,1;]")
	meta:set_string("infotext", "Tool Recharging Station")
	local inv = meta:get_inventory()
	inv:set_size("tool", 1)
	inv:set_size("orb", 1)
	inv:set_size("output", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
local meta = minetest.get_meta(pos)
local inv = meta:get_inventory()

if fields["button"] then
		recharge = false

	if inv:is_empty("tool") or
		 inv:is_empty("orb") then
			return
	end
	if inv:is_empty("output") == false then
			return
	end

	local tools = inv:get_stack("tool", 1)
	local orbs = inv:get_stack("orb", 1)
	local t = {"axe","pick","shovel","sword","knife"}
	for i, tl in pairs(t) do
	local tool_list = {
			
			{"mymagic_tools:"..tl.."_enchanted_wood_orange",	"orange"},
			{"mymagic_tools:"..tl.."_enchanted_stone_orange",	"orange"},
			{"mymagic_tools:"..tl.."_enchanted_steel_orange",	"orange"},
			{"mymagic_tools:"..tl.."_enchanted_bronze_orange","orange"},
			{"mymagic_tools:"..tl.."_enchanted_mese_orange",	"orange"},
			{"mymagic_tools:"..tl.."_enchanted_diamond_orange","orange"},
			
			{"mymagic_tools:"..tl.."_enchanted_wood_green",	"green"},
			{"mymagic_tools:"..tl.."_enchanted_stone_green",	"green"},
			{"mymagic_tools:"..tl.."_enchanted_steel_green",	"green"},
			{"mymagic_tools:"..tl.."_enchanted_bronze_green",	"green"},
			{"mymagic_tools:"..tl.."_enchanted_mese_green",	"green"},
			{"mymagic_tools:"..tl.."_enchanted_diamond_green","green"},
			
			{"mymagic_tools:"..tl.."_enchanted_wood_blue",	"blue"},
			{"mymagic_tools:"..tl.."_enchanted_stone_blue",	"blue"},
			{"mymagic_tools:"..tl.."_enchanted_steel_blue",	"blue"},
			{"mymagic_tools:"..tl.."_enchanted_bronze_blue",	"blue"},
			{"mymagic_tools:"..tl.."_enchanted_mese_blue",	"blue"},
			{"mymagic_tools:"..tl.."_enchanted_diamond_blue",	"blue"},
			
			{"mymagic_tools:"..tl.."_enchanted_wood_red",		"red"},
			{"mymagic_tools:"..tl.."_enchanted_stone_red",	"red"},
			{"mymagic_tools:"..tl.."_enchanted_steel_red",	"red"},
			{"mymagic_tools:"..tl.."_enchanted_bronze_red",	"red"},
			{"mymagic_tools:"..tl.."_enchanted_mese_red",		"red"},
			{"mymagic_tools:"..tl.."_enchanted_diamond_red",	"red"},
			
			{"mymagic_tools:diamond_helmet_orange",		"orange"},
			{"mymagic_tools:diamond_chestplate_orange",	"orange"},
			{"mymagic_tools:diamond_leggings_orange",	"orange"},
			{"mymagic_tools:diamond_boots_orange",		"orange"},
			
			{"mymagic_tools:diamond_helmet_green",		"green"},
			{"mymagic_tools:diamond_chestplate_green",	"green"},
			{"mymagic_tools:diamond_leggings_green",	"green"},
			{"mymagic_tools:diamond_boots_green",		"green"},
			
			{"mymagic_tools:diamond_helmet_blue",		"red"},
			{"mymagic_tools:diamond_chestplate_blue",	"red"},
			{"mymagic_tools:diamond_leggings_blue",		"red"},
			{"mymagic_tools:diamond_boots_blue",		"red"},
			}
	for i in ipairs (tool_list) do
		local tin = tool_list[i][1]
		local col = tool_list[i][2]

		if   tools:get_name() == tin and
		     orbs:get_name() == "mymagic:orb_"..col then
				charged_tool = tin
				recharge = true
				if col == "orange" then
					repair_time = 5
				elseif col == "green" then
					repair_time = 10
				elseif col == "blue" then
					repair_time = 15
				elseif col == "red" then
					repair_time = 20
				end
		end
	end
	end
		if recharge == true then
			minetest.after(repair_time,function()
			tools:add_wear(-10000)
			inv:set_stack("output", 1, tools)
			orbs:take_item()
			inv:set_stack("orb",1,orbs)
			tools:take_item()
			inv:set_stack("tool",1,tools)
			end)
		end
end
end,
})
minetest.register_craft({
	output = "mymagic:tool_recharge",
	recipe = {
			{"default:steel_ingot","mymagic:orb_orange","default:steel_ingot"},
			{"default:steel_ingot","default:brick","default:steel_ingot"},
			{"default:steel_ingot","default:steel_ingot","default:steel_ingot"},
			},
})
