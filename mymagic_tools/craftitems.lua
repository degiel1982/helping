
local parts = {
	{"Wood Axe Head","axe_blade_wood"},
	{"Stone Axe Head","axe_blade_stone"},
	{"Steel Axe Head","axe_blade_steel"},
	{"Bronze Axe Head","axe_blade_bronze"},
	{"Mese Axe Head","axe_blade_mese"},
	{"Diamond Axe Head","axe_blade_diamond"},
	{"Axe Handle","axe_handle"},
	}
for i in ipairs (parts) do
	local des = parts[i][1]
	local mat = parts[i][2]

minetest.register_craftitem("mymagic_tools:"..mat,{
	description = des,
	inventory_image = "mymagic_"..mat..".png",
	groups = {not_in_creative_inventory = 1}
})
end
local items = {
	{"Wood Blade","blade_wood","sword_wood"},
	{"Stone Blade","blade_stone","sword_stone"},
	{"Steel Blade","blade_steel","sword_steel"},
	{"Bronze Blade","blade_bronze","sword_bronze"},
	{"Mese Blade","blade_mese","sword_mese"},
	{"Diamond Blade","blade_diamond","sword_diamond"},
	}
for i in ipairs(items) do
local des = items[i][1]
local itm = items[i][2]
local cra = items[i][3]

minetest.register_craftitem("mymagic_tools:"..itm,{
	description = des,
	inventory_image = "mymagic_sword_"..itm..".png",
	groups = {not_in_creative_inventory = 1}
	})

end
minetest.register_craftitem("mymagic_tools:handle_wood",{
	description = "Wood Sword Handle",
	inventory_image = "mymagic_sword_handle_wood.png",
	groups = {not_in_creative_inventory = 1}
	})
