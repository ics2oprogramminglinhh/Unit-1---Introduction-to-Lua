-----------------------------------------------------------------------------------------
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays Hello, Linh Ho on the iPad simulator and "This is awesome!" 
-- to the command terminal.
-----------------------------------------------------------------------------------------

-- print my name to the console
print ("Hello, Linh Ho")

--Hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- Sets background colour
display.setDefault("background", 204/255, 255/255, 229/255)

-----------------------------------------------------------------------------------------
-- LOCAL VARIABLES 
-----------------------------------------------------------------------------------------

local textObject
local textObjectSignature
local textObjectNew

-----------------------------------------------------------------------------------------
-- TEXT OBJECTS
-----------------------------------------------------------------------------------------

-- Displays text on the screen at position x = 350 and y = 350 with the default font size of 50
textObject = display.newText("Hello, Linh Ho!", 350, 350, nil, 50)

-- Anchor the text object from the top left corner
textObject.anchorX = 0
textObject.anchorY = 0

-- Sets color of the text object
textObject:setTextColor (153/255, 153/255, 255/255)

-- displays text on the screen at the position in the center
-- x = center, y= center with default size of 40
textObjectSignature = display.newText ("By Linh Ho", display.contentCenterX, display.contentCenterX, nil, 40)

-- sets color of the text object 
textObjectSignature:setTextColor(0/255, 0/255, 52/255)

-- displays "This is awesome!" above the text "Hello, Linh Ho"
textObjectNew = display.newText("This is awesome!", 500, 250, nil, 80)

-- sets color of the text object
textObjectNew:setTextColor(255/255, 102/255, 102/255)
