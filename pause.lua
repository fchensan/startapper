module(...,package.seeall)

tnt = require "tnt"

new = function ()
	
	local localGroup = display.newGroup()

	-- --pause item
	over = display.newRect(0,0,display.contentWidth,670)
	over:setFillColor(0,0,0)
	over.alpha = 0.8
	localGroup:insert(over)

	backToMenu = display.newRect(0,0,150,100)
	backToMenu.y = 165
	backToMenu.x = 160
	backToMenu:addEventListener("touch",toMenu)
	localGroup:insert(backToMenu)

	backToGame = display.newRect(0,0,150,100)
	backToGame.y = backToMenu.y + 150
	backToGame.x = 160
	backToGame:addEventListener("tap",resumeGame)
	localGroup:insert(backToGame)
	
	return localGroup
	
	
end

function resumeGame( event )
	director:closePopUp()
end

function toMenu( ... )
	director:closePopUp()
	director:changeScene("mainMenu")
	tnt:cancelAllTransitions()
	tnt:cancelAllTimers()
end