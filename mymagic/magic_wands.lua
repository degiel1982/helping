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

-- Wand abilities

--Freeze
local function freeze_ability(itemstack, user, pointed_thing)
    local pos

    if pointed_thing.type == "node" then
        -- Get the position of the node in the negative direction of the pointed node
        local dir = user:get_look_dir()
        pos = vector.subtract(pointed_thing.under, vector.round(dir)) -- Move in the negative direction
    else
        -- If pointing at nothing, calculate the position in front of the player
        local dir = user:get_look_dir()
        local player_pos = user:get_pos()
        pos = vector.add(player_pos, vector.multiply(dir, 1)) -- 2 blocks in front of the player
    end

    -- Round the position to ensure it aligns with the node grid
    pos = vector.round(pos)

    -- Get the node at the calculated position
    local node = minetest.get_node(pos)

    -- Check if the node is a water source block
    if node.name == "default:water_source" then
        minetest.set_node(pos, {name = "default:ice"}) -- Replace water source with ice
        minetest.chat_send_player(user:get_player_name(), "You froze the water into ice!")
    else
        minetest.chat_send_player(user:get_player_name(), "This is not a water source block!")
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
