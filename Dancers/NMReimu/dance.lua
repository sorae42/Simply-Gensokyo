local af = Def.ActorFrame{}

af[#af+1] = Def.Sprite{
    Name="NMReimu",
    Texture="NMReimu 14x2 (doubleres).png",
    Frames=Sprite.LinearFrames(28, 2.5),
    InitCommand=function(self)
        self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y + 90)
    end
}

return af