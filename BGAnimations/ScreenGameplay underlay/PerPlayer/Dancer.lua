-- option doesn't exist in Casual mode so don't bother
if SL.Global.GameMode == "Casual" then return end

local player = ...
local pn = ToEnumShortString(player)
local dancer = SL[pn].ActiveModifiers.Dancer
local MusicRate = SL.Global.ActiveModifiers.MusicRate
local SongPosition = GAMESTATE:GetPlayerState(GAMESTATE:GetMasterPlayerNumber()):GetSongPosition()

if dancer=="None" then return end

local actor = Def.Sprite{
	Texture="/"..THEME:GetCurrentThemeDirectory().."Dancers/"..dancer,
    InitCommand=function(self)
        self:x(SCREEN_CENTER_X):y(SCREEN_CENTER_Y + 90)
        self:SetSecondsIntoAnimation(round(SongPosition:GetCurBPS() * MusicRate))
    end
}

return actor