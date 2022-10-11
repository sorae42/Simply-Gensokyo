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

local randomBg = 1

local shared_alpha = 0.6
local static_alpha = 1

local af = Def.ActorFrame {
	OnCommand=function(self)
		self:accelerate(0.8):diffusealpha(1)
	end,
	local bg = Def.Sprite {
		Name="Static",
		Texture=THEME:GetPathG("", nil),
		InitCommand=function(self)
			self:xy(_screen.cx, _screen.cy):zoomto(_screen.w, _screen.h):diffusealpha(shared_alpha)
		end,
	},
	ScreenChangedMessageCommand=function(self)
		local screen = SCREENMAN:GetTopScreen()
		local style = ThemePrefs.Get("VisualStyle")
		bg.Load(string.format("Backgrounds/%s.mp4", randomBg))
	end,
	VisualStyleSelectedMessageCommand=function(self)
		local style = ThemePrefs.Get("VisualStyle")
		if style == "Touhou" then
			self:visible(true)
		else
			self:visible(false)
		end
	end,
}

return af
