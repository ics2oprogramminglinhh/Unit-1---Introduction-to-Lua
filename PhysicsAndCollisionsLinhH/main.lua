-----------------------------------------------------------------------------------------
-- Title: Interacting Objects 2
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays objects bouncing off a beam and the floor 
-- using physics.
-----------------------------------------------------------------------------------------

-- Hide status bar
display.setStatusBar(display.HiddenStatusBar)

-- load physics 
local physics = require("physics")

-- start physics
physics.start()

----------------------------------------------------------------------------------
-- Objects
----------------------------------------------------------------------------------

-- Creating the ground
local ground = display.newImage("Physics/ground.png", 0, 0)

-- Set the x and y of the ground
ground.x = display.contentCenterX
ground.y = display.contentHeight

-- Change the width to be the same as the screen
ground.width = display.contentWidth

-- Add to physics
physics.addBody(ground, "static", {friction=0.5, bounce=0.3})

---------------------------------------------------------------------------------

-- Display the image of the beam
local beam = display.newImage("Physics/beam.png", 0, 0)

-- Set the x and y of beam
beam.x = display.contentCenterX/5
beam.y = display.contentCenterY*1.65

-- Change the size of the beam
beam.width = display.contentWidth/2
beam.height = display.contentHeight/10

-- Rotate the beam 45 degrees so its on an angle
beam:rotate(45)

-- Send it to the back layer
beam:toBack()

-- add to physics
physics.addBody(beam, "static", {friction=0.5, bounce = 0.3})

-------------------------------------------------------------------------------

-- create a wall
local wall  = display.newImage("Physics/beam_long.png", 0, 0)

-- set the x and y 
wall.x = 1000
wall.y = 500

--set the wall size
wall.width = 800
wall.height = 100

--send it to the back layer
wall:toBack()

-- rotate wall to 90 degrees so its straight
wall:rotate(90)

-- add to physics
physics.addBody(wall, "static", {friction=0.5, bounce=0.3})

-------------------------------------------------------------------------------

-- create bkg 
local bkg = display.newImage("Physics/bkg.png", 0, 0)

	-- set the x and y pos
	bkg.x = display.contentCenterX 
	bkg.y = display.contentCenterY

	-- Change width and height to be same size
	bkg.width = display.contentWidth
	bkg.height = display.contentHeight

	-- send to back
	bkg:toBack()

---------------------------------------------------------------
-- FUNCTIONS
----------------------------------------------------------------

-- creating the first ball
local function firstBall()
	-- creating first ball 
	local ball1 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball1, {density=1.0, friction=0.5, bounce=0.3, radius=30})

	-- make it same size
	ball1:scale(1, 1)
end

----------------------------------------------------------------

-- creating the second ball
local function secondBall()
	-- creating second ball
	local ball2 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball2, {density=1.0, friction =0.5, bounce=0.3, radius=12.5})

	-- bigger than the original size
	ball2:scale(2,2)
end

--------------------------------------------------------------

 -- creating the third ball
 local function thirdBall()
 	-- creating third ball
 	local ball3 = display.newImage("Physics/super_ball.png", 0, 0)

 	-- add to physics 
	physics.addBody(ball3, {density=1.0, friction=0.2, bounce=0.5, radius=25})

	-- smaller than orignal size
	ball3:scale(-1, 1)
end

--------------------------------------------------------------

-- creating the fourth ball
local function fourthBall()
	--creating fourth ball
	local ball4 = display.newImage("Physics/super_ball.png", 0, 0)

	-- add to physics
	physics.addBody(ball4, {density=1.0, friction=0.5, bounce=0.3, radius=15.5})

	-- make it smaller than the original size
	ball4:scale(0.5,0.5)
end

--------------------------------------------------------------
-- Timer Delay
--------------------------------------------------------------

timer.performWithDelay(0, firstBall)
timer.performWithDelay(500, secondBall)
timer.performWithDelay(1500, thirdBall)
timer.performWithDelay(1700, fourthBall)

---------------------------------------------------------