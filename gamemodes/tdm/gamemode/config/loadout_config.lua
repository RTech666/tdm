------------------------------------------
--			PLAYER CLASSES  			--
------------------------------------------
--
--	Note for server owners:
--	To create a class follow the basic class examples below.
--
--	Be careful of lua table formatting, and use the correct use of commas.
--
--	If you want classes to have more than one player model, see the below example for table formatting:
--
--
--		playerModels = {
--
--			"models/player/bill.mdl",
--			"models/player/ted.mdl",
--			"models/player/johnny.mdl"
--
--		},
--
--
--	Notice how the last entry does not have a comma at the end, and if there is only a single entry there is no comma.
--
--	Good luck!

PlayerClasses = {

	{
		name = "assault",
		displayName = "Assault",
		playerModels = {

			"models/player/barney.mdl"

		},
		defaultPrimary = "weapon_ttt_ak47",
		defaultSecondary = "weapon_ttt_sipistol",
		defaultTertiary = "weapon_ttt_smokegrenade",
		walkSpeed = 200,
		runSpeed = 285
	},

	{
		name = "commando",
		displayName = "Commando",
		playerModels = {

			"models/player/alyx.mdl"

		},
		defaultPrimary = "weapon_ttt_ak47",
		defaultSecondary = "weapon_ttt_sipistol",
		defaultTertiary = "weapon_ttt_smokegrenade",
		walkSpeed = 200,
		runSpeed = 290
	},

	{
		name = "heavy",
		displayName = "Heavy",
		playerModels = {

			"models/player/police.mdl"

		},
		defaultPrimary = "weapon_ttt_ak47",
		defaultSecondary = "weapon_ttt_sipistol",
		defaultTertiary = "weapon_ttt_smokegrenade",
		walkSpeed = 190,
		runSpeed = 280
	},

	{
		name = "infantry",
		displayName = "Infantry",
		playerModels = {

			"models/player/leet.mdl"

		},
		defaultPrimary = "weapon_ttt_ak47",
		defaultSecondary = "weapon_ttt_sipistol",
		defaultTertiary = "weapon_ttt_smokegrenade",
		walkSpeed = 210,
		runSpeed = 290
	},

	{
		name = "sniper",
		displayName = "Sniper",
		playerModels = {

			"models/player/odessa.mdl"

		},
		defaultPrimary = "weapon_ttt_ak47",
		defaultSecondary = "weapon_ttt_sipistol",
		defaultTertiary = "weapon_ttt_smokegrenade",
		walkSpeed = 195,
		runSpeed = 280
	}

};

--If you want to disable ranks. Default is true.
PlayerRanksEnabled = true

