--[[

Menu for changing/switching teams mid game.

]]--

surface.CreateFont( "2stupidButton",
{
    font    = "Marlett", 
    size    = 13,
    weight  = 600,
    antialias = true,
    blursize = 0.2,
	symbol = true,
    shadow = false
})

surface.CreateFont( "2stupidButton2",
{
    font    = "Marlett", 
    size    = 11,
    weight  = 600,
    antialias = true,
    blursize = 0.2,
	symbol = false,
    shadow = false
})

surface.CreateFont( "Close",
{
    font    = "CloseCaption_Bold", 
    size    = 13,
    weight  = 700,
    antialias = true,
    blursize = 0.2,
    shadow = false
})

surface.CreateFont( "Button",
{
    font    = "Triomphe", 
    size    = 16,
    weight  = 700,
    antialias = true,
    blursize = 0.3,
    shadow = false
})

surface.CreateFont( "WelcomeMSG",
{
    font    = "Triomphe",
    size    = 62,
    weight  = 400,
    antialias = true,
    blursize = 0.2,
    shadow = false
})

surface.CreateFont( "WelcomeMSGShadow",
{
    font    = "Triomphe",
    size    = 62,
    weight  = 400,
    antialias = true,
    blursize = 2,
    shadow = false
})

surface.CreateFont( "TeamMSG",
{
    font    = "Triomphe",
    size    = 32,
    weight  = 400,
    antialias = true,
    blursize = 0.2,
    shadow = false
})

surface.CreateFont( "TeamMSGShadow",
{
    font    = "Triomphe",
    size    = 32,
    weight  = 400,
    antialias = true,
    blursize = 1.5,
    shadow = false
})

surface.CreateFont( "egmFont1",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(11),
    weight  = 600,
    antialias = true,
    blursize = 0.5,
    shadow = false
})

surface.CreateFont( "egmFont1s",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(11),
    weight  = 600,
    antialias = true,
    blursize = 1.75,
    shadow = false
})

surface.CreateFont( "egmFont2",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(20),
    weight  = 600,
    antialias = true,
    blursize = 0.5,
    shadow = false
})

surface.CreateFont( "egmFont2s",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(20),
    weight  = 600,
    antialias = true,
    blursize = 1.75,
    shadow = false
})

surface.CreateFont( "egmFontName",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(40),
    weight  = 600,
    antialias = true,
    blursize = 0.75,
    shadow = false
})

surface.CreateFont( "egmFontNames",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(40),
    weight  = 600,
    antialias = true,
    blursize = 2,
    shadow = false
})

surface.CreateFont( "egmFontLevel",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(20),
    weight  = 600,
    antialias = true,
    blursize = 0.5,
    shadow = false
})

surface.CreateFont( "egmFontLevels",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(20),
    weight  = 600,
    antialias = true,
    blursize = 2,
    shadow = false
})

surface.CreateFont( "egmFontRank",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(30),
    weight  = 600,
    antialias = true,
    blursize = 0.5,
    shadow = false
})

surface.CreateFont( "egmFontRanks",
{
    font    = "CM Sans Serif 2012",
    size    = ScreenScale(30),
    weight  = 600,
    antialias = true,
    blursize = 2,
    shadow = false
})

function chooseTeam( ply )
	local specPlayers = GetGlobalInt( "TDM_SpecTeamNum" )
	local redPlayers = GetGlobalInt( "TDM_RedTeamNum" )
	local bluePlayers = GetGlobalInt( "TDM_BlueTeamNum" )

	// Force update of information so its current.
	timer.Create( "NumberMenuCheckTimer", 1, 0, function() 
		specPlayers = GetGlobalInt("TDM_SpecTeamNum")
		redPlayers = GetGlobalInt("TDM_RedTeamNum" )
		bluePlayers = GetGlobalInt("TDM_BlueTeamNum")
	end)

	// Create the menu for choosing teams.
	local chooseTeamFrame = vgui.Create("VoidUI.Frame")
	chooseTeamFrame:SSetSize(965, 500)
	chooseTeamFrame:Center()
	chooseTeamFrame:SetTitle("Changing teams?")
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
		RunConsoleCommand("stTeamSpec")
		chooseTeamFrame:Close()
		timer.Stop("NumberCheckTimer")
	end
