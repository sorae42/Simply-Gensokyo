local t = ...

for dancer in ivalues( GetDancers() ) do
	if dancer ~= "None" then
		t[#t+1] = LoadActor("/"..THEME:GetCurrentThemeDirectory().."Dancers/"..dancer)..{
			Name="Dancer_"..StripSpriteHints(dancer),
			InitCommand=function(self)
				self:visible(false)
			end
		}
	else
		t[#t+1] = Def.Actor{ Name="Dancer_None", InitCommand=function(self) self:visible(false) end }
	end
end