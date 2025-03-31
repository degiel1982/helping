local function register_magic_wand(name, description, texture, ability_function)
    minetest.register_tool("mymagic:" .. name, {
        description = description,
        inventory_image = texture,
        wield_image = texture,
        tool_capabilities = {
            full_punch_interval = 1.0,
            max_drop_level = 1,
            groupcaps = {
                cracky = { times = {[1] = 2.0, [2] = 1.0, [3] = 0.50}, uses = 20, maxlevel = 1 },
            },
            damage_groups = { fleshy = 5 },
        },
        on_use = ability_function,
    })
end



local function freeze_ability(itemstack, user, pointed_thing)
    -- Set the start position at the player's eye level.
    local start_pos = vector.add(user:get_pos(), { x = 0, y = 1.5, z = 0 })
    local direction = user:get_look_dir()
    local ray_length = 50  -- Define how far the ray goes.
    local end_pos = vector.add(start_pos, vector.multiply(direction, ray_length))
    local ray = minetest.raycast(start_pos, end_pos, false, false)

    -- Visualize the trajectory of the spell with a particle effect.
    minetest.add_particle({
        pos = start_pos,
        velocity = vector.multiply(direction, 10),  -- Speed for visualization.
        acceleration = { x = 0, y = 0, z = 0 },
        expirationtime = 0.5,
        size = 2,
        texture = "default_snowball.png",
    })

    -- Process the raycast results.
    for pointed in ray do
        if pointed.type == "node" then
            -- Use pointed.above as the collision position (where the ray "hits").
            local hit_pos = vector.round(pointed.above)
            local distance = vector.distance(start_pos, hit_pos)
            local delay = distance / 30 -- Delay determined by the assumed visual speed of 10 units/second.

            minetest.after(delay, function()
                local node = minetest.get_node(hit_pos)
                if node.name == "default:water_source" then
                    -- Freeze the hit node.
                    minetest.set_node(hit_pos, { name = "default:ice" })
                    
                    -- Check surrounding nodes (in a 3×3×3 cube centered on the hit point)
                    for dx = -1, 1 do
                        for dy = -1, 1 do
                            for dz = -1, 1 do
                                local surrounding_pos = vector.add(hit_pos, { x = dx, y = dy, z = dz })
                                local surrounding_node = minetest.get_node(surrounding_pos)
                                if surrounding_node.name == "default:water_source" then
                                    minetest.set_node(surrounding_pos, { name = "default:ice" })
                                end
                            end
                        end
                    end
                end
            end)
            break  -- Stop processing after the first node hit.
        end
    end

    return itemstack
end

local function fire_ability(itemstack, user, pointed_thing)
    -- Set the start position at the player's eye level.
    local start_pos = vector.add(user:get_pos(), { x = 0, y = 1.5, z = 0 })
    local direction = user:get_look_dir()
    local ray_length = 50  -- Define how far the ray goes.
    local end_pos = vector.add(start_pos, vector.multiply(direction, ray_length))
    local ray = minetest.raycast(start_pos, end_pos, false, false)

    -- Visualize the trajectory of the spell with a particle effect.
    minetest.add_particle({
        pos = start_pos,
        velocity = vector.multiply(direction, 10),  -- Speed for visualization.
        acceleration = { x = 0, y = 0, z = 0 },
        expirationtime = 0.5,
        size = 2,
        texture = "fire_basic_flame.png",
    })

    -- Process the raycast results.
    for pointed in ray do
        if pointed.type == "node" then
            -- Use pointed.above as the collision position (where the ray "hits").
            local hit_pos = vector.round(pointed.under)
            local distance = vector.distance(start_pos, hit_pos)
            local delay = distance / 30 -- Delay determined by the assumed visual speed of 10 units/second.

            minetest.after(delay, function()
                local node = minetest.get_node(hit_pos)
                if node.name == "default:stone" then
                    -- Freeze the hit node.
                    minetest.set_node(hit_pos, { name = "default:lava_source" })
                    
                    -- Check surrounding nodes (in a 3×3×3 cube centered on the hit point)
                    for dx = -1, 1 do
                        for dy = -1, 1 do
                            for dz = -1, 1 do
                                local surrounding_pos = vector.add(hit_pos, { x = dx, y = dy, z = dz })
                                local surrounding_node = minetest.get_node(surrounding_pos)
                                if surrounding_node.name == "default:stone" then
                                    minetest.set_node(surrounding_pos, { name = "default:lava_source" })
                                end
                            end
                        end
                    end
                end
            end)
            break  -- Stop processing after the first node hit.
        end
    end

    return itemstack
end

-- Register the freezing wand.
register_magic_wand("freeze_wand", "Freezing Wand", "mymagic_wand_blue.png", freeze_ability)

-- Register the freezing wand.
register_magic_wand("fire_wand", "Fire Wand", "mymagic_wand_red.png", fire_ability)
