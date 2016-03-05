local blade = {}
local make_blade = false
local handle = {}
local make_handle = false
local axe = {}
local make_axe = false




minetest.register_node("mymagic_tools:axe_forge",{
	description = "Axe Forge",
	tiles = {
			{name="mymagic_forge_top.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
			"mymagic_forge_back.png",
			"mymagic_forge_side.png^[transformFX",
			"mymagic_forge_side.png",
			"mymagic_forge_back.png",
			{name="mymagic_forge_front_axe.png", animation={type="vertical_frames",aspect_w=16, aspect_h=16, length=0.3}},
		},
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 14,
	groups = {creative_breakable=1},
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
			meta:set_string("infotext",  "Axe Forge");
end,

on_construct = function(pos)
	local meta = minetest.get_meta(pos)
	meta:set_string("formspec", "size[9,10;]"..
		"background[-0.15,-0.25;9.40,10.75;mymagic_forge_bg.png]"..
		"listcolors[#191515;#464545;#000000]"..
		--Blade
		"label[1,1.5;Blade]"..
		"list[current_name;blade1;3,1.5;1,1;]"..
		"list[current_name;blade2;2,1;1,1;]"..
		"list[current_name;blade3;2,2;1,1;]"..
		"button[2,3.5;1,1;bbutton;Make]"..
		"list[current_name;blade;2,4.5;1,1;]"..
		--Handle
		"label[4.5,1.5;Handle]"..
		"list[current_name;handle1;6,0.5;1,1;]"..
		"list[current_name;handle2;6,1.5;1,1;]"..
		"list[current_name;handle3;6,2.5;1,1;]"..
		"button[6,3.5;1,1;hbutton;Make]"..
		"list[current_name;handle;3,4.5;1,1;]"..
		--Axe
		"button[4,4.5;2,1;abutton;Make]"..
		"list[current_name;axe;6,4.5;1,1;]"..
		--Show Inventory
		"list[current_player;main;0.5,6;8,4;]")
	meta:set_string("infotext", "Axe Forge")
	local inv = meta:get_inventory()
	inv:set_size("blade", 1)
	inv:set_size("blade1", 1)
	inv:set_size("blade2", 1)
	inv:set_size("blade3", 1)
	inv:set_size("handle", 1)
	inv:set_size("handle1", 1)
	inv:set_size("handle2", 1)
	inv:set_size("handle3", 1)
	inv:set_size("axe", 1)
end,

on_receive_fields = function(pos, formname, fields, sender)
local meta = minetest.get_meta(pos)
local inv = meta:get_inventory()

if fields["bbutton"]then
		make_blade = false

		if inv:is_empty("blade1") or
		 inv:is_empty("blade2") or
		 inv:is_empty("blade3") then
			return
		end

	local b1 = inv:get_stack("blade1", 1)
	local b2 = inv:get_stack("blade2", 1)
	local b3 = inv:get_stack("blade3", 1)


	local blade_list = {
			{"default:wood",			"mymagic_tools:axe_blade_wood"},
			{"default:stone",			"mymagic_tools:axe_blade_stone"},
			{"default:steel_ingot",		"mymagic_tools:axe_blade_steel"},
			{"default:bronze_ingot",	"mymagic_tools:axe_blade_bronze"},
			{"default:mese_crystal",	"mymagic_tools:axe_blade_mese"},
			{"default:diamond",			"mymagic_tools:axe_blade_diamond"},
			}
	for i in ipairs (blade_list) do
		local mat = blade_list[i][1]
		local bld = blade_list[i][2]

		if   b1:get_name() == mat and
		     b2:get_name() == mat and
		     b3:get_name() == mat then
				blade = bld
				make_blade = true
		end
	end
		if make_blade == true then
			inv:add_item("blade",blade)
			
			b1:take_item()
			inv:set_stack("blade1",1,b1)
			
			b2:take_item()
			inv:set_stack("blade2",1,b2)
			
			b3:take_item()
			inv:set_stack("blade3",1,b3)
		end

elseif fields["hbutton"]then
		make_handle = false

		if inv:is_empty("handle1") or
		 inv:is_empty("handle2") or
		 inv:is_empty("handle3") then
			return
		end

	local h1 = inv:get_stack("handle1", 1)
	local h2 = inv:get_stack("handle2", 1)
	local h3 = inv:get_stack("handle3", 1)

		if   h1:get_name() == "default:stick" and
		     h2:get_name() == "default:stick" and
		     h3:get_name() == "default:stick" then
				handle = "mymagic_tools:axe_handle"
				make_handle = true
		end
		if make_handle == true then
			inv:add_item("handle",handle)
			
			h1:take_item()
			inv:set_stack("handle1",1,h1)
			
			h2:take_item()
			inv:set_stack("handle2",1,h2)
			
			h3:take_item()
			inv:set_stack("handle3",1,h3)
		end

elseif fields["abutton"]then
		make_sword = false

		if inv:is_empty("blade") or
		 inv:is_empty("handle") then
			return
		end

	local s1 = inv:get_stack("blade", 1)
	local s2 = inv:get_stack("handle", 1)

	local maters = {"wood","stone","steel","bronze","mese","diamond"}
	
	for i=1,#maters do
	local mater = maters[i]
	
		if   s1:get_name() == "mymagic_tools:axe_blade_"..mater and
		     s2:get_name() == "mymagic_tools:axe_handle" then
				axe = "default:axe_"..mater
				make_axe = true
		end
	end
		if make_axe == true then
			inv:add_item("axe",axe)
			
			s1:take_item()
			inv:set_stack("blade",1,s1)
			
			s2:take_item()
			inv:set_stack("handle",1,s2)
		end
end
end,
})
















