local door_bottom_box_closed = {type = "fixed",fixed = {
			{-0.5, -0.5, -0.5, -0.25, 0.5, 0.5},
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},}}

local door_bottom_box_open = {type = "fixed",fixed = {
			{-0.5, -0.5, -0.5, -0.25, 0.5, 0.5},
			{-0.5, -0.5, -0.1875, 0, 0.5, 0.1875},}}

local door_top_box_closed = {type = "fixed",fixed = {
			{-0.5, -0.5, -0.5, -0.25, 0.5, 0.5},
			{-0.5, -0.5, -0.1875, 0.5, 0.5, 0.1875},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{-0.5, 0.375, -0.5, 0.1875, 0.5, 0.5},
			{-0.5, 0.3125, -0.5, 0.0625, 0.5, 0.5},
			{-0.5, 0, -0.5, -0.1875, 0.5, 0.5},
			{-0.5, 0.125, -0.5, -0.125, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, -0.0625, 0.5, 0.5},
			{-0.5, 0.25, -0.5, 0, 0.5, 0.5},}}

local door_top_box_open = {type = "fixed",fixed = {
			{-0.5, -0.5, -0.5, -0.25, 0.5, 0.5},
			{-0.5, -0.5, -0.1875, 0, 0.5, 0.1875},
			{-0.5, 0.4375, -0.5, 0.5, 0.5, 0.5},
			{-0.5, 0.375, -0.5, 0.1875, 0.5, 0.5},
			{-0.5, 0.3125, -0.5, 0.0625, 0.5, 0.5},
			{-0.5, 0, -0.5, -0.1875, 0.5, 0.5},
			{-0.5, 0.125, -0.5, -0.125, 0.5, 0.5},
			{-0.5, 0.1875, -0.5, -0.0625, 0.5, 0.5},
			{-0.5, 0.25, -0.5, 0, 0.5, 0.5},}}

local door_box = {type = "fixed",fixed = {
			{-0.5, -0.5, -0.1875, 1.5, 1.5, 0.1875},}}

local nobox = {type = "fixed",fixed = {
			{0, 0, 0, 0, 0, 0},}}

local door_nodes = {
	{"dungeon",			"Magic Door",				0,{"default_stone_brick.png"},	door_bottom_box_closed,	door_box},
	{"bottom_closed",	"a",						1,{"default_stone_brick.png"},	door_bottom_box_closed,	nobox},
	{"bottom_open",		"a",						1,{"default_stone_brick.png"},	door_bottom_box_open,	nobox},
	{"bottom_open2",	"a",						1,{"default_stone_brick.png"},	door_bottom_box_open,	door_box},
	{"top_closed",		"a",						1,{"default_stone_brick.png"},	door_top_box_closed,	nobox},
	{"top_open",		"a",						1,{"default_stone_brick.png"},	door_top_box_open,		nobox},
	}
for i in ipairs(door_nodes) do
	local itm = door_nodes[i][1]
	local des = door_nodes[i][2]
	local nic = door_nodes[i][3]
	local til = door_nodes[i][4]
	local nbox = door_nodes[i][5]
	local sbox = door_nodes[i][6]

