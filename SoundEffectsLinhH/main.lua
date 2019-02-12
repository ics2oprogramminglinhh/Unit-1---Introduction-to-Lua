
-- Title: Sound Effects
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays an image and has a sound effect.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 4

-- local variables

local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

local blueGirl = display.newImageRect("Images/girl2.png", 150, 150)
local yellowGirl = display.newImageRect("Images/girl3.png", 150, 150)

local blueGirlWidth = blueGirl.width
local blueGirlHeight = blueGirl.height
local yellowGirlWidth = yellowGirl.width
local yellowGirlHeight = yellowGirl.height

local soundEffect = audio.loadSound("sound/effect.mp3")
local soundEffectChannel 

-- play background music
soundEffectChannel = audio.play(soundEffect)


-- my boolean variables to keep track of which object I touched first
local alreadyTouchedBlueGirl = false
local alreadyTouchedYellowGirl = false

-- set the initial position of the blue girl
blueGirl.x = 700
blueGirl.y = 250

yellowGirl.x = 300
yellowGirl.y = 250

-- Function: BlueGirlListener
-- Input: touch listener
-- Output: none
-- Description: when blue girl is touched, move her
local function BlueGirlListener(touch)

	if (touch.phase == "began") then
		if (alreadyTouchedYellowGirl == false) then
			alreadyTouchedBlueGirl = true	
		end
	end

	if  ( (touch.phase == "moved") and (alreadyTouchedBlueGirl == true) ) then
		blueGirl.x = touch.x 
		blueGirl.y = touch.y
	end

	if (touch.phase == "ended") then
		alreadyTouchedBlueGirl = false	
		alreadyTouchedYellowGirl = false	
	end
end