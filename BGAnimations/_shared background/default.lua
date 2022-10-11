-- the best way to spread holiday cheer is singing loud for all to hear
if HolidayCheer() then
	return LoadActor( THEME:GetPathB("", "_shared background/Snow.lua") )
end

local style = ThemePrefs.Get("VisualStyle")

-- use the "VisualStyle" ThemePrefs value to generate a proper filepath to the appropriate
-- SharedBackground texture and pass it to Normal.lua now as this file
-- is being initialized.

-- if the player chooses a different VisualStyle during runtime, MESSAGEMAN will broadcast
-- "VisualStyleSelected" which we can use in Normal.lua to Load() the
-- newly-appropriate texture from disk into each Sprite; see also: ./BGAnimations/ScreenOptionsService overlay.lua
local file = THEME:GetPathG("", "_VisualStyles/" .. style .. "/SharedBackground.png")

local af = Def.ActorFrame{}

-- a simple Quad to serve as the backdrop
af[#af+1] = Def.Quad{
	InitCommand=function(self) self:FullScreen():Center():diffuse(Color.Black) end,
	VisualStyleSelectedMessageCommand=function(self)
		THEME:ReloadMetrics() -- is this needed here?  -quietly
		SL.Global.ActiveColorIndex = ThemePrefs.Get("SimplyLoveColor")
		self:linear(1):diffuse(Color.Black)
	end
}

af[#af+1] = LoadActor("./Normal.lua", file)
af[#af+1] = LoadActor("./Static.lua", file)

return af
