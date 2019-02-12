
-- Title: AreaofRectangleAndCircle
-- Name: Linh Ho
-- Course: ICS2O
-- This program is designed to determine the area of a rectangle and circle. 
-- It calculates the area of the object and displays it on the device.

-- create my local variables
local areaText
local textSize = 50
local myRectangle
local widthOfRectangle = 180
local heightOfRectangle = 100
local areaOfRectangle
local areaOfCircle
local PI = 3.14
local radiusOfCircle = 200
local myCircle

--set the background colour of my screen. Remember that colors are between 0 and 1.
display.setDefault("background", 28/255, 121/255, 243/255)

-- to remove status bar
display.setStatusBar(display.HiddenStatusBar)

-- draw the rectangle that is half the width and height of the screen size.
myRectangle = display.newRect(0, 0, widthOfRectangle, heightOfRectangle)

-- anchor the rectangle in the top left corner of the screen and set its (x,y) position
myRectangle.anchorX = 0
myRectangle.anchorY = 0
myRectangle.x = 150
myRectangle.y = 20

-- set the width of the border
myRectangle.strokeWidth = 25

-- set the color of the rectangle
myRectangle:setStrokeColor(1, 1, 1)

-- set the color of the border
myRectangle:setFillColor(0.3, 0.2, 0.1)

-- calculate the area
areaOfRectangle = widthOfRectangle * heightOfRectangle

-- write the area on the screen
areaText = display.newText("The area of this rectangle with a width of \n" ..
	widthOfRectangle .. " and a height of \n" .. heightOfRectangle .. " is " ..
	areaOfRectangle .. " pixels^2. ", 200, 200, Arial, 30)

-- anchor the text and set its (x,y) position
areaText.anchorX = 0
areaText.anchorY = 200
areaText.x = 20
areaText.y = display.contentHeight/2

-- set the colour of the newText
areaText:setTextColor(1, 1, 1)

-- draw the circle 
myCircle = display.newCircle(400, 200, 150)

-- anchor the circle in the top left corner of the screen and set its (x,y) position 
myCircle.anchorX= 0
myCircle.anchorY = 0
myCircle.x = 550
myCircle.y = 20

-- set the width of the border
myCircle.strokeWidth = 30

-- set the color of the border
myCircle:setFillColor(0.2, 0.8, 0)

-- set the color of the circle 
myCircle:setStrokeColor(0.1, 0.1, 0.1)

-- change the color of the new text
areaText:setTextColor(1, 0.8, 0.3)

-- Area of a Circle Formula
areaOfCircle = PI * radiusOfCircle^2

-- Calculating the area of the circle 
areaText = display.newText("The area of this circle with a radius of \n" ..
	radiusOfCircle .. " is " .. areaOfCircle .. "pixels^2. ", 700, 500, Arial, 30)

