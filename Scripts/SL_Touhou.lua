-- adapted from SRPG 6 lua file
SL.Touhou = {
	Colors = {
		"#666000",
		"#3d6526",	-- green
		"#36855b",
		"#36a392",
		"#51c0c8",	-- teal (DPRT)
		"#009bcf",
		"#006ecb",
		"#5131a4",	-- blue (Footspeed Empire)
		"#9c0082",
		"#bf0052",
		"#c32020",	-- red (Stamina Nation)
		"#954f00",
	},
	TextColor = "#ffffff",

	-- internal flag
	firstRun = false,

	GetLogo = function()
		return "logo (doubleres).png"
	end,
	
	GetAbilityCard = function(idx)
		return "Life Card"
	end,
}
