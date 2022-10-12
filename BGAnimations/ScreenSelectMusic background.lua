if ThemePrefs.Get("VisualStyle") ~= "Touhou" then return Def.Actor{ InitCommand=function(self) self:visible(false) end } end

return Def.ActorFrame{
	Def.Quad{
		InitCommand=function(self) self:FullScreen():Center():diffuse( Color.White ) end
	},

	LoadActor( THEME:GetPathB("", "_shared background") ),

	Def.Quad{
		InitCommand=function(self)
			self:diffuse(Color.Black):Center():FullScreen()
				:sleep(0.2):linear(0.5):diffusealpha(0)
				:queuecommand("Hide")
		end,
		HideCommand=function(self) self:visible(false) end
	}
}
