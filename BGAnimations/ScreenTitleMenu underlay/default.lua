-- - - - - - - - - - - - - - - - - - - - -
-- first, reset the global SL table to default values
-- this is defined in:  ./Scripts/SL_Init.lua
InitializeSimplyLove()

-- -----------------------------------------------------------------------
-- preliminary Lua setup is done
-- now define actors to be passed back to the SM engine

local af = Def.ActorFrame{}
af.InitCommand=function(self) self:Center() end

-- -----------------------------------------------------------------------
-- af2 contains things that should fade out during the OffCommand
local af2 = Def.ActorFrame{}
af2.OffCommand=function(self) self:smooth(0.65):diffusealpha(0) end
af2.Name="SLInfo"

af2[#af2+1] = Def.Sprite{
    Name="Simply Text",
    InitCommand=function(self)
		self:playcommand("LoadImage")
	end,
	OffCommand=function(self) self:linear(0.5):shadowlength(0) end,
	VisualStyleSelectedMessageCommand=function(self)
		self:playcommand("LoadImage")
	end,
	LoadImageCommand=function(self)
        self:Load(THEME:GetPathG("", "_VisualStyles/Touhou/"..SL.Touhou.GetLogo()))
		self:zoom(0.55):vertalign(top)
		self:y(-165):shadowlength(0)
	end
}

-- 3 lines of text:
--    theme_name   theme_version
--    stepmania_version
--    num_songs in num_groups, num_courses
af2[#af2+1] = LoadActor("./UserContentText.lua")

-- ensure that af2 is added as a child of af
af[#af+1] = af2

-- -----------------------------------------------------------------------

return af
