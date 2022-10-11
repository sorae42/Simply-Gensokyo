-- draws a "nice" underneath if a 69 appears somewhere on ScreenEvaluation
-- with love, ian klatzco and din

local player = ...
local af = Def.ActorFrame{}

local stats = STATSMAN:GetCurStageStats():GetPlayerStageStats(player)
local failed = stats:GetFailed()
local PercentDP = stats:GetPercentDancePoints()
local percent = FormatPercentScore(PercentDP):gsub("%%", "")

-- for iterating
local TapNoteScores = { 'W1', 'W2', 'W3', 'W4', 'W5', 'Miss' }
local RadarCategories = { 'Holds', 'Mines', 'Hands', 'Rolls' }

-- if the table contains a 69 in a substring, "nice"
-- a little bit of code re-use from LetterGrade.lua
local IsNice = function()

	if ThemePrefs.Get("nice") <= 0 then return false end

	if string.match(percent, "69") ~= nil then return true end

	-- check timing ratings (W1..W5, miss)
	local scores_table = {}
	for index, window in ipairs(TapNoteScores) do
		local number = stats:GetTapNoteScores( "TapNoteScore_"..window )
		scores_table[window] = number
	end

	for label,item in pairs(scores_table) do
		if string.match(tostring(item), "69") ~= nil then return true end
	end

	-- check holds mines hands rolls, and their "total possible"
	for index, RCType in ipairs(RadarCategories) do
		local performance = stats:GetRadarActual():GetValue( "RadarCategory_"..RCType )
		local possible = stats:GetRadarPossible():GetValue( "RadarCategory_"..RCType )

		if string.match(tostring(performance), "69") ~= nil then return true end
		if string.match(tostring(possible), "69") ~= nil then return true end
	end

	-- check difficulty
	local meter
	if GAMESTATE:IsCourseMode() then -- course mode
		local trail = GAMESTATE:GetCurrentTrail(player)
		if trail then
			meter = trail:GetMeter()
			if string.match(tostring(meter), "69") ~= nil then return true end
		end
	else
		local steps = GAMESTATE:GetCurrentSteps(player) -- regular mode
		if steps then
			meter = steps:GetMeter()
			if string.match(tostring(meter), "69") ~= nil then return true end
		end
	end

	-- song title
	local songtitle = (GAMESTATE:IsCourseMode()
						and GAMESTATE:GetCurrentCourse():GetDisplayFullTitle())
						or GAMESTATE:GetCurrentSong():GetDisplayFullTitle()

	if songtitle then
		if string.match(tostring(songtitle), "69") ~= nil then return true end
	end

	return false
end

if IsNice() then
	af[#af+1] = LoadActor(THEME:GetPathG("","nya.png"))..{
		InitCommand=function(self)
			self:xy(70, _screen.cy-134)
		end,
		OnCommand=function(self)

			self:y(_screen.cy-94)
			self:zoom(0.4)

			if player == PLAYER_1 then
				self:x( self:GetX() * -1 )
			end

			-- if the value is 2, then this indicates they want sound.
			if ThemePrefs.Get("nice") == 2 then
				-- SOUND:PlayOnce() doesn't take the global SoundVolume Preference into consideration
				-- it just plays the file you pass it at 100%; this can be jarring
				-- use SOUND:DimMusic() as a way to set the volume to match SoundVolume preference
				-- for 1.3 seconds, the duration of nya.ogg
				SOUND:DimMusic(PREFSMAN:GetPreference("SoundVolume"),  1.3)
				SOUND:PlayOnce(THEME:GetPathS("", "nya.ogg"))
			end
		end
	}
end

return af