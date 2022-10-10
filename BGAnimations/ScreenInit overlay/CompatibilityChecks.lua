-- ScreenInit is the first screen to load, as defined in Metrics.ini under [Common]
--
-- we want to ensure that the current game (dance, pump, techno, kb7, etc.)
-- is actually supported by Simply Love and won't cause Lua errors that could result
-- in players getting stuck within the theme.
--
-- If the player is in the operator menu and tries to switch to, say, kickbox
-- the engine will change the game, the theme will reload, this screen will load,
-- we'll detect that kickbox isn't supported, and bounce them right back to choosing a different game.
--
-- The same thing basically happens if StepMania starts up in an unsupported game
-- or if the player switches into Simply Love from another theme in an unsupported game.

return Def.Actor{
	OnCommand=function()

		-- defined in ./Scripts/SL-Helpers.lua
		if not StepManiaVersionIsSupported() then
			SM( THEME:GetString("ScreenInit", "UnsupportedSMVersion"):format(ProductFamily(), ProductVersion()) )
			-- ScreenSystemOptions is the first choice in the operator menu
			-- players can set their game, theme, default NoteSkin, etc. from it
			SCREENMAN:SetNewScreen("ScreenSystemOptions")
		end

		-- also defined in ./Scripts/SL-Helpers.lua
		if not CurrentGameIsSupported() then
			-- Display a SystemMessage alerting the player that their current game is not playable in SL.
			-- We can display a SystemMessage here and it will persist into ScreenSelectGame, because SystemMessages
			-- are part of the always-present ScreenSystemLayer overlay.
			SM( THEME:GetString("ScreenInit", "UnsupportedGame"):format(GAMESTATE:GetCurrentGame():GetName()) )
			-- don't politely transition from ScreenInit to ScreenSystemOptions with fades; just get the player there now
			SCREENMAN:SetNewScreen("ScreenSystemOptions")
		end
	end
}