PlayerRanks = {
	
	{
		level = 1,
		rankMaterialSm = "vgui/tdm/ranks/1_small.png",
		rank = "Private First Class"
	},

	{
		level = 2,
		rankMaterialSm = "vgui/tdm/ranks/1_small.png",
		rank = "Private First Class II"
	},

	{
		level = 3,
		rankMaterialSm = "vgui/tdm/ranks/1_small.png",
		rank = "Private First Class III"
	},

	{
		level = 4,
		rankMaterialSm = "vgui/tdm/ranks/4_small.png",
		rank = "Lance Corporal"
	},

	{
		level = 5,
		rankMaterialSm = "vgui/tdm/ranks/4_small.png",
		rank = "Lance Corporal II"
	},

	{
		level = 6,
		rankMaterialSm = "vgui/tdm/ranks/4_small.png",
		rank = "Lance Corporal III"
	},

	{
		level = 7,
		rankMaterialSm = "vgui/tdm/ranks/7_small.png",
		rank = "Corporal"
	},

	{
		level = 8,
		rankMaterialSm = "vgui/tdm/ranks/7_small.png",
		rank = "Corporal II"
	},

	{
		level = 9,
		rankMaterialSm = "vgui/tdm/ranks/7_small.png",
		rank = "Corporal III"
	},

	{
		level = 10,
		rankMaterialSm = "vgui/tdm/ranks/10_small.png",
		rank = "Sergeant"
	},

	{
		level = 11,
		rankMaterialSm = "vgui/tdm/ranks/10_small.png",
		rank = "Sergeant II"
	},

	{
		level = 12,
		rankMaterialSm = "vgui/tdm/ranks/10_small.png",
		rank = "Sergeant III"
	},

	{
		level = 13,
		rankMaterialSm = "vgui/tdm/ranks/13_small.png",
		rank = "Staff Sergeant"
	},

	{
		level = 14,
		rankMaterialSm = "vgui/tdm/ranks/13_small.png",
		rank = "Staff Sergeant II"
	},

	{
		level = 15,
		rankMaterialSm = "vgui/tdm/ranks/13_small.png",
		rank = "Staff Sergeant III"
	},

	{
		level = 16,
		rankMaterialSm = "vgui/tdm/ranks/16_small.png",
		rank = "Gunnery Sergeant"
	},

	{
		level = 17,
		rankMaterialSm = "vgui/tdm/ranks/16_small.png",
		rank = "Gunnery Sergeant II"
	},

	{
		level = 18,
		rankMaterialSm = "vgui/tdm/ranks/16_small.png",
		rank = "Gunnery Sergeant III"
	},

	{
		level = 19,
		rankMaterialSm = "vgui/tdm/ranks/19_small.png",
		rank = "Master Sergeant"
	},

	{
		level = 20,
		rankMaterialSm = "vgui/tdm/ranks/19_small.png",
		rank = "Master Sergeant II"
	},

	{
		level = 21,
		rankMaterialSm = "vgui/tdm/ranks/19_small.png",
		rank = "Master Sergeant III"
	},

	{
		level = 22,
		rankMaterialSm = "vgui/tdm/ranks/22_small.png",
		rank = "Master Gunnery Sergeant"
	},

	{
		level = 23,
		rankMaterialSm = "vgui/tdm/ranks/22_small.png",
		rank = "Master Gunnery Sergeant II"
	},

	{
		level = 24,
		rankMaterialSm = "vgui/tdm/ranks/22_small.png",
		rank = "Master Gunnery Sergeant III"
	},

	{
		level = 25,
		rankMaterialSm = "vgui/tdm/ranks/25_small.png",
		rank = "Second Lieutenant"
	},

	{
		level = 26,
		rankMaterialSm = "vgui/tdm/ranks/25_small.png",
		rank = "Second Lieutenant II"
	},

	{
		level = 27,
		rankMaterialSm = "vgui/tdm/ranks/25_small.png",
		rank = "Second Lieutenant III"
	},

	{
		level = 28,
		rankMaterialSm = "vgui/tdm/ranks/28_small.png",
		rank = "Lieutenant"
	},

	{
		level = 29,
		rankMaterialSm = "vgui/tdm/ranks/28_small.png",
		rank = "Lieutenant II"
	},

	{
		level = 30,
		rankMaterialSm = "vgui/tdm/ranks/28_small.png",
		rank = "Lieutenant III"
	},

	{
		level = 31,
		rankMaterialSm = "vgui/tdm/ranks/31_small.png",
		rank = "Captain"
	},

	{
		level = 32,
		rankMaterialSm = "vgui/tdm/ranks/31_small.png",
		rank = "Captain II"
	},

	{
		level = 33,
		rankMaterialSm = "vgui/tdm/ranks/31_small.png",
		rank = "Captain III"
	},

	{
		level = 34,
		rankMaterialSm = "vgui/tdm/ranks/34_small.png",
		rank = "Major"
	},

	{
		level = 35,
		rankMaterialSm = "vgui/tdm/ranks/34_small.png",
		rank = "Major II"
	},

	{
		level = 36,
		rankMaterialSm = "vgui/tdm/ranks/34_small.png",
		rank = "Major III"
	},

	{
		level = 37,
		rankMaterialSm = "vgui/tdm/ranks/37_small.png",
		rank = "Lieutenant Colonel"
	},

	{
		level = 38,
		rankMaterialSm = "vgui/tdm/ranks/37_small.png",
		rank = "Lieutenant Colonel II"
	},

	{
		level = 39,
		rankMaterialSm = "vgui/tdm/ranks/37_small.png",
		rank = "Lieutenant Colonel III"
	},

	{
		level = 40,
		rankMaterialSm = "vgui/tdm/ranks/40_small.png",
		rank = "Colonel"
	},

	{
		level = 41,
		rankMaterialSm = "vgui/tdm/ranks/40_small.png",
		rank = "Colonel I"
	},

	{
		level = 42,
		rankMaterialSm = "vgui/tdm/ranks/40_small.png",
		rank = "Colonel II"
	},

	{
		level = 43,
		rankMaterialSm = "vgui/tdm/ranks/43_small.png",
		rank = "Brigadier General"
	},

	{
		level = 44,
		rankMaterialSm = "vgui/tdm/ranks/43_small.png",
		rank = "Brigadier General I"
	},

	{
		level = 45,
		rankMaterialSm = "vgui/tdm/ranks/43_small.png",
		rank = "Brigadier General II"
	},

	{
		level = 46,
		rankMaterialSm = "vgui/tdm/ranks/46_small.png",
		rank = "Major General"
	},

	{
		level = 47,
		rankMaterialSm = "vgui/tdm/ranks/46_small.png",
		rank = "Major General I"
	},

	{
		level = 48,
		rankMaterialSm = "vgui/tdm/ranks/46_small.png",
		rank = "Major General II"
	},

	{
		level = 49,
		rankMaterialSm = "vgui/tdm/ranks/49_small.png",
		rank = "Lieutenant General"
	},

	{
		level = 50,
		rankMaterialSm = "vgui/tdm/ranks/49_small.png",
		rank = "Lieutenant General I"
	},

	{
		level = 51,
		rankMaterialSm = "vgui/tdm/ranks/49_small.png",
		rank = "Lieutenant General II"
	},

	{
		level = 52,
		rankMaterialSm = "vgui/tdm/ranks/52_small.png",
		rank = "General"
	},

	{
		level = 53,
		rankMaterialSm = "vgui/tdm/ranks/52_small.png",
		rank = "General I"
	},

	{
		level = 54,
		rankMaterialSm = "vgui/tdm/ranks/52_small.png",
		rank = "General II"
	},

	{
		level = 55,
		rankMaterialSm = "vgui/tdm/ranks/55_small.png",
		rank = "Commander"
	}

};

