----------------------------------------------------------------------------------------
-- Title: MovingImages
-- Name: Linh Ho
-- Course: ICS2O
-- This program moves a beetleship across the screen and then makes it fade out,
-- as well as another object moves in a different direction and speed.
----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- global variables
scrollSpeed = 3
goSpeed = 5

-- background image with width and height
local backgroundImage = display.newImageRect("Images/background.png", 2048, 1536)

-- character image with width and height
local beetleship = display.newImageRect("Images/beetleship.png", 200, 200)

-- set the image to be transparent
beetleship.alpha = 0

-- set the initial x and y position of beetleship
beetleship.x = 300
beetleship.y = 500

-- Function: MoveShip
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveShip(event)
    -- add the scroll speed to the x-value of the ship
    beetleship.x = beetleship.x + scrollSpeed
    -- change the transparency of the ship every time it moves so that it fades in
    beetleship.alpha = beetleship.alpha + 0.01
end

-- MoveShip will be called at program start over and over 
Runtime:addEventListener("enterFrame", MoveShip)

-- second character image with width and height
local octopus = display.newImageRect("Images/octopus.png", 200, 200)

-- set the second image to be transparent
octopus.alpha = 100

-- set the direction of the octopus
octopus:scale(-1, 1)

-- set the initial x and y position of octopus
octopus.x = display.contentWidth/2
octopus.y = 450

-- Function: MoveSecond
-- Input: this function accepts an event listener
-- Output: none
-- Description: This function adds the scroll speed to the x-value of the ship
local function MoveSecond(event)
    -- add the scroll speed to the x-value of the ship
    octopus.x = octopus.x + goSpeed
    -- change the transparency of the ship every time it moves so that it fades out
    octopus.alpha = octopus.alpha + 0.003 - 0.01
    -- add the scroll speed to the y-value of the ship
    octopus.y = octopus.y + goSpeed
end

-- MoveShip will be called over and over again
Runtime:addEventListener("enterFrame", MoveSecond)
