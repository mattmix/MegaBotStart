script.on_event(defines.events.on_player_created, function(event)
	local items
	local armor
	local robotname
	local ReactorName = "fusion-reactor-equipment" --4x4
	local ShieldName = "energy-shield-mk2-equipment" --2x2
	local RoboportName = "personal-roboport-mk2-equipment" --2x2
	local BatteryName = "battery-mk2-equipment" --1x2
	local LaserDefenseName = "personal-laser-defense-equipment" --2x2
	local ExoskeletonName = "exoskeleton-equipment" --2x4
	local NightvisionName = "night-vision-equipment"

	--Personal Equipment gives upgraded options, lets use a few.
	if game.active_mods["bobequipment"] then
		ReactorName = "fusion-reactor-equipment-4" --Reactor 4 4x4
		ShieldName = "energy-shield-mk6-equipment" --Shield 6 2x2
		RoboportName = "personal-roboport-mk4-equipment" --Roboport 4 2x2
		BatteryName = "battery-mk6-equipment" --Battery 6 1x2
		LaserDefenseName = "personal-laser-defense-equipment-6" --Laser Defense 6 2x2
		ExoskeletonName = "exoskeleton-equipment-3" --Exoskeleton 3 2x4
		NightvisionName = "night-vision-equipment-3" --2x2
	end

--Logistics gives us upgraded bots
if game.active_mods["boblogistics"] then
	robotname = "bob-construction-robot-5"
else
	robotname = "construction-robot"
end

items = {{robotname, settings.global["starting robot count"].value}}

if game.active_mods["Krastorio2"] then
	--Krastorio, mk 4, 12x12
	items.insert {
		{"power-armor-mk4", 1},
		--Reactors require fuel
		{"k-dt-fuel", 600},
	}

	armor = {
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{RoboportName},
		{RoboportName},
		{RoboportName},
		{RoboportName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
		{BatteryName},
		{BatteryName},
		{NightvisionName},
		{ExoskeletonName},
		{ExoskeletonName},
		{ExoskeletonName},
		{ExoskeletonName},
	}

else if game.active_mods["bobwarfare"] then
	--Bob's Warfare, mk 5, 16x16 grid
	items.insert {
		{"bob-power-armor-mk5", 1},
	}

	armor = {
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{ReactorName},
		{RoboportName},
		{RoboportName},
		{RoboportName},
		{RoboportName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
		{BatteryName},
		{BatteryName},
		{NightvisionName},		
		{BatteryName},
		{BatteryName},
		{BatteryName},
		{BatteryName},
		{ExoskeletonName},
		{ExoskeletonName},
		{ExoskeletonName},
		{ExoskeletonName},
		{ExoskeletonName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
		{LaserDefenseName},
	}
else
	--Vanilla, 10x10 grid
	items.insert {
		{"power-armor-mk2", 1}
	}
	armor = {
		{ReactorName},
		{ReactorName},
		{RoboportName},
		{RoboportName},
		{ReactorName},
		{ReactorName},
		{RoboportName},
		{RoboportName},
		{BatteryName},
		{BatteryName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
		{ShieldName},
	}
end

	
	--Give the player armor and accessories
	local player = game.players[event.player_index]
	for i, v in pairs(items) do
		player.insert{name = v[1], count = v[2]}
	end

	local grid = player.get_inventory(defines.inventory.character_armor)[1].grid
	for  i, v in pairs(armor) do
		grid.put({name = v[1]})
	end

	--if then
	--v.technologies["worker-robot-speed-1"].researched=true
	--end

end)
