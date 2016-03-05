dofile(minetest.get_modpath("mymagic_tools").."/craftitems.lua")

--default tools
dofile(minetest.get_modpath("mymagic_tools").."/default_knife.lua")
dofile(minetest.get_modpath("mymagic_tools").."/default_shovel.lua")
dofile(minetest.get_modpath("mymagic_tools").."/default_axe.lua")
dofile(minetest.get_modpath("mymagic_tools").."/default_sword.lua")
dofile(minetest.get_modpath("mymagic_tools").."/default_pick.lua")

--enchanted tools
dofile(minetest.get_modpath("mymagic_tools").."/enchanted_swords.lua")
dofile(minetest.get_modpath("mymagic_tools").."/enchanted_axes.lua")
dofile(minetest.get_modpath("mymagic_tools").."/enchanted_knives.lua")
dofile(minetest.get_modpath("mymagic_tools").."/enchanted_picks.lua")
dofile(minetest.get_modpath("mymagic_tools").."/enchanted_shovels.lua")

--forges
--dofile(minetest.get_modpath("mymagic_tools").."/forge_axe.lua")
dofile(minetest.get_modpath("mymagic_tools").."/forge_sword.lua")

local mod_3darmor = minetest.get_modpath("3d_armor")
if mod_3darmor then
	dofile(minetest.get_modpath("mymagic_tools").."/forge_armor.lua")
	dofile(minetest.get_modpath("mymagic_tools").."/enchanted_armor.lua")
end





