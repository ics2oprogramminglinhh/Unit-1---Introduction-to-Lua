-----------------------------------------------------------------------------------------
-- Name: Linh Ho
-- Course: ICS2O
-- This program displays Hello, World on the iPad simulator and "Helloooooo!" to the command
-- terminal.
-----------------------------------------------------------------------------------------

-- print my name to the console
print ("Hello, Linh Ho")

--hide the status bar
display.setStatusBar(display.HiddenStatusBar)

--sets the background colour
display.setDefault("background", 150/255, 50/255, 250/255)

-- create a local variable
local textObject

-- displays text on the screen at position x = 350 and y = 350 with the default font size of 50
textObject = display.newText( "Hello, Linh Ho!", 350, 350, nil, 50 )

-- anchor the text object from the top left corner
textObject.anchorX = 0
textObject.anchorY = 0

-- sets the color of the text object
textObject:setTextColor (255/255, 0/255, 255/255)

-- create another text variable
local textObjectSignature

-- displays text on the screen at the position in the center
-- x = center y= center with the default size of 30
textObjectSignature = display.newText ("By Linh Ho", display.contentCenterX, display.contentCenterX, nil, 30)