minetest.register_node("mymagic:door_"..itm,{
	description = des,
	tiles = til,
	drawtype = "nodebox",
	paramtype = "light",
	paramtype2 = "facedir",
	groups = {cracky = 1, not_in_creative_inventory = nic},
	node_box = nbox,
	selection_box = sbox,
})
end
minetest.override_item("mymagic:door_dungeon",{
	on_place = function(itemstack, placer, pointed_thing)
		local dir = minetest.dir_to_facedir(placer:get_look_dir())
		local pos = pointed_thing.above
		local pt = pos
			if dir == 0 then
				pt = {x=pos.x+1,y=pos.y,z=pos.z}
			elseif dir == 1 then
				pt = {x=pos.x,y=pos.y,z=pos.z-1}
			elseif dir == 2 then
				pt = {x=pos.x-1,y=pos.y,z=pos.z}
			elseif dir == 3 then
				pt = {x=pos.x,y=pos.y,z=pos.z+1}
			end
		local par = dir
		local par2 = dir + 2
			if par2 == 4 then
				par2 = 0
			elseif par2 == 5 then
				par2 = 1
			end
		minetest.set_node(pos,{name = "mymagic:door_dungeon", param2 = dir})
		minetest.set_node(pt,{name = "mymagic:door_bottom_closed", param2 = par2})
		minetest.set_node({x=pos.x,y=pos.y+1,z=pos.z},{name = "mymagic:door_top_closed", param2 = dir})
		minetest.set_node({x=pt.x,y=pt.y+1,z=pt.z},{name = "mymagic:door_top_closed", param2 = par2})
	end,
	after_destruct = function(pos, oldnode)
	local door = minetest.find_nodes_in_area({x=pos.x-1,y=pos.y,z=pos.z-1},{x=pos.x+1,y=pos.y+1,z=pos.z+1}, {"mymagic:door_dungeon","mymagic:door_bottom_closed","mymagic:door_top_closed"})
		for k, p in pairs(door) do
			minetest.set_node(p,{name="air"})
		end
	end,
	on_punch = function(pos, node, puncher, pointed_thing)
	local timer = minetest.get_node_timer(pos)
	local wi = puncher:get_wielded_item()
	if wi:get_name() == "mymagic:orb_orange" or
	   wi:get_name() == "mymagic:orb_green" or
	   wi:get_name() == "mymagic:orb_blue" or
	   wi:get_name() == "mymagic:orb_red" then
		local door = minetest.find_nodes_in_area({x=pos.x-1,y=pos.y,z=pos.z-1},{x=pos.x+1,y=pos.y+1,z=pos.z+1}, {"mymagic:door_dungeon","mymagic:door_bottom_closed","mymagic:door_top_closed"})
		for k, p in pairs(door) do
			local pnode = minetest.get_node(p)
			if pnode.name == "mymagic:door_dungeon" then
				minetest.swap_node(p,{name="mymagic:door_bottom_open2", param2=pnode.param2})
			elseif pnode.name == "mymagic:door_bottom_closed" then
				minetest.swap_node(p,{name="mymagic:door_bottom_open", param2=pnode.param2})
			elseif pnode.name == "mymagic:door_top_closed" then
				minetest.swap_node(p,{name="mymagic:door_top_open", param2=pnode.param2})
			end
		end
		timer:start(3)
	else minetest.chat_send_player(puncher:get_player_name(), "You need to hold an orb to open!")
	end
	end,

})
minetest.override_item("mymagic:door_bottom_open2",{
	on_timer = function(pos, elapsed)
		local door = minetest.find_nodes_in_area({x=pos.x-1,y=pos.y,z=pos.z-1},{x=pos.x+1,y=pos.y+1,z=pos.z+1}, {"mymagic:door_bottom_open2","mymagic:door_bottom_open","mymagic:door_top_open"})
			for k, p in pairs(door) do
				local pnode = minetest.get_node(p)
				if pnode.name == "mymagic:door_bottom_open2" then
					minetest.swap_node(p,{name="mymagic:door_dungeon", param2=pnode.param2})
				elseif pnode.name == "mymagic:door_bottom_open" then
					minetest.swap_node(p,{name="mymagic:door_bottom_closed", param2=pnode.param2})
				elseif pnode.name == "mymagic:door_top_open" then
					minetest.swap_node(p,{name="mymagic:door_top_closed", param2=pnode.param2})
				end
			end
	end,
	after_destruct = function(pos, oldnode)
	local door = minetest.find_nodes_in_area({x=pos.x-1,y=pos.y,z=pos.z-1},{x=pos.x+1,y=pos.y+1,z=pos.z+1}, {"mymagic:door_open2","mymagic:door_bottom_open","mymagic:door_top_open"})
		for k, p in pairs(door) do
			minetest.set_node(p,{name="air"})
		end
	end,
})



minetest.register_craft({
	output = "mymagic:door_dungeon",
	recipe = {
			{"default:stonebrick","default:stonebrick","default:stonebrick"},
			{"default:stonebrick","mymagic:orb_orange","default:stonebrick"},
			{"default:stonebrick","default:stonebrick","default:stonebrick"},
			},
})