end

concommand.Add("chooseTeam", chooseTeam)

function redWins( ply )
	local RedWinsFrame = vgui.Create( "DFrame" )
	RedWinsFrame:SetSize(ScrW(), ScrH()*0.3)
	RedWinsFrame:SetTitle("")
	RedWinsFrame:SetPos( 0, ScrH()/4)
	RedWinsFrame:SetVisible( true )
	RedWinsFrame:SetDraggable( false )
	RedWinsFrame:ShowCloseButton( false )
	RedWinsFrame:MakePopup()
	function RedWinsFrame:Paint( w, h, ply )
		draw.RoundedBox( 0, 0, 0 + h/(1.5), w, h*(1/3), Color(250,250,250,25))
		draw.RoundedBox( 0, 0, 0, w, h/(1.5), Color(180,30,30,225))
		draw.DrawText( "Red Team Wins!", "WelcomeMSGShadow", 0 + w/2 + 1, 0 + (h/1.5)/3 + 1, Color(0, 0, 0, 225), TEXT_ALIGN_CENTER )  
		draw.DrawText( "Red Team Wins!", "WelcomeMSG", 0 + w/2, 0 + (h/1.5)/3 , Color(255, 255, 255, 235), TEXT_ALIGN_CENTER ) 
	end

	local tabHover = false
	local RedButton = vgui.Create('DButton')
	RedButton:SetParent(RedWinsFrame)
	RedButton:SetSize(ScrW()/10, ScrH()/20)
	RedButton:SetPos(ScrW()/2 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6)
	RedButton:SetText("Close")
	RedButton:SetTextColor( Color(255,255,255,255) )
	RedButton:SetFont("Button")
	RedButton:SetDrawBackground(true)
	function RedButton:OnCursorEntered()
		tabHover = true
	end

	function RedButton:OnCursorExited()
		tabHover = false
	end

	function RedButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(180,40,40,250))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(40,40,40,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(180,30,30,250))
		end
	end

	function RedButton:DoClick()
		RedWinsFrame:Close()
	end
end
concommand.Add("redWins", redWins)

function blueWins( ply )
	local BlueWinsFrame = vgui.Create( "DFrame" )
	BlueWinsFrame:SetSize(ScrW(), ScrH()*0.3)
	BlueWinsFrame:SetTitle("")
	BlueWinsFrame:SetPos( 0, ScrH()/4)
	BlueWinsFrame:SetVisible( true )
	BlueWinsFrame:SetDraggable( false )
	BlueWinsFrame:ShowCloseButton( false )
	BlueWinsFrame:MakePopup()
	function BlueWinsFrame:Paint( w, h, ply )
		draw.RoundedBox( 0, 0, 0 + h/(1.5), w, h*(1/3), Color(250,250,250,25))
		draw.RoundedBox( 0, 0, 0, w, h/(1.5), Color(30,30,180,225))
		draw.DrawText( "Blue Team Wins!", "WelcomeMSGShadow", 0 + w/2 + 1, 0 + (h/1.5)/3 + 1, Color(0, 0, 0, 225), TEXT_ALIGN_CENTER )  
		draw.DrawText( "Blue Team Wins!", "WelcomeMSG", 0 + w/2, 0 + (h/1.5)/3, Color(255, 255, 255, 235), TEXT_ALIGN_CENTER ) 
	end

	local tabHover = false
	local BlueButton = vgui.Create('DButton')
	BlueButton:SetParent(BlueWinsFrame)
	BlueButton:SetSize(ScrW()/10, ScrH()/20)
	BlueButton:SetPos(ScrW()/2 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6)
	BlueButton:SetText("Close")
	BlueButton:SetTextColor( Color(255,255,255,255) )
	BlueButton:SetFont("Button")
	BlueButton:SetDrawBackground(true)
	function BlueButton:OnCursorEntered()
		tabHover = true
	end
	function BlueButton:OnCursorExited()
		tabHover = false
	end
	function BlueButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(40,40,180,250))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(40,40,40,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(30,30,180,250))
		end
	end
	function BlueButton:DoClick()
		BlueWinsFrame:Close()
	end

