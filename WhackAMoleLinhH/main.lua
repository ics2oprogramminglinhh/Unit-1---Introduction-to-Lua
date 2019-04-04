---------------------------------------------------------------------------------
-- Title: Whack a Mole
-- Name: Linh Ho
-- Course: ICS2O
-- This program places a random object on the sceen. 
-- If the user clicks on it in time, the score increases by 1.
---------------------------------------------------------------------------------

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Creating Background 
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)

-- Set colour of the background
bkg:setFillColor(229/255, 204/255, 255/255)

-- Setting Position
bkg.anchorX = 0
bkg.anchorY = 0
bkg.x = 0
bkg.y = 0

--------------------------------------------------------------------------------
-- Sounds
--------------------------------------------------------------------------------
-- play background music
local backgroundMusic = audio.loadSound("Sounds/background.mp3")
local backgroundMusicChannel
backgroundMusicChannel = audio.play(backgroundMusic)

-- sound variables
local whack = audio.loadSound("Sounds/whack.mp3")
local whackChannel

--------------------------------------------------------------------------------
-- Object Creations and Local Variables
--------------------------------------------------------------------------------
-- Create the scoreObject and display on the screen
local score = 0
local scoreObject

scoreObject = display.newText("", 180, 50, Arial, 80)
scoreObject:setTextColor(1, 1, 1)
scoreObject.text = "Score" .. " = " .. score

-- Create the bear
local orange = display.newImage("Images/orange.png", 0, 0)
	-- Setting Postition 
	orange.x = display.contentCenterX
	orange.y = display.contentCenterY

	-- Scale the size down 
	orange:scale(.25, .25)

	-- making the orange invisible
	orange.alpha = 1

-------------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------------

-- This function that makes the orange appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp()

	-- Choosing Random Position on the screen between 0 and the size of the screen
	orange.x = math.random(0, display.contentWidth)
	orange.y = math.random(0, display.contentHeight)
	orange.isVisible = true
	timer.performWithDelay(900, Hide)
end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

-- This function makes the orange invisible and then calls the PopUpDelay function
function Hide()
	-- Changing Visibility
	orange.isVisible = false
	PopUpDelay()
end

-- This function starts the game 
function GameStart()
	PopUpDelay()
end

-- This function increments the score only if the orange is clicked. It then displays the 
-- new score.
function Whacked(event)

	-- If touch phase just started
	if (event.phase == "began") then
		score = score + 1
		 scoreObject.text = "Score" .. " = " .. score
		whackChannel = audio.play(whack)
	end
end

--------------------------------------------------------------------------------------------
-- Event Listeners
--------------------------------------------------------------------------------------------
-- I add the event listener to the oranges so that if the orange is touched, the Whacked function
-- is called
orange:addEventListener("touch", Whacked)

---------------------------------------------------------------------------------------------
-- Start the game
---------------------------------------------------------------------------------------------
GameStart()