-----------------------------------------------------------------------------------------
--
-- main.lua
-- Title: SampleVideoGame
-- Created by: Linh Ho
-- Date: February 6th, 2019
-- Course: ICS2O
-- Description: This calls the splash screen of the app to load itself.
-----------------------------------------------------------------------------------------

-- Hiding Status Bar
display.setStatusBar(display.HiddenStatusBar)

-----------------------------------------------------------------------------------------

-- Use composer library
local composer = require( "composer" )

-----------------------------------------------------------------------------------------

-- Go to the intro screen
composer.gotoScene( "splash_screen" )
