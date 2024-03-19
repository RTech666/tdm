// This file contains all the code for the welcome menu that shows when a player joins.

function welcomePlayer(ply)
	local playerName = LocalPlayer():Nick()
	local mapName = game.GetMap()
	local specPlayers = GetGlobalInt("TDM_SpecTeamNum")
	local redPlayers = GetGlobalInt("TDM_RedTeamNum")
	local bluePlayers = GetGlobalInt("TDM_BlueTeamNum")

	// Force update of information so its current.
	timer.Create("NumberCheckTimer", 1, 0, function() 
		playerName = LocalPlayer():Nick()
		specPlayers = GetGlobalInt("TDM_SpecTeamNum")
		redPlayers = GetGlobalInt("TDM_RedTeamNum")
		bluePlayers = GetGlobalInt("TDM_BlueTeamNum")
	end)

	// Create the menu for choosing teams.
	local chooseTeamFrame = vgui.Create("VoidUI.Frame")
	chooseTeamFrame:SSetSize(965, 500)
	chooseTeamFrame:Center()
	chooseTeamFrame:SetTitle("Welcome! Select a team.")
	chooseTeamFrame:MakePopup()

	// Create the red team card.
	local teamRed = chooseTeamFrame:Add('VoidUI.Card')
	teamRed:SetParent(chooseTeamFrame)
	teamRed:Dock(LEFT)
	teamRed:SSetWide(300)
	teamRed:DockMargin(20, 20, 5, 20)
	teamRed:SetTitle("Team", "Red")
	teamRed:SetAccent(Color(153, 0, 0))
	teamRed:SetGradient(Color(255, 0, 0), Color(255, 0, 0))
	function teamRed.button:DoClick()
		if ply:Team() == TEAM_RED then
		ply:ChatPrint("You are already on the Red Team.")
		else
			if redPlayers > bluePlayers then
				ply:ChatPrint("There are too many players on the Red Team.")
			else 
				RunConsoleCommand("stTeamT")
				chooseTeamFrame:Close()
				timer.Stop("NumberCheckTimer")
			end
		end
	end

	// Create the blue team card.
	local teamBlue = chooseTeamFrame:Add('VoidUI.Card')
	teamBlue:SetParent(chooseTeamFrame)
	teamBlue:Dock(LEFT)
	teamBlue:SSetWide(300)
	teamBlue:DockMargin(5, 20, 20, 20)
	teamBlue:SetTitle("Team", "Blue")
	teamBlue:SetAccent(Color(0, 0, 255))
	teamBlue:SetGradient(Color(0, 0, 153), Color(0, 0, 153))
	function teamBlue.button:DoClick()
		if ply:Team() == TEAM_BLUE then
			ply:ChatPrint("You are already on Team Blue.")
		else
			if bluePlayers > redPlayers then
				ply:ChatPrint("There are too many players on the Blue Team.")
			else
				RunConsoleCommand("stTeamCT")
				chooseTeamFrame:Close()
				timer.Stop("NumberCheckTimer")
			end
		end
	end

	// Create the spectator card.
	local teamSpec = chooseTeamFrame:Add('VoidUI.Card')
	teamSpec:SetParent(chooseTeamFrame)
	teamSpec:Dock(LEFT)
	teamSpec:SSetWide(300)
	teamSpec:DockMargin(-10, 20, 20, 20)
	teamSpec:SetTitle("Spectators", "The")
	teamSpec:SetAccent(Color(64, 64, 64))
	teamSpec:SetGradient(Color(128, 128, 128), Color(128, 128, 128))
	function teamSpec.button:DoClick()
		chooseTeamFrame:Close()
		timer.Stop("NumberCheckTimer")
	end
end

concommand.Add("welcomePlayer", welcomePlayer)