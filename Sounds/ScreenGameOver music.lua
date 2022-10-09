local audio_file = "serenity in ruin.ogg"

local style = ThemePrefs.Get("VisualStyle")
if style == "Touhou" then
    audio_file = "sakuramochi.ogg"
end

return THEME:GetPathS("", audio_file)
