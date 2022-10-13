# Customize dancer
Dancer is a feature (currently) exclusive to Simply Gensokyo that will add a character to the gameplay. This is NOT the same feature as Stepmania's background 3D character.

## Preparing your character
You must prepare an animation sheet of such character you want to add and name their file corresponding to the directory name, with the frame width, height and "(doubleres)" if your character can be added with double the resolution.

For example, if your character has a sheet of 14 x 2, you must name them like this: `NMReimu/NMReimu 14x2 (doubleres).png`.

Failed to do so may break the theme entirely.

## Putting your character to the gameplay
You must provide a `dance.lua` in your character folder (you can copy from existing character) and change the script as needed (changing the file name, their position and maybe adding more behavior to your character). 

If `dance.lua` doesn't exist in your character directory or you put the wrong filename in `Texture`, they won't be added to the gameplay, even if you choose them in the player options menu.

## Adding to your game
After the preparation, drag the folder of your character to the `Dancers` folder in the theme directory and they should be in the player options menu!