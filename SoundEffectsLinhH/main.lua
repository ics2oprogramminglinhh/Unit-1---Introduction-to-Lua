
-----------------------------------------------------------------------------------------
-- Title: Buttons in Lua
-- Name: Linh Ho
-- Course: ICS2O
-- This program does something when I click on the button.
-----------------------------------------------------------------------------------------

-- Hide Status Bar
display.setStatusBar(display.HiddenStatusBar)

-- Set Background Colour
display.setDefault ("background", 255/255, 173/255, 47/255)

-- Sounds
local correctSound = audio.loadSound("Sounds/Correct.mp3")
local correctSoundChannel

-- Create blue button, set its position and make it visible
local blueButton = display.newImageRect("Images/Fast Button Inactive@2x.png", 198, 96)
blueButton.x = display.contentWidth/2
blueButton.y = display.contentWidth/4
blueButton.inVisible = true

-- Create red button, set its position and make it invisible 
local redButton = display.newImageRect("Images/Fast Button Active@2x.png", 198, 96)
redButton.x = display.contentWidth/2
redButton.y = display.contentWidth/4
redButton.isVisible = false

-- Create checkmark button, set its position and make it invisible 
local checkmark = display.newImageRect("Images/checkmark.png", 200, 200)
checkmark.x = display.contentWidth/2
checkmark.y = display.contentWidth/2
checkmark.isVisible = false

-- Create text object, set its position and make it invisble 
local textObject = display.newText ("Clicked!", 0, 0, nil, 50)
textObject.x = display.contentWidth/2
textObject.y = display.contentWidth/3
textObject:setTextColor (1, 0, 0.4)
textObject.isVisible = false

-- Function: BlueButtonListener
-- Input: touch listener
-- Output: none
-- Description: When blue button is clicked, it will make the text appear with the red button, 
-- and make the blue button disappear
local function BlueButtonListener(touch)
	if (touch.phase == "began") then
		blueButton.isVisible = false
		redButton.isVisible = true
		checkmark.isVisible = true
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then 
		blueButton.isVisible = true
		redButton.isVisible = false
		checkmark.isVisible = false
		textObject.isVisible = true
		correctSoundChannel = audio.play(correctSound)
	end
end

-- Function: RedButtonListener
-- Input: touch listener
-- Output: none
-- Description: When Red button is clicked, it will make the text appear with the blue button, 
-- and make the red button disappear
local function RedButtonListener(touch)
	if (touch.phase == "began") then
		redButton.isVisible = false
		blueButton.isVisible = true
		checkmark.isVisible = true
		textObject.isVisible = false
	end

	if (touch.phase == "ended") then 
		redButton.isVisible = true
		blueButton.isVisible = false
		checkmark.isVisible = false
		textObject.isVisible = true
		correctSoundChannel = audio.play(correctSound)
	end
end

-- add the respctive listeners to each object
blueButton:addEventListener("touch", BlueButtonListener)
redButton:addEventListener("touch", RedButtonListener)

