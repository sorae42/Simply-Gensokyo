local af = Def.ActorFrame{}

af[#af+1] = Def.Sprite{
    Name="Reimu",
    Texture="reimu 14x2 (doubleres).png",
    Frames=Sprite.LinearFrames(28, 2.5),
    InitCommand=function(self)
        self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y + 80)
    end
}

return af