ClassLoadouts = {

------------------------------------------
--		ASSAULT CLASS LOADOUT  			--
------------------------------------------
	["assault"] = {

		PrimaryWeapons_tbl = {
			{
				name = "Type 25",
				weapon_tag = "arccw_bo2_type95",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 0
			},

			{
				name = "MTAR",
				weapon_tag = "arccw_bo2_mtar",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{	
				name = "SWAT-556",
				weapon_tag = "arccw_bo2_sig556",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 7
			},

			{	
				name = "FAL OSW",
				weapon_tag = "arccw_bo2_osw",
				starting_ammo = 140,
				starting_ammo_type = "ar2",
				required_level = 22
			},

			{	
				name = "M27",
				weapon_tag = "arccw_bo2_m27",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 31
			},

			{	
				name = "SCAR-H",
				weapon_tag = "arccw_bo2_scarh",
				starting_ammo = 140,
				starting_ammo_type = "ar2",
				required_level = 40
			},

			{	
				name = "SMR",
				weapon_tag = "arccw_bo2_smr",
				starting_ammo = 140,
				starting_ammo_type = "ar2",
				required_level = 31
			},

			{	
				name = "M8A1",
				weapon_tag = "arccw_bo2_xm8",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 31
			},

			{	
				name = "AN-94",
				weapon_tag = "arccw_bo2_an94",
				starting_ammo = 140,
				starting_ammo_type = "smg1",
				required_level = 31
			}
		};

		SecondaryWeapons_tbl = {
			{
				name = "Tac-45",
				weapon_tag = "arccw_bo2_fnp45",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 0
			},

			{
				name = "Five-SeveN",
				weapon_tag = "arccw_bo2_fiveseven",
				starting_ammo = 60,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "B23R",
				weapon_tag = "arccw_bo2_b23r",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 19
			},

			{
				name = "Executioner",
				weapon_tag = "arccw_bo2_judge",
				starting_ammo = 60,
				starting_ammo_type = "buckshot",
				required_level = 31
			},

			{
				name = "KAP-40",
				weapon_tag = "arccw_bo2_kard",
				starting_ammo = 24,
				starting_ammo_type = "pistol",
				required_level = 43
			}
		};

		TertiaryWeapons_tbl = {
			{
				name = "Discombobulator",
				weapon_tag = "weapon_ttt_confgrenade",
				required_level = 0
			},

			{
				name = "Smoke Grenade",
				weapon_tag = "weapon_ttt_smokegrenade",
				required_level = 2
			},

			{
				name = "Frag Grenade",
				weapon_tag = "weapon_ttt_frag",
				required_level = 5
			},

			{
				name = "Incendiary Grenade",
				weapon_tag = "weapon_zm_molotov",
				required_level = 8
			},

			{
				name = "Flashbang Grenade",
				weapon_tag = "weapon_ttt_flashbang",
				required_level = 55
			}

		};

	};



------------------------------------------
--		INFANTRY CLASS LOADOUT  		--
------------------------------------------

	["infantry"] = {

		PrimaryWeapons_tbl = {
			{
				name = "PDW-57",
				weapon_tag = "arccw_bo2_pdw57",
				starting_ammo = 150,
				starting_ammo_type = "smg1",
				required_level = 0
			},

			{
				name = "MP7",
				weapon_tag = "arccw_bo2_mp7",
				starting_ammo = 150,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "Vector K10",
				weapon_tag = "arccw_bo2_vector",
				starting_ammo = 150,
				starting_ammo_type = "pistol",
				required_level = 9
			},

			{
				name = "MSMC",
				weapon_tag = "arccw_bo2_msmc",
				starting_ammo = 150,
				starting_ammo_type = "smg1",
				required_level = 55
			},

			{
				name = "Chicom CQB",
				weapon_tag = "arccw_bo2_chicom",
				starting_ammo = 150,
				starting_ammo_type = "pistol",
				required_level = 55
			},

			{
				name = "Skorpion EVO",
				weapon_tag = "arccw_bo2_scorpion",
				starting_ammo = 150,
				starting_ammo_type = "pistol",
				required_level = 55
			}
		};

		SecondaryWeapons_tbl = {
			{
				name = "Tac-45",
				weapon_tag = "arccw_bo2_fnp45",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 0
			},

			{
				name = "Five-SeveN",
				weapon_tag = "arccw_bo2_fiveseven",
				starting_ammo = 60,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "B23R",
				weapon_tag = "arccw_bo2_b23r",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 19
			},

			{
				name = "Executioner",
				weapon_tag = "arccw_bo2_judge",
				starting_ammo = 60,
				starting_ammo_type = "buckshot",
				required_level = 31
			},

			{
				name = "KAP-40",
				weapon_tag = "arccw_bo2_kard",
				starting_ammo = 24,
				starting_ammo_type = "pistol",
				required_level = 43
			}
		};

		TertiaryWeapons_tbl = {
			{
				name = "Discombobulator",
				weapon_tag = "weapon_ttt_confgrenade",
				required_level = 0
			},

			{
				name = "Smoke Grenade",
				weapon_tag = "weapon_ttt_smokegrenade",
				required_level = 2
			},

			{
				name = "Frag Grenade",
				weapon_tag = "weapon_ttt_frag",
				required_level = 5
			},

			{
				name = "Incendiary Grenade",
				weapon_tag = "weapon_zm_molotov",
				required_level = 8
			},

			{
				name = "Flashbang Grenade",
				weapon_tag = "weapon_ttt_flashbang",
				required_level = 55
			}
		};

	};

------------------------------------------
--		HEAVY CLASS LOADOUT  			--
------------------------------------------

	["heavy"] = {

		PrimaryWeapons_tbl = {
			{
				name = "R870 MCS",
				weapon_tag = "arccw_bo2_r870",
				starting_ammo = 32,
				starting_ammo_type = "buckshot",
				required_level = 0
			},

			{
				name = "S12",
				weapon_tag = "arccw_bo2_s12",
				starting_ammo = 18,
				starting_ammo_type = "buckshot",
				required_level = 4
			},

			{
				name = "KSG",
				weapon_tag = "arccw_bo2_ksg",
				starting_ammo = 18,
				starting_ammo_type = "buckshot",
				required_level = 34
			},

			{
				name = "M1216",
				weapon_tag = "arccw_bo2_m1216",
				starting_ammo = 450,
				starting_ammo_type = "buckshot",
				required_level = 52
			}
		};

		SecondaryWeapons_tbl = {
			{
				name = "Tac-45",
				weapon_tag = "arccw_bo2_fnp45",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 0
			},

			{
				name = "Five-SeveN",
				weapon_tag = "arccw_bo2_fiveseven",
				starting_ammo = 60,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "B23R",
				weapon_tag = "arccw_bo2_b23r",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 19
			},

			{
				name = "Executioner",
				weapon_tag = "arccw_bo2_judge",
				starting_ammo = 60,
				starting_ammo_type = "buckshot",
				required_level = 31
			},

			{
				name = "KAP-40",
				weapon_tag = "arccw_bo2_kard",
				starting_ammo = 24,
				starting_ammo_type = "pistol",
				required_level = 43
			}
		};

		TertiaryWeapons_tbl = {
			{
				name = "Discombobulator",
				weapon_tag = "weapon_ttt_confgrenade",
				required_level = 0
			},

			{
				name = "Smoke Grenade",
				weapon_tag = "weapon_ttt_smokegrenade",
				required_level = 2
			},

			{
				name = "Frag Grenade",
				weapon_tag = "weapon_ttt_frag",
				required_level = 5
			},

			{
				name = "Incendiary Grenade",
				weapon_tag = "weapon_zm_molotov",
				required_level = 8
			},

			{
				name = "Flashbang Grenade",
				weapon_tag = "weapon_ttt_flashbang",
				required_level = 55
			}
		};

	};


------------------------------------------
--		COMMANDO CLASS LOADOUT  		--
------------------------------------------

	["commando"] = {

		PrimaryWeapons_tbl = {
			{
				name = "Mk 48",
				weapon_tag = "arccw_bo2_mk48",
				starting_ammo = 130,
				starting_ammo_type = "sr2",
				required_level = 0
			},

			{
				name = "QBB LSW",
				weapon_tag = "arccw_bo2_qbb",
				starting_ammo = 130,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "LSAT",
				weapon_tag = "arccw_bo2_lsat",
				starting_ammo = 130,
				starting_ammo_type = "smg1",
				required_level = 13
			},

			{
				name = "HAMR",
				weapon_tag = "arccw_bo2_hamr",
				starting_ammo = 130,
				starting_ammo_type = "ar2",
				required_level = 37
			}
		};

		SecondaryWeapons_tbl = {
			{
				name = "Tac-45",
				weapon_tag = "arccw_bo2_fnp45",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 0
			},

			{
				name = "Five-SeveN",
				weapon_tag = "arccw_bo2_fiveseven",
				starting_ammo = 60,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "B23R",
				weapon_tag = "arccw_bo2_b23r",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 19
			},

			{
				name = "Executioner",
				weapon_tag = "arccw_bo2_judge",
				starting_ammo = 60,
				starting_ammo_type = "buckshot",
				required_level = 31
			},

			{
				name = "KAP-40",
				weapon_tag = "arccw_bo2_kard",
				starting_ammo = 24,
				starting_ammo_type = "pistol",
				required_level = 43
			}
		};

		TertiaryWeapons_tbl = {
			{
				name = "Discombobulator",
				weapon_tag = "weapon_ttt_confgrenade",
				required_level = 0
			},

			{
				name = "Smoke Grenade",
				weapon_tag = "weapon_ttt_smokegrenade",
				required_level = 2
			},

			{
				name = "Frag Grenade",
				weapon_tag = "weapon_ttt_frag",
				required_level = 5
			},

			{
				name = "Incendiary Grenade",
				weapon_tag = "weapon_zm_molotov",
				required_level = 8
			},

			{
				name = "Flashbang Grenade",
				weapon_tag = "weapon_ttt_flashbang",
				required_level = 55
			}
		};

	};


------------------------------------------
--		SNIPER CLASS CONFIG   			--
------------------------------------------

	["sniper"] = {

		PrimaryWeapons_tbl = {
			{
				name = "SVU-AS",
				weapon_tag = "arccw_bo2_svu",
				starting_ammo = 130,
				starting_ammo_type = "arccw_ammo_sniper",
				required_level = 0
			},

			{
				name = "DSR 50",
				weapon_tag = "arccw_bo2_dsr50",
				starting_ammo = 130,
				starting_ammo_type = "arccw_ammo_sniper",
				required_level = 4
			},

			{
				name = "Ballista",
				weapon_tag = "arccw_bo2_ballista",
				starting_ammo = 130,
				starting_ammo_type = "arccw_ammo_sniper",
				required_level = 43
			},

			{
				name = "XPR-50",
				weapon_tag = "arccw_bo2_xpr50",
				starting_ammo = 130,
				starting_ammo_type = "arccw_ammo_sniper",
				required_level = 52
			}
		};
		
		SecondaryWeapons_tbl = {
			{
				name = "Tac-45",
				weapon_tag = "arccw_bo2_fnp45",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 0
			},

			{
				name = "Five-SeveN",
				weapon_tag = "arccw_bo2_fiveseven",
				starting_ammo = 60,
				starting_ammo_type = "smg1",
				required_level = 4
			},

			{
				name = "B23R",
				weapon_tag = "arccw_bo2_b23r",
				starting_ammo = 60,
				starting_ammo_type = "pistol",
				required_level = 19
			},

			{
				name = "Executioner",
				weapon_tag = "arccw_bo2_judge",
				starting_ammo = 60,
				starting_ammo_type = "buckshot",
				required_level = 31
			},

			{
				name = "KAP-40",
				weapon_tag = "arccw_bo2_kard",
				starting_ammo = 24,
				starting_ammo_type = "pistol",
				required_level = 43
			}
		};

		TertiaryWeapons_tbl = {
			{
				name = "Discombobulator",
				weapon_tag = "weapon_ttt_confgrenade",
				required_level = 0
			},

			{
				name = "Smoke Grenade",
				weapon_tag = "weapon_ttt_smokegrenade",
				required_level = 2
			},

			{
				name = "Frag Grenade",
				weapon_tag = "weapon_ttt_frag",
				required_level = 5
			},

			{
				name = "Incendiary Grenade",
				weapon_tag = "weapon_zm_molotov",
				required_level = 8
			},

			{
				name = "Flashbang Grenade",
				weapon_tag = "weapon_ttt_flashbang",
				required_level = 55
			}
		};

	};

};