end
concommand.Add("blueWins", blueWins)

function nobodyWins( ply )
	local NobodyWinsFrame = vgui.Create( "DFrame" )
	NobodyWinsFrame:SetSize(ScrW(), ScrH()*0.3)
	NobodyWinsFrame:SetTitle("")
	NobodyWinsFrame:SetPos( 0, ScrH()/4)
	NobodyWinsFrame:SetVisible( true )
	NobodyWinsFrame:SetDraggable( false )
	NobodyWinsFrame:ShowCloseButton( false )
	NobodyWinsFrame:MakePopup()
	function NobodyWinsFrame:Paint( w, h, ply )
		draw.RoundedBox( 0, 0, 0 + h/(1.5), w, h*(1/3), Color(250,250,250,25))
		draw.RoundedBox( 0, 0, 0, w, h/(1.5), Color(80,80,80,225))
		draw.DrawText( "This was a Draw!", "WelcomeMSGShadow", 0 + w/2 + 1, 0 + (h/1.5)/3 + 1, Color(0, 0, 0, 225), TEXT_ALIGN_CENTER )  
		draw.DrawText( "This was a Draw!", "WelcomeMSG", 0 + w/2, 0 + (h/1.5)/3, Color(255, 255, 255, 235), TEXT_ALIGN_CENTER ) 
	end

	local tabHover = false
	local GrayButton = vgui.Create('DButton')
	GrayButton:SetParent(NobodyWinsFrame)
	GrayButton:SetSize(ScrW()/10, ScrH()/20)
	GrayButton:SetPos(ScrW()/2 - (ScrW()/10)/2, 0 + (ScrH()/4)/1.5 + ScrH()/20 + (ScrH()/20)/6)
	GrayButton:SetText("Close")
	GrayButton:SetTextColor( Color(255,255,255,255) )
	GrayButton:SetFont("Button")
	GrayButton:SetDrawBackground(true)
	function GrayButton:OnCursorEntered()
		tabHover = true
	end
	function GrayButton:OnCursorExited()
		tabHover = false
	end
	function GrayButton:Paint(w, h)
		if tabHover then
			draw.RoundedBox( 2, 0, 0, w, h, Color(220,220,220,255))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(60,60,60,250))
		else
			draw.RoundedBox( 2, 0, 0, w, h, Color(40,40,40,0))
			draw.RoundedBox( 2, 1, 1, w-2, h-2, Color(40,40,40,250))
		end
	end
	function GrayButton:DoClick()
		NobodyWinsFrame:Close()
	end
end
concommand.Add("nobodyWins", nobodyWins)

net.Receive( "EndGame", function( len, ply )
	received_tbl = net.ReadTable()
	PrintTable( received_tbl )
	gWinner = received_tbl.winner
	gTeam = received_tbl.team
	gKills = received_tbl.kills
	gAssists = received_tbl.assists
	gDeaths = received_tbl.deaths
	gHeadshots = received_tbl.headshots
	gKillsTotal = received_tbl.killsTotal
	gAssistsTotal = received_tbl.assistsTotal
	gDeathsTotal = received_tbl.deathsTotal
	gWins = received_tbl.wins
	gLosses = received_tbl.losses
	gGamesTotal = received_tbl.gamesTotal
	gLevel = received_tbl.level
	gSavedXP = received_tbl.savedXP
	gReqXP = received_tbl.reqXP
	gEarnedXP = received_tbl.earnedXP
	endgameMenu( ply )
	--timer.Simple( 5, function() endgameMenu( ply ) end )
end )

