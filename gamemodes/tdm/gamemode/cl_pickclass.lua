// This file contains all the code for the class and loadout menu.

// Class menu.
function pickClass(ply)
	// Create the frame for the choose class menu.
	local chooseClass = vgui.Create("VoidUI.Frame")
	chooseClass:SSetSize(300, 200)
	chooseClass:Center()
	chooseClass:SetTitle("Choose a Class")
	chooseClass:MakePopup()

	// Create the class sheet for the class menu.
	local chooseClassSheet = vgui.Create("DPropertySheet", chooseClass)
	chooseClassSheet:SetPos(0, 25)
	chooseClassSheet:SetSize(520, ScrH()*0.5)
	chooseClassSheet.Paint = function()
	end

	// Create the class buttons.
	cc = -1
	for _, classes in pairs(PlayerClasses) do
		if classes.team == nil or (classes.team != nil and classes.team == ply:Team()) then
			print(ply:Team())
			if (classes.team != nil) then
				print(classes.team)
			end

			cc = cc + 1

			local classButton = vgui.Create('VoidUI.Button')
			classButton:SetParent(chooseClassSheet)
			classButton:SetSize(200, 30)
			classButton:SetPos(51, 30 + (cc * 35))
			classButton:SetText(classes.displayName)
			classButton:SetDrawBackground(true)
			classButton.DoClick = function()
				chooseClass:Close(true)
				ClassLabel = classes.displayName
				SClass = classes.name
				pickLoadout(ply, classes.name)
			end
		end
	end
end

