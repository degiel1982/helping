--[[
  1. Added freeze wand (names can vary and images too)

  I will add more but it took me a moment to get the placement right
  Just test this one out first and tell me what you would like to do with this one.
  For now it freezes water_souce in to ice.
]]

-- Helper function to register a wand
local function register_magic_wand(name, description, texture, ability_function)
    minetest.register_tool("mymagic:" .. name, {
        description = description,
        inventory_image = texture,
        wield_image = texture,
        tool_capabilities = {
            full_punch_interval = 1.0,
            max_drop_level = 1,
            groupcaps = {
                cracky = {times = {[1] = 2.0, [2] = 1.0, [3] = 0.50}, uses = 20, maxlevel = 1},
            },
            damage_groups = {fleshy = 5},
        },
        on_use = ability_function,
    })
end

local function freeze_ability(itemstack, user, pointed_thing)
    local pos
    local ray = minetest.raycast(user:get_pos(), vector.add(user:get_pos(), vector.multiply(user:get_look_dir(), 10)), false, false)

    for pointed in ray do
        if pointed.type == "node" then
            local node_pos = pointed.under
            local node = minetest.get_node(node_pos)

            -- Check if the node is a water source block
            if node.name == "default:water_source" then
                minetest.set_node(node_pos, {name = "default:ice"}) -- Replace water source with ice
                minetest.chat_send_player(user:get_player_name(), "You froze the water into ice!")
            else
                minetest.chat_send_player(user:get_player_name(), "This is not a water source block!")
            end
            break -- End the loop once a valid node is found
        end
    end

    return itemstack
end

-- Register wands
register_magic_wand("freeze_wand", "Freezing Wand", "mymagic_wand_blue.png", freeze_ability)

minetest.register_craft({
    output = "mymagic:freeze_wand",
    recipe = {
        {"default:stick", "mymagic:orb_white", "default:stick"},
        {"", "default:gold_ingot", ""},
        {"", "default:stick", ""},
    },
})
