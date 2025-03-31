--[[
    This function helps with creating transformation wands easy
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
                cracky = { times = {[1] = 2.0, [2] = 1.0, [3] = 0.50}, uses = 20, maxlevel = 1 },
            },
            damage_groups = { fleshy = 5 },
        },
        on_use = function(itemstack, user, pointed_thing)
            local start_pos = vector.add(user:get_pos(), { x = 0, y = 1.5, z = 0 })
            local direction = user:get_look_dir()
            local ray_length = 50 
            local end_pos = vector.add(start_pos, vector.multiply(direction, ray_length))
            local ray = minetest.raycast(start_pos, end_pos, false, false)

            core.add_particle({
                pos = start_pos,
                velocity = vector.multiply(direction, 10), 
                acceleration = { x = 0, y = 0, z = 0 },
                expirationtime = 0.5,
                size = 2,
                texture = wand_info.ray_particle,
            })

            for pointed in ray do
                if pointed.type == "node" then
                    local hit_pos = {}
                    if wand_info.node_above then
                        hit_pos = {vector.round(pointed.under)}
                    else
                        hit_pos = {vector.round(pointed.above)}
                    end
                    local distance = vector.distance(start_pos, hit_pos)
                    local delay = distance / 30
                    core.after(delay, function()
                        local node = minetest.get_node(hit_pos)
                        if node.name == wand_info.change_from then
                            minetest.set_node(hit_pos, { name = wand_info.change_to })
                            for dx = -1, 1 do
                                for dy = -1, 1 do
                                    for dz = -1, 1 do
                                        local surrounding_pos = vector.add(hit_pos, { x = dx, y = dy, z = dz })
                                        local surrounding_node = minetest.get_node(surrounding_pos)
                                        if surrounding_node.name == wand_info.change_from then
                                            core.set_node(surrounding_pos, { name = wand_info.change_to })
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
end


--[[
    Fire Wand
        - Transforms default:stone to default:lava_source
]]
local fire_wand = {
    name = "Fire Wand",
    description = "Turns stone into lava",
    texture = "mymagic_wand_red.png",
    change_from = "default:stone",
    change_to = "default:lava_source",
    ray_particle = "fire_basic_flame.png",
    node_above = false,
}

register_transform_wand(fire_wand)

--[[
    Ice Wand
        - Transforms default:water_source to default:ice
]]
local ice_wand = {
    name = "Ice Wand",
    description = "Turns water into ice",
    texture = "mymagic_wand_blue.png",
    change_from = "default:water_source",
    change_to = "default:ice",
    ray_particle = "default_snowball.png",
    node_above = true,
}

register_transform_wand(ice_wand)

--[[
    Ice Wand
        - Transforms default:sand to default:glass
]]
--local ice_wand = {
--    name = "The Glassweaver",
--    description = "Turns sand into glass",
--    texture = "mymagic_wand_blue.png",
--    change_from = "default:water_source",
--    change_to = "default:ice",
--    ray_particle = "default_snowball.png",
--    node_above = true,
--}
--
--register_transform_wand(ice_wand)

