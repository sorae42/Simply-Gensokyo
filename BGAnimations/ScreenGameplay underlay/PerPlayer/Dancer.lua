-- option doesn't exist in Casual mode so don't bother
if SL.Global.GameMode == "Casual" then return end

local player = ...
local pn = ToEnumShortString(player)
local dancer = SL[pn].ActiveModifiers.Dancer

-- don't run the rest
if dancer == "None" then return end

local MusicRate = SL.Global.ActiveModifiers.MusicRate
local SongPosition = GAMESTATE:GetPlayerState(GAMESTATE:GetMasterPlayerNumber()):GetSongPosition()
local pos = {
	[PLAYER_1] = { x=(SCREEN_CENTER_X - 30),  y=(SCREEN_CENTER_Y + 100) },
	[PLAYER_2] = { x=(SCREEN_CENTER_X + 30),  y=(SCREEN_CENTER_Y + 100) },
}

local actor = Def.Sprite{
	Texture="/"..THEME:GetCurrentThemeDirectory().."Dancers/"..dancer,
    InitCommand=function(self)
        self:xy( pos[player].x, pos[player].y )
    end
}

return actor