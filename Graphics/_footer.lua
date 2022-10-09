-- tables of rgba values
local dark  = {0,0,0,0.9}
local light = {0.65,0.65,0.65,1}

return Def.Quad{
	Name="Footer",
	ScreenChangedMessageCommand=function(self)
		local topscreen = SCREENMAN:GetTopScreen():GetName()
		if topscreen == "ScreenSelectMusic" then
			self:zoomto(_screen.w, 32):vertalign(bottom):x(_screen.cx)
			if DarkUI() then
				self:diffuse(dark)
			else
				self:diffuse(light)
			end
		end
		if topscreen == "ScreenSelectMusicCasual" then
			self:diffuse(dark)
		end
	end,
}
