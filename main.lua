-----------------------------------------------------------------------------------------
--
-- main.lua
--
-----------------------------------------------------------------------------------------

-- Your code here

-- multitouch + status bar
 system.activate("multitouch")
 display.setStatusBar(display.HiddenStatusBar)


local director = require("director")

local mainGroup = display.newGroup()

local main = function ()
	
	mainGroup:insert(director.directorView)
	director:changeScene("mainMenu")
	return true
end

main()