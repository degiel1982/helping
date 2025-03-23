local COLOR_TIMES = { orange = 5, green = 10, blue = 15, red = 20 }
local materials = { "wood", "stone", "steel", "bronze", "mese", "diamond" }
local toolTypes = { "axe", "pick", "shovel", "sword", "knife" }
local candidates = {}

-- Build candidate list for enchanted tools.
for _, t in ipairs(toolTypes) do
	for _, col in ipairs({ "orange", "green", "blue", "red" }) do
		for _, mat in ipairs(materials) do
			table.insert(candidates, { "mymagic_tools:" .. t .. "_enchanted_" .. mat .. "_" .. col, col })
		end
	end
end

-- Add diamond armor candidates.
for _, cand in ipairs({
	{ "mymagic_tools:diamond_helmet_orange", "orange" },
	{ "mymagic_tools:diamond_chestplate_orange", "orange" },
	{ "mymagic_tools:diamond_leggings_orange", "orange" },
	{ "mymagic_tools:diamond_boots_orange", "orange" },
	{ "mymagic_tools:diamond_helmet_green", "green" },
	{ "mymagic_tools:diamond_chestplate_green", "green" },
	{ "mymagic_tools:diamond_leggings_green", "green" },
	{ "mymagic_tools:diamond_boots_green", "green" },
	{ "mymagic_tools:diamond_helmet_blue", "red" },
	{ "mymagic_tools:diamond_chestplate_blue", "red" },
	{ "mymagic_tools:diamond_leggings_blue", "red" },
	{ "mymagic_tools:diamond_boots_blue", "red" },
}) do
	table.insert(candidates, cand)
end

-- Helper function to compose the formspec.
-- Optional parameters:
--   countdown - seconds remaining (displayed as a timer)
--   msg       - a message string (such as an error) to display.
local function get_formspec(countdown, msg)
	local timer_label = ""
	if countdown and countdown > 0 then
		timer_label = "label[5,0.5;Charging: " .. countdown .. " sec remaining]"
	end
	local message_label = ""
	if msg then
		message_label = "label[5,1;" .. msg .. "]"
	end
	return "size[9,8]" ..
		"background[0,0;8,8;mymagic_gem_block_bg.png;true]" ..
		"listcolors[#5e4300;#936800;#000000]" ..
		"label[0,0;Tool]" ..
		"label[1,0;Orb]" ..
		"list[current_name;tool;0,1;1,1;]" ..
		"list[current_name;orb;1,1;1,1;]" ..
		"button[2,1;1,1;button;Charge]" ..
		"list[current_name;output;3,1;1,1;]" ..
		"list[current_player;main;0.5,4;8,4;]" ..
		(timer_label or "") ..
		(message_label or "")
end

minetest.register_node("mymagic:tool_recharge", {
	description = "Tool Recharging Station",
	tiles = {
		"mymagic_tool_recharge_top.png", "mymagic_tool_recharge_top.png",
		"mymagic_tool_recharge.png", "mymagic_tool_recharge.png",
		"mymagic_tool_recharge.png", "mymagic_tool_recharge.png",
	},
	drawtype = "normal",
	paramtype = "light",
	paramtype2 = "facedir",
	light_source = 7,
	groups = { cracky = 1 },

	after_place_node = function(pos, placer)
		local meta = minetest.get_meta(pos)
		meta:set_string("infotext", "Tool Recharging Station")
		meta:set_string("formspec", get_formspec())
	end,

	can_dig = function(pos, player)
		local inv = minetest.get_meta(pos):get_inventory()
		return inv:is_empty("tool") and inv:is_empty("orb") and inv:is_empty("output")
	end,

	on_construct = function(pos)
		local meta = minetest.get_meta(pos)
		meta:set_string("formspec", get_formspec())
		meta:set_string("infotext", "Tool Recharging Station")
		local inv = meta:get_inventory()
		inv:set_size("tool", 1)
		inv:set_size("orb", 1)
		inv:set_size("output", 1)
	end,

	on_receive_fields = function(pos, formname, fields, sender)
		if not fields.button then
			return
		end
		local meta = minetest.get_meta(pos)
		local inv = meta:get_inventory()
		if inv:is_empty("tool") or inv:is_empty("orb") or not inv:is_empty("output") then
			return
		end
		local toolStack = inv:get_stack("tool", 1)
		local orbStack  = inv:get_stack("orb", 1)
		for _, cand in ipairs(candidates) do
			if toolStack:get_name() == cand[1] and orbStack:get_name() == "mymagic:orb_" .. cand[2] then

				-- Check if the tool is already undamaged.
				if toolStack:get_wear() == 0 then
					-- Display a message in the formspec that charging is not possible.
					meta:set_string("formspec", get_formspec(nil, "Recharge not possible: Tool is undamaged!"))
					meta:set_string("infotext", "Recharge not possible: Tool is undamaged!")
					return
				end

				local delay = COLOR_TIMES[cand[2]]
				-- Start a countdown that updates the formspec.
				local function update_timer(remaining)
					local meta_after = minetest.get_meta(pos)
					meta_after:set_string("formspec", get_formspec(remaining))
					if remaining > 0 then
						minetest.after(1, update_timer, remaining - 1)
					else
						local inv_after = meta_after:get_inventory()
						local currentTool = inv_after:get_stack("tool", 1)
						local currentOrb  = inv_after:get_stack("orb", 1)
						if currentTool:get_name() == cand[1] and currentOrb:get_name() == "mymagic:orb_" .. cand[2] then
							currentTool:add_wear(-10000)
							inv_after:set_stack("output", 1, currentTool)
							currentOrb:take_item()
							inv_after:set_stack("orb", 1, currentOrb)
							currentTool:take_item()
							inv_after:set_stack("tool", 1, currentTool)
						else
							minetest.log("action", "[mymagic] Recharging operation cancelled due to changed inventory.")
						end
						meta_after:set_string("formspec", get_formspec())
					end
				end
				update_timer(delay)
				break
			end
		end
	end,
})

minetest.register_craft({
	output = "mymagic:tool_recharge",
	recipe = {
		{"default:steel_ingot", "mymagic:orb_orange", "default:steel_ingot"},
		{"default:steel_ingot", "default:brick", "default:steel_ingot"},
		{"default:steel_ingot", "default:steel_ingot", "default:steel_ingot"},
	},
})