// Loadout menu.
function pickLoadout(ply, tbl)
	// Check player level.
	playerLevelCheck = ply:GetNWInt("Level", 1)

	// Create the frame for the loadout menu.
	local chooseLoadout = vgui.Create("VoidUI.Frame")
	chooseLoadout:SSetSize(520, ScrH() * 0.5)
	chooseLoadout:SetTitle("Choose a Loadout")
	chooseLoadout:Center()
	chooseLoadout:MakePopup()
	
	// Create the loadout sheet for the loadout menu.
	local chooseLoadoutSheet = vgui.Create("DPropertySheet", chooseLoadout)
	chooseLoadoutSheet:SetPos(0, 40)
	chooseLoadoutSheet:SetSize(ScrW() * 0.6, ScrH() * 0.6)
	chooseLoadoutSheet.Paint = function()
	end

	// Add the playermodel to the loadout menu.
	local showModel = vgui.Create("DModelPanel", chooseLoadout)
	showModel:SetSize(210, 200)
	showModel:SetPos(280, 40)
	showModel:SetModel(LocalPlayer():GetModel())
	function showModel:LayoutEntity(Entity) return end

	// Check if files exist.
	if file.Exists("tdm/"..tbl..".txt", "DATA") == true then
		local data = file.Read("tdm/"..tbl..".txt", "DATA")
		savedData = string.Explode("\n", data)
	end

	// Create the panel for the primary weapon model.
	local primaryPanel = vgui.Create("DPanel", chooseLoadoutSheet)
	primaryPanel:SetPos(40, 60)
	primaryPanel:SetSize(150, 150)

	// Create primary weapon model.
	local primaryModel = vgui.Create("DModelPanel", primaryPanel)
	primaryModel:SetSize(300, 300)
	primaryModel:SetPos(-80, -190)
	function primaryModel:LayoutEntity(Entity) return end

	// Create the panel for the secondary weapon model.
	local secondaryPanel = vgui.Create("DPanel", chooseLoadoutSheet)
	secondaryPanel:SetPos(40, 265)
	secondaryPanel:SetSize(150, 150)

	// Create secondary weapon model.
	local secondaryModel = vgui.Create("DModelPanel", secondaryPanel)
	secondaryModel:SetSize(300, 300)
	secondaryModel:SetPos(-80, -190)
	function secondaryModel:LayoutEntity(Entity) return end

	// Create the panel for the utility model.
	local utilityPanel = vgui.Create("DPanel", chooseLoadoutSheet)
	utilityPanel:SetPos(325, 265)
	utilityPanel:SetSize(150, 150)

	// Create utility model.
	local utilityModel = vgui.Create("DModelPanel", utilityPanel)
	utilityModel:SetSize(300, 300)
	utilityModel:SetPos(-80, -190)
	function utilityModel:LayoutEntity(Entity) return end

	// Create primary weapon dropdown.
	local primaryDropdown = vgui.Create("VoidUI.Dropdown")
	primaryDropdown:SetParent(chooseLoadoutSheet)
	primaryDropdown:SetPos(20, 20)
	primaryDropdown:SetSize(200, 30)
	primaryDropdown:SetValue("Default (Scout)")
	for k, equip in pairs(ClassLoadouts[tbl]["PrimaryWeapons_tbl"]) do
		if ((tonumber(equip.required_level) <= tonumber(playerLevelCheck))) then
			primaryDropdown:AddChoice(equip.name, equip.weapon_tag)
		end

		if ((tonumber(equip.required_level) > tonumber(playerLevelCheck))) then
			primaryDropdown:AddChoice(equip.name .. " (Lvl " .. equip.required_level .. ")", -1)
		end

		if (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == true) then
			for k, v in pairs(ClassLoadouts[tbl]["PrimaryWeapons_tbl"]) do
				if savedData[2] == v.weapon_tag and tonumber(v.required_level) <= tonumber(ply:GetNWInt("Level", 1)) then
					foundName = v.name
					primaryDropdown:ChooseOption(foundName)
					PWeapon = savedData[2]
					PWeaponAmmo = v.starting_ammo
					PWeaponAmmoType = v.starting_ammo_type
					break
				else 
					primaryDropdown:ChooseOption(equip.name)
					PWeapon = equip.weapon_tag
					PWeaponAmmo = equip.starting_ammo
					PWeaponAmmoType = equip.starting_ammo_type
				end
			end
		elseif (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == false) then
			foundName = equip.name
			primaryDropdown:ChooseOption(foundName)
			PWeapon = equip.weapon_tag
			PWeaponAmmo = equip.starting_ammo
			PWeaponAmmoType = equip.starting_ammo_type
		end

		primaryModel:SetModel(weapons.GetStored(PWeapon)['WorldModel'])
	end

	primaryDropdown.OnSelect = function(panel, index, value, data)
		if (data == -1) then
			primaryDropdown:ChooseOption(foundName)
			for k, equip in pairs(ClassLoadouts[tbl]["PrimaryWeapons_tbl"]) do
				if equip.name == foundName then 
					PWeapon = equip.weapon_tag
					PWeaponAmmo = equip.starting_ammo
					PWeaponAmmoType = equip.starting_ammo_type
				end
			end			
		else
			PWeapon = data
			for k, equip in pairs(ClassLoadouts[tbl]["PrimaryWeapons_tbl"]) do
				if equip.weapon_tag == PWeapon then 
					foundName = equip.name
					PWeaponAmmo = equip.starting_ammo
					PWeaponAmmoType = equip.starting_ammo_type
				end
			end
		end
	end

	// Create secondary weapon dropdown.
	local secondaryDropdown = vgui.Create("VoidUI.Dropdown") -- Secondary weapon dropdown.
	secondaryDropdown:SetParent(chooseLoadoutSheet)
	secondaryDropdown:SetPos(20, 225)
	secondaryDropdown:SetSize(200, 30)
	secondaryDropdown:SetValue("Default (Silenced Pistol)")
	for k, equip in pairs(ClassLoadouts[tbl]["SecondaryWeapons_tbl"]) do
		if ((tonumber(equip.required_level) <= tonumber(playerLevelCheck))) then
			secondaryDropdown:AddChoice( equip.name, equip.weapon_tag)
		end

		if ((tonumber(equip.required_level) > tonumber(playerLevelCheck))) then
			secondaryDropdown:AddChoice(equip.name .. " (Lvl " .. equip.required_level .. ")", -1)
		end

		if (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == true) then
			for k, v in pairs(ClassLoadouts[tbl]["SecondaryWeapons_tbl"]) do
				if savedData[5] == v.weapon_tag and tonumber(v.required_level) <= tonumber(ply:GetNWInt("Level", 1)) then
					foundSName = v.name
					secondaryDropdown:ChooseOption(foundSName)
					SWeapon = savedData[5]
					SWeaponAmmo = v.starting_ammo
					SWeaponAmmoType = v.starting_ammo_type
					break
				else 
					foundSName = equip.name
					secondaryDropdown:ChooseOption(equip.name)
					SWeapon = equip.weapon_tag
					SWeaponAmmo = equip.starting_ammo
					SWeaponAmmoType = equip.starting_ammo_type
				end
			end
		elseif (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == false) then
			secondaryDropdown:ChooseOption(equip.name)
			foundSName = equip.name
			SWeapon = equip.weapon_tag
			SWeaponAmmo = equip.starting_ammo
			SWeaponAmmoType = equip.starting_ammo_type
		end

		secondaryModel:SetModel(weapons.GetStored(SWeapon)['WorldModel'])
	end

	secondaryDropdown.OnSelect = function(panel, index, value, data)
		if (data == -1) then
			secondaryDropdown:ChooseOption(foundSName)
			for k, equip in pairs(ClassLoadouts[tbl]["SecondaryWeapons_tbl"]) do
				if equip.name == foundSName then 
					SWeapon = equip.weapon_tag
					SWeaponAmmo = equip.starting_ammo
					SWeaponAmmoType = equip.starting_ammo_type
				end
			end
		else
			SWeapon = data
			for k, equip in pairs(ClassLoadouts[tbl]["SecondaryWeapons_tbl"]) do
				if equip.weapon_tag == SWeapon then 
					SWeaponAmmo = equip.starting_ammo
					SWeaponAmmoType = equip.starting_ammo_type
				end
			end
		end
	end

	// Create utility dropdown.
	local utilityDropdown = vgui.Create("VoidUI.Dropdown") -- Utility dropdown.
	utilityDropdown:SetParent(chooseLoadoutSheet)
	utilityDropdown:SetPos(300, 225)
	utilityDropdown:SetSize(200, 30)
	utilityDropdown:SetValue("Default (Smoke Grenade)")
	for k, equip in pairs(ClassLoadouts[tbl]["TertiaryWeapons_tbl"]) do
		if ((tonumber(equip.required_level) <= tonumber(playerLevelCheck))) then
			utilityDropdown:AddChoice(equip.name, equip.weapon_tag)
		end

		if ((tonumber(equip.required_level) > tonumber(playerLevelCheck))) then
			utilityDropdown:AddChoice(equip.name .. " (Lvl " .. equip.required_level .. ")", -1)
		end

		if (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == true) then
			for k, v in pairs(ClassLoadouts[tbl]["TertiaryWeapons_tbl"]) do
				if savedData[8] == v.weapon_tag and tonumber(v.required_level) <= tonumber(ply:GetNWInt("Level", 1)) then
					foundGName = v.name
					utilityDropdown:ChooseOption(foundGName)
					GWeapon = savedData[8]
					break
				else
					foundGName = equip.name
					utilityDropdown:ChooseOption(equip.name)
					GWeapon = equip.weapon_tag
				end
			end
		elseif (tonumber(equip.required_level) == 0 and file.Exists("tdm/"..tbl..".txt", "DATA") == false) then
			utilityDropdown:ChooseOption(equip.name)
			foundGName = equip.name
			GWeapon = equip.weapon_tag
		end

		utilityModel:SetModel(weapons.GetStored(GWeapon)['WorldModel'])
	end

	utilityDropdown.OnSelect = function(panel, index, value, data)
		if (data == -1) then
			utilityDropdown:ChooseOption(foundGName)
			for k, equip in pairs(ClassLoadouts[tbl]["TertiaryWeapons_tbl"]) do
				if equip.name == foundGName then 
					GWeapon = equip.weapon_tag
				end
			end
		else
			GWeapon = data
		end
	end

	// Create back button.
	local backButton = vgui.Create('VoidUI.Button')
	backButton:SetParent(chooseLoadoutSheet)
	backButton:SetSize(100, 30)
	backButton:SetPos(5, 460)
	backButton:SetText('Back')
	backButton:SetDrawBackground(true)
	backButton.DoClick = function()
		chooseLoadout:Close(true)
		pickClass(ply)
	end

	// Create spawn button.
	local spawnButton = vgui.Create('VoidUI.Button')
	spawnButton:SetParent(chooseLoadoutSheet)
	spawnButton:SetSize(100, 30)
	spawnButton:SetPos(414, 460)
	spawnButton:SetText('Spawn')
	spawnButton:SetDrawBackground(true)
	spawnButton.DoClick = function()
		local tbl = {}
		tbl.class = SClass
		tbl.primary = PWeapon
		tbl.primary_ammo = PWeaponAmmo
		tbl.primary_ammo_type = PWeaponAmmoType
		tbl.secondary = SWeapon
		tbl.secondary_ammo = SWeaponAmmo
		tbl.secondary_ammo_type = SWeaponAmmoType
		tbl.grenade = GWeapon
		if file.Exists("tdm", "DATA") == true then 
			file.Write("tdm/"..SClass..".txt", tbl.class.."\n"..tbl.primary.."\n"..tbl.primary_ammo.."\n"..tbl.primary_ammo_type.."\n"..tbl.secondary.."\n"..tbl.secondary_ammo.."\n"..tbl.secondary_ammo_type.."\n"..tbl.grenade)
		else
			file.CreateDir("tdm")
			file.Write("tdm/"..SClass..".txt", tbl.class.."\n"..tbl.primary.."\n"..tbl.primary_ammo.."\n"..tbl.primary_ammo_type.."\n"..tbl.secondary.."\n"..tbl.secondary_ammo.."\n"..tbl.secondary_ammo_type.."\n"..tbl.grenade)
		end

		net.Start("PickLoadout")
			net.WriteTable(tbl)
		net.SendToServer()
		chooseLoadout:Close()
	end
end

concommand.Add("pickClass", pickClass)