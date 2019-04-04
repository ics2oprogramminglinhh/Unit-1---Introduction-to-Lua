-- Title: Numeric TextField
-- Name: Linh Ho
-- Course ICS2O 
--This program displays a math question and asks the user to answer in a numeric textfield
--terminal.
-----------------------------------------------------------------------------------------

-- hide the status bar
display.setStatusBar(display.HiddenStatusBar)

-- set the background colour
display.setDefault("background", 255/255, 218/255, 185/255)

------------------------------------------------------------------------------------------
-- LOCAL VARIABLES
------------------------------------------------------------------------------------------

-- Create local variables
local questionObject
local correctObject
local numericField
local randomNumber1
local randomNumber2
local userAnswer
local correctAnswer

-- Additional local variables
local incorrectObject
local pointsObject
local points = 0
local randomOperator
local randomNumber3
local randomNumber4

-------------------------------------------------------------------------------------------
-- SOUNDS
-------------------------------------------------------------------------------------------

-- Correct sound
local correctSound = audio.loadSound("Sounds/correct.mp3")
local correctSoundChannel

-- Wrong Sound
local wrongSound = audio.loadSound("Sounds/wrong.mp3")
local wrongSoundChannel

-------------------------------------------------------------------------------------------
-- LOCAL FUNCTIONS
-------------------------------------------------------------------------------------------

local function AskQuestion()
-- generate a random number between 1 and 4
	randomOperator = math.random(1, 4)

	-- generate 2 random numbers between a max. and a min. number
	randomNumber1 = math.random(10, 20)
	randomNumber2 = math.random(10, 20)
	randomNumber3 = math.random(0, 10)
	randomNumber4 = math.random(0, 10)

	-- display points 
	pointsObject.text = "Points" .. " = " .. points

	if (randomOperator == 1) then 

		-- calculate the correct answer
		correctAnswer = randomNumber1 + randomNumber3

		-- create question in text object
		questionObject.text = randomNumber1 .. " + " .. randomNumber3 .. " = "

	-- otherwise, if the random operator is 2, do subtraction
	elseif (randomOperator == 2) then
		correctAnswer = randomNumber2 - randomNumber4
			
		-- create question in text object 
		questionObject.text = randomNumber2 .. " - " .. randomNumber4 .. " = "
	end

	if (randomOperator == 3) then
			correctAnswer = randomNumber3 * randomNumber4 

		-- create question in text object
		questionObject.text = randomNumber3 .. " x " .. randomNumber4 .. " = "
	-- otherwise, if the random operator is 4, do multiplication
	elseif (randomOperator == 4) then
		    correctAnswer = randomNumber3 / randomNumber4

		-- create question in text object
			questionObject.text = randomNumber3 .. "/" .. randomNumber4 .. "="
	end
end

local function HideCorrect()
	correctObject.isVisible = false
	AskQuestion()
end

local function HideIncorrect()
	incorrectObject.isVisible = false
	AskQuestion()
end

local function NumericFieldListener(event)

	-- User begins editing "numericField"
	if (event.phase == "began") then

		-- clear text field
		event.target.text = ""

	elseif event.phase == "submitted" then

		-- when the answer is submitted (enter key is pressed) set user input to user's answer
		userAnswer = tonumber(event.target.text)

		-- if the users answer is correct
		if (userAnswer == correctAnswer) then
			correctObject.isVisible = true
			incorrectObject.isVisible = false
			correctSoundChannel = audio.play(correctSound)
			timer.performWithDelay(2500, HideCorrect)
			points = points + 1
			pointsObject.text = "Points" .. " = ".. points

		elseif (userAnswer) then
			correctObject.isVisible = false
			incorrectObject.isVisible = true
			wrongSoundChannel = audio.play(wrongSound)
			timer.performWithDelay(2500, HideIncorrect)
		end
	end 
end

------------------------------------------------------------------------------------------
-- OBJECT CREATION
------------------------------------------------------------------------------------------

-- displays a question and sets the colour
questionObject = display.newText("", display.contentWidth/3, display.contentHeight/2, nil, 70)
questionObject:setTextColor(0/255, 0/255, 0/255)

-- displays points and sets the colour
pointsObject = display.newText("", 300, 150, Arial, 30)
pointsObject:setTextColor(128/255, 128/255, 128/255)

-- create the correct text object and make it invisible
correctObject = display.newText( "Correct!", display.contentWidth/2, display.contentHeight/3, nil, 100)
correctObject:setTextColor(50/255, 128/255, 50/255)
correctObject.isVisible = false

-- create the incorrect text object and make it invisible 
incorrectObject = display.newText("Incorrect", display.contentWidth/2, display.contentHeight/3, nil, 100)
incorrectObject:setTextColor(70/255, 90/255, 120/255)
incorrectObject.isVisible = false
-- Create numeric field
numericField = native.newTextField(500, display.contentWidth/2, display.contentHeight/2, 100, 100)
numericField.inputType = "number"

-- add the event listener for the numeric field
numericField:addEventListener( "userInput", NumericFieldListener )

-----------------------------------------------------------------------------------------
-- FUNCTION CALLS
-----------------------------------------------------------------------------------------

-- call the function to ask the question
AskQuestion()