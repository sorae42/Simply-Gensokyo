-- --------------------------------------------------------
-- static background image

local file = ...

-- We want the Shared BG to be used on the following screens.
local SharedBackground = {
	["ScreenInit"] = true,
	["ScreenLogo"] = true,
	["ScreenTitleMenu"] = true,
	["ScreenTitleJoin"] = true,
	["ScreenSelectProfile"] = true,
	["ScreenSelectColor"] = true,
	["ScreenSelectStyle"] = true,
	["ScreenSelectPlayMode"] = true,
	["ScreenSelectPlayMode2"] = true,
	["ScreenProfileLoad"] = true, -- hidden screen

	-- Operator Menu screens and sub screens.
	["ScreenOptionsService"] = true,
	["ScreenSystemOptions"] = true,
	["ScreenMapControllers"] = true,
	["ScreenTestInput"] = true,
	["ScreenInputOptions"] = true,
	["ScreenGraphicsSoundOptions"] = true,
	["ScreenVisualOptions"] = true,
	["ScreenAppearanceOptions"] = true,
	["ScreenSetBGFit"] = true,
	["ScreenOverscanConfig"] = true,
	["ScreenArcadeOptions"] = true,
	["ScreenAdvancedOptions"] = true,
	["ScreenMenuTimerOptions"] = true,
	["ScreenUSBProfileOptions"] = true,
	["ScreenOptionsManageProfiles"] = true,
	["ScreenThemeOptions"] = true,
}

math.randomseed(Second())
local randomBg = math.random(1, 3)

local af = Def.ActorFrame {
	OnCommand=function(self)
		self:diffusealpha(0):accelerate(0.3):diffusealpha(1)
	end,
	ScreenChangedMessageCommand=function(self)
		local screen = SCREENMAN:GetTopScreen()
		local style = ThemePrefs.Get("VisualStyle")
	end,
	Def.Sprite {
		Name="Static",
		Texture=THEME:GetPathG("", string.format("Backgrounds/%s.mp4", randomBg)),
		InitCommand=function(self)
			self:xy(_screen.cx, _screen.cy):zoomto(_screen.w, _screen.h):diffusealpha(0.75)
		end,
	},
}

return af