function endgameMenu( ply )
	gWinner = gWinner or 1
	gTeam = gTeam or 1
	gKills = gKills or 15
	gAssists = gAssists or 2
	gDeaths = gDeaths or 4
	gHeadshots = gHeadshots or 0
	gKillsTotal = gKillsTotal or 50
	gAssistsTotal = gAssistsTotal or 5
	gDeathsTotal = gDeathsTotal or 15
	gGamesTotal = gGamesTotal or 4
	gSavedXP = gSavedXP or 800
	gReqXP = gReqXP or 2000
	gLevel = gLevel or 12
	gEarnedXP = gEarnedXP or 250

	if gWinner == 1 then 
		lineText = "Red Team Wins"
	elseif gWinner == 2 then
		lineText = "Blue Team Wins"
	elseif gWinner == 3 then
		lineText = "Everybody loses"
	end

	if gWinner == 1 and gTeam == 1 then
		endText = "VICTORY"
	elseif gWinner == 2 and gTeam == 2 then
		endText = "VICTORY"
	elseif gWinner == 3 then
		endText = "DRAW"
	else
		endText = "DEFEAT"
	end

	findRank = nil
	findRankLevel = nil

	for k, v in pairs( PlayerRanks ) do
		if ( !findRank || ( tonumber(v.level) >= tonumber(findRankLevel)) && (tonumber(v.level) <= tonumber(gLevel)) ) then
			findRankLevel = v.level
			findRank = v.rank
		end
	end

	local prec = gSavedXP / gReqXP
	prec = math.Clamp( prec, 0, 1 )

	local prec2 = gEarnedXP / gSavedXP 
	prec2 = math.Clamp( prec2, 0, 1 )

	local timeLeft = GAMEMODE:GetRoundTime()
	timer.Create( "RoundTimerTimeChecker", 1, 0, function() 
		timeLeft = GAMEMODE:GetRoundTime()
	end)

	gKillsAvg = math.Round((gKillsTotal / gGamesTotal)) or 0
	gDeathsAvg = math.Round((gDeathsTotal / gGamesTotal)) or 0
	gAssistsAvg = math.Round((gAssistsTotal / gGamesTotal)) or 0

	if gKills == 1 then
		killsText = "Kill"
	else
		killsText = "Kills"
	end

	if gDeaths == 1 then
		deathsText = "Death"
	else
		deathsText = "Deaths"
	end

	if gAssists == 1 then
		assistsText = "Assist"
	else
		assistsText = "Assists"
	end

	if gTeam == TEAM_RED then
	    myColor = Color(188,0,0,255)
	    myColor2 = Color(188,188,0,100)
	elseif gTeam == TEAM_BLUE then
	    myColor = Color(0,75,188,255)
	    myColor2 = Color(188,188,0,100)
	else
	    myColor = Color(188,188,188,255)
	    myColor2 = Color(188,0,0,100)
	end

	local EndGameBGPanel = vgui.Create( "DPanel" )
	EndGameBGPanel:SetPos( 0, 0 )
	EndGameBGPanel:SetSize( ScrW(), ScrH() )
	EndGameBGPanel:SetDisabled( false )
	EndGameBGPanel:Hide()
	function EndGameBGPanel:Paint( w, h )
		if gTeam == TEAM_RED then
			surface.SetMaterial( Material( "vgui/tdm/tdm-mockup-red.png" ) );
		    surface.SetDrawColor( 255, 255, 255, 255 );
		    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() );
		elseif gTeam == TEAM_BLUE then
			surface.SetMaterial( Material( "vgui/tdm/tdm-mockup-blue.png" ) );
		    surface.SetDrawColor( 255, 255, 255, 255 );
		    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() );
		else
			surface.SetMaterial( Material( "vgui/tdm/tdm-mockup.png" ) );
		    surface.SetDrawColor( 255, 255, 255, 255 );
		    surface.DrawTexturedRect( 0, 0, ScrW(), ScrH() );
		end

		draw.DrawText( GetHostName(), "egmFont1s", w/6 - 50 + 2, ScreenScale(34) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_LEFT ) 
		draw.DrawText( GetHostName(), "egmFont1", w/6 - 50, ScreenScale(34), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT )
		draw.DrawText( "NEXT GAME STARTS IN: ", "egmFont1s", w - w/6 + 5 + 2, ScreenScale(34) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( "NEXT GAME STARTS IN: ", "egmFont1", w - w/6 + 5, ScreenScale(34), Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT )
		draw.DrawText( timeLeft, "egmFont2s", w - w/6 + 50 + 2, ScreenScale(27) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( timeLeft, "egmFont2", w - w/6 + 50, ScreenScale(27), myColor, TEXT_ALIGN_RIGHT )
	end

	local EndGameAnnounce = vgui.Create( "DPanel" )
	EndGameAnnounce:SetPos( 0, 0 )
	EndGameAnnounce:SetSize( ScrW(), ScrH() )
	EndGameAnnounce:SetDisabled( false )
	function EndGameAnnounce:Paint( w, h )
		draw.DrawText( endText, "egmFontNames", w/2 + 2, h/2 - ScreenScale(40) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_CENTER ) 
		draw.DrawText( endText, "egmFontName", w/2, h/2 - ScreenScale(40), myColor, TEXT_ALIGN_CENTER ) 
		draw.DrawText( lineText, "egmFont2s", w/2 + 2, h/2 + 2, Color(0, 0, 0, 222), TEXT_ALIGN_CENTER ) 
		draw.DrawText( lineText, "egmFont2", w/2, h/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER ) 
	end	

	local EndGameScoreboard = vgui.Create( "DPanel" )
	EndGameScoreboard:SetPos( 0, 0 )
	EndGameScoreboard:SetSize( ScrW(), ScrH() )
	EndGameScoreboard:SetDisabled( false )
	EndGameScoreboard:Hide()
	function EndGameScoreboard:Paint( w, h )
		--draw.DrawText( "Scoreboard", "egmFontRank", w - w/6 + 50, h/2 - ScreenScale(30), Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT ) 
	end	

	local EndGamePanel = vgui.Create( "DPanel" )
	EndGamePanel:SetPos( 0, 0 )
	EndGamePanel:SetSize( ScrW(), ScrH() )
	EndGamePanel:SetDisabled( false )
	EndGamePanel:Hide()
	function EndGamePanel:Paint( w, h )
		--draw.DrawText( "Testing", "egmFont1", w/2, h/2, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER ) 
		draw.RoundedBox( 1, w/6, h - h/5 - h/6, w - w/6 - w/6, ScreenScale(10), Color(0,0,0,120))
		draw.RoundedBox( 1, w/6, h - h/5 - h/6, (w - w/6 - w/6 )*prec, ScreenScale(10), myColor)
		draw.RoundedBox( 1, (w/6) + ((w - w/6 - w/6 )*prec) - (((w - w/6 - w/6 )*prec)*prec2), h - h/5 - h/6, (((w - w/6 - w/6 )*prec))*prec2, ScreenScale(10), myColor2)
		draw.DrawText( "+"..gEarnedXP.."xp", "egmFont1s", w/6 + 2, h - h/5 - h/6 - ScreenScale(10)-5 + 2, Color(0, 0, 0, 222), TEXT_ALIGN_LEFT ) 
		draw.DrawText( gSavedXP.."/"..gReqXP, "egmFont1s", w - w/6 + 2, h - h/5 - h/6 - ScreenScale(10)-5 + 2, Color(0, 0, 0, 222), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( "+"..gEarnedXP.."xp", "egmFont1", w/6, h - h/5 - h/6 - ScreenScale(10)-5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT ) 
		draw.DrawText( gSavedXP.."/"..gReqXP, "egmFont1", w - w/6, h - h/5 - h/6 - ScreenScale(10)-5, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( gKills.." "..killsText, "egmFont2s", w/6 + 2, h - h/5 + 2, Color(0, 0, 0, 240), TEXT_ALIGN_LEFT ) 
		draw.DrawText( gAssists.." "..assistsText, "egmFont2s", w/2 + 2, h - h/5 + 2, Color(0, 0, 0, 240), TEXT_ALIGN_CENTER ) 
		draw.DrawText( gDeaths.." "..deathsText, "egmFont2s", w - w/6 + 2, h - h/5 + 2, Color(0, 0, 0, 240), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( gKills.." "..killsText, "egmFont2", w/6, h - h/5, Color(255, 255, 255, 255), TEXT_ALIGN_LEFT ) 
		draw.DrawText( gAssists.." "..assistsText, "egmFont2", w/2, h - h/5, Color(255, 255, 255, 255), TEXT_ALIGN_CENTER ) 
		draw.DrawText( gDeaths.." "..deathsText, "egmFont2", w - w/6, h - h/5, Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( "OVERALL AVG: "..gKillsAvg, "egmFont1s", w/6 + 2, h - h/5 + ScreenScale(20) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_LEFT ) 
		draw.DrawText( "OVERALL AVG: "..gAssistsAvg, "egmFont1s", w/2 + 2, h - h/5 + ScreenScale(20) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_CENTER ) 
		draw.DrawText( "OVERALL AVG: "..gDeathsAvg, "egmFont1s", w - w/6 + 2, h - h/5 + ScreenScale(20) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( "OVERALL AVG: "..gKillsAvg, "egmFont1", w/6, h - h/5 + ScreenScale(20), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT ) 
		draw.DrawText( "OVERALL AVG: "..gAssistsAvg, "egmFont1", w/2, h - h/5 + ScreenScale(20), Color(255, 255, 255, 255), TEXT_ALIGN_CENTER ) 
		draw.DrawText( "OVERALL AVG: "..gDeathsAvg, "egmFont1", w - w/6, h - h/5 + ScreenScale(20), Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( string.upper(LocalPlayer():Nick()), "egmFontNames", w/6 - 50 + 2, h/2 - ScreenScale(40) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_LEFT ) 
		draw.DrawText( string.upper(LocalPlayer():Nick()), "egmFontName", w/6 - 50, h/2 - ScreenScale(40), myColor, TEXT_ALIGN_LEFT ) 
		draw.DrawText( findRank, "egmFontRanks", w - w/6 + 50 + 2, h/2 - ScreenScale(30) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_RIGHT )
		draw.DrawText( findRank, "egmFontRank", w - w/6 + 50, h/2 - ScreenScale(30), Color(255, 255, 255, 255), TEXT_ALIGN_RIGHT ) 
		draw.DrawText( "LEVEL "..gLevel, "egmFontLevels", w/6 - 50 + 2, h/2 - ScreenScale(10) + 2, Color(0, 0, 0, 222), TEXT_ALIGN_LEFT ) 
		draw.DrawText( "LEVEL "..gLevel, "egmFontLevel", w/6 - 50, h/2 - ScreenScale(10), Color(255, 255, 255, 255), TEXT_ALIGN_LEFT ) 
	end
	timer.Simple( 3, function() EndGameAnnounce:Hide() EndGameScoreboard:Show() GAMEMODE:ScoreboardShow() end )
	timer.Simple( 10, function() GAMEMODE:ScoreboardHide() EndGameScoreboard:Hide() EndGameBGPanel:Show() EndGamePanel:Show() end )
	timer.Simple( 20, function() EndGameBGPanel:Hide() EndGamePanel:Hide() end )
end

concommand.Add("endgameMenu", endgameMenu)