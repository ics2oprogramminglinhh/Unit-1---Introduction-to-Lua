-- Title: Whack a Mole
-- Name: Linh Ho
-- Course: ICS2O
-- This program places a random object on the sceen. 
-- If the user clicks on it in time, the score increases by 1.

-- Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- play background music
local backgroundMusic = audio.loadSound("Sounds/background.mp3")
local backgroundMusicChannel
backgroundMusicChannel = audio.play(backgroundMusic)

-- Creating Background 
local bkg = display.newRect(0, 0, display.contentWidth, display.contentHeight)

	-- Set colour of the background
	bkg:setFillColor(229/255, 204/255, 255/255)

	-- Setting Position
	bkg.anchorX = 0
	bkg.anchorY = 0
	bkg.x = 0
	bkg.y = 0

-- Creating Bear
local bear = display.newImage("Images/bear.png", 0, 0)

	-- Setting Postition 
	bear.x = display.contentCenterX
	bear.y = display.contentCenterY

	-- Scale the size down 
	bear:scale(0.5, 0.5)

	-- making the bear invisible
	bear.alpha = 1

	-- local variables for score
	local scoreObject
	local score = 0

	-- display the score
	scoreObject = display.newText("", 180, 50, Arial, 80)
	scoreObject:setTextColor(1, 1, 1)
	scoreObject.text = "Score" .. " = " .. score

	-- sound variables
	local whack = audio.loadSound("Sounds/whack.mp3")
	local whackChannel

-------------------------------------------------------------------------------
-- Functions
---------------------------------------------------------------------------------

-- This function that makes the bear appear in a random (x,y) position on the screen
-- before calling the Hide function
function PopUp()

	-- Choosing Random Position on the screen between 0 and the size of the screen
	bear.x = math.random(0, display.contentWidth)
	bear.y = math.random(0, display.contentHeight)
	bear.isVisible = true
	timer.performWithDelay(700, Hide)
end

-- This function calls the PopUp function after 3 seconds
function PopUpDelay()
	timer.performWithDelay(3000, PopUp)
end

-- This function makes the bear invisible and then calls the PopUpDelay function
function Hide()
	-- Changing Visibility
	bear.isVisible = false
	PopUpDelay()
end

-- This function starts the game 
function GameStart()
	PopUpDelay()
end

-- This function incrememnts the score only if the bear is clicked. It then displays the 
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
-- I add the event listener to the bears so that if the bear is touched, the Whacked function
-- is called
bear:addEventListener("touch", Whacked)

---------------------------------------------------------------------------------------------
-- Start the game
---------------------------------------------------------------------------------------------
GameStart()