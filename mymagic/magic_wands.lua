--[[
    This function helps with creating transformation wands easy.
    - Left-click (on_use) transforms nodes from change_from to change_to.
    - Right-click (on_place) uses the same raycast trajectory but reverts the node from change_to back to change_from.
]]
local function register_transform_wand(wand_info)
    minetest.register_tool("mymagic:" .. wand_info.name, {
        description = wand_info.description,
        inventory_image = wand_info.texture,
        wield_image = wand_info.texture,
        tool_capabilities = {
            full_punch_interval = 1.0,
            max_drop_level = 1,
            groupcaps = {
                cracky = { times = { [1] = 2.0, [2] = 1.0, [3] = 0.50 }, uses = 20, maxlevel = 1 },
            },
            damage_groups = { fleshy = 5 },
        },

        -- Left-click: Transform nodes (from change_from to change_to)
        on_use = function(itemstack, user, pointed_thing)
            local start_pos = vector.add(user:get_pos(), { x = 0, y = 1.5, z = 0 })
            local direction = user:get_look_dir()
            local ray_length = 50 
            local end_pos = vector.add(start_pos, vector.multiply(direction, ray_length))
            local ray = minetest.raycast(start_pos, end_pos, false, false)

            -- Visual feedback with a particle effect
            core.add_particle({
                pos = start_pos,
                velocity = vector.multiply(direction, 10),
                acceleration = { x = 0, y = 0, z = 0 },
                expirationtime = 0.5,
                size = 2,
                texture = wand_info.ray_particle_on_use,
            })

            for pointed in ray do
                if pointed.type == "node" then
                    local hit_pos = wand_info.node_above_use and vector.round(pointed.under) or vector.round(pointed.above)
                    local distance = vector.distance(start_pos, hit_pos)
                    local delay = distance / 30
                    core.after(delay, function()
                        local node = minetest.get_node(hit_pos)
                        if node.name == wand_info.change_from then
                            minetest.set_node(hit_pos, { name = wand_info.change_to })
                            -- Optionally, transform surrounding nodes as well
                            for dx = -1, 1 do
                                for dy = -1, 1 do
                                    for dz = -1, 1 do
                                        local surrounding_pos = vector.add(hit_pos, { x = dx, y = dy, z = dz })
                                        local surrounding_node = minetest.get_node(surrounding_pos)
                                        if surrounding_node.name == wand_info.change_from then
                                            minetest.set_node(surrounding_pos, { name = wand_info.change_to })
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    break
                end
            end
            return itemstack
        end,

        -- Right-click: Revert transformation (from change_to back to change_from) using the same raycast trajectory
        on_place = function(itemstack, user, pointed_thing)
            local start_pos = vector.add(user:get_pos(), { x = 0, y = 1.5, z = 0 })
            local direction = user:get_look_dir()
            local ray_length = 50 
            local end_pos = vector.add(start_pos, vector.multiply(direction, ray_length))
            local ray = minetest.raycast(start_pos, end_pos, false, false)

            -- Re-use the same particle effect for consistency
            core.add_particle({
                pos = start_pos,
                velocity = vector.multiply(direction, 10),
                acceleration = { x = 0, y = 0, z = 0 },
                expirationtime = 0.5,
                size = 2,
                texture = wand_info.ray_particle_on_place,
            })

            for pointed in ray do
                if pointed.type == "node" then
                    local hit_pos = wand_info.node_above_place and vector.round(pointed.under) or vector.round(pointed.above)
                    local distance = vector.distance(start_pos, hit_pos)
                    local delay = distance / 30
                    core.after(delay, function()
                        local node = minetest.get_node(hit_pos)
                        if node.name == wand_info.change_to then
                            minetest.set_node(hit_pos, { name = wand_info.change_from })
                            -- Optionally, revert surrounding nodes as well
                            for dx = -1, 1 do
                                for dy = -1, 1 do
                                    for dz = -1, 1 do
                                        local surrounding_pos = vector.add(hit_pos, { x = dx, y = dy, z = dz })
                                        local surrounding_node = minetest.get_node(surrounding_pos)
                                        if surrounding_node.name == wand_info.change_to then
                                            minetest.set_node(surrounding_pos, { name = wand_info.change_from })
                                        end
                                    end
                                end
                            end
                        end
                    end)
                    break
                end
            end
            return itemstack
        end,
    })

    -- Register the recipe if one is provided
    if wand_info.recipe then
        minetest.register_craft({
            output = "mymagic:" .. wand_info.name,
            recipe = wand_info.recipe,
        })
    end
end


--[[
    Fire Wand
        - Transforms default:stone to default:lava_source
]]
local fire_wand = {
    name = "fire_wand",
    description = "Inferno's Embrace - Lava / Stone",
    texture = "mymagic_wand_red.png",
    change_from = "default:stone",
    change_to = "default:lava_source",
    ray_particle_on_use = "default_lava.png",
    ray_particle_on_place = "fire_basic_flame.png",
    node_above_use = true,
    node_above_place = false,
    recipe = {
        {"default:lava_source", "default:stone", "default:lava_source"},
        {"", "default:stick", ""},
    },
}

register_transform_wand(fire_wand)

--[[
    Ice Wand
        - Transforms default:water_source to default:ice
]]
local ice_wand = {
    name = "ice_wand",
    description = "Winter's Whisper - Water / Ice",
    texture = "mymagic_wand_blue.png",
    change_from = "default:water_source",
    change_to = "default:ice",
    ray_particle_on_use = "default_ice.png",
    ray_particle_on_place = "default_water.png",
    node_above_use = false,
    node_above_place = true,
    recipe = {
        {"default:lava_source", "default:stone", "default:lava_source"},
        {"", "default:stick", ""},
    },
}

register_transform_wand(ice_wand)

--[[
    The Glassweaver
        - Transforms default:sand to default:glass
]]
local glass_wand = {
    name = "glassweaver",
    description = "The Glassweaver - Sand / Glass",
    texture = "mymagic_wand_orange.png",
    change_from = "default:sand",
    change_to = "default:glass",
    ray_particle_on_use = "default_sand.png",
    ray_particle_on_place = "default_glass.png",
    node_above_use = true,
    node_above_place = true,
    recipe = {
        {"default:lava_source", "default:stone", "default:lava_source"},
        {"", "default:stick", ""},
    },
}

register_transform_wand(glass_wand)

--[[
    The Lawn Layer
        - Transforms default:dirt to default:dirt_with_grass
]]
local dirt_wand = {
    name = "lawn_layer",
    description = "The Lawn Layer - Dirt / Dirt With Grass",
    texture = "mymagic_wand_green.png",
    change_from = "default:dirt",
    change_to = "default:dirt_with_grass",
    ray_particle_on_use = "default_dirt.png",
    ray_particle_on_place = "default_dirt.png",
    node_above_use = true,
    node_above_place = true,
    recipe = {
        {"default:lava_source", "default:stone", "default:lava_source"},
        {"", "default:stick", ""},
    },
}

register_transform_wand(dirt_wand)


--[[
    The Lawn Layer
        - Transforms default:dirt to default:dirt_with_grass
]]
local obs_glass = {
    name = "obs_glass",
    description = "Shadowglaze - Glass / Obsidian Glass",
    texture = "mymagic_wand_orange2.png",
    change_from = "default:glass",
    change_to = "default:obsidian_glass",
    ray_particle_on_use = "default_obsidian_glass.png",
    ray_particle_on_place = "default_glass.png",
    node_above_use = true,
    node_above_place = true,
    recipe = {
        {"default:lava_source", "default:stone", "default:lava_source"},
        {"", "default:stick", ""},
    },
}

register_transform_wand(obs_glass)
