module(...,package.seeall)

tnt = require "tnt"

new = function( ... )

	local localGroup = display.newGroup()

	gameOverGroup = display.newGroup()
	localGroup:insert(gameOverGroup)

	local background = display.newRect(0,-300,380,1070)
	background:setFillColor(0,0,0)
	background.alpha = 0
	gameOverGroup:insert(background)

	local gameText = display.newText("GAME",0,0,"Helvetica",50)
	gameText.x = display.contentWidth / 2
	gameText.y = -100
	gameText:setTextColor(232,19,33)
	gameOverGroup:insert(gameText)

	local overText = display.newText("OVER",0,0,"Helvetica",50)
	overText.x = display.contentWidth / 2
	overText.y = 580
	overText:setTextColor(232,19,33)
	gameOverGroup:insert(overText)

	transition.to(background,{time=300,alpha = 0.8})

	tnt:newTimer(1200,showScoreStart,1)

	transition.to(gameText,{time=200,y = display.contentHeight / 2 - 32})
	transition.to(overText,{time=200,y = display.contentHeight / 2 + 32})

	transition.to(gameText,{delay=1200,y = -100,time=200})
	transition.to(overText,{delay=1200,y = 580,time=200})

	return localGroup

end

function showScoreStart( x )

	local box = display.newRect(0,0,1,1)
	box.x = display.contentWidth / 2
	box.y = display.contentHeight / 2
	box:setFillColor(20,180,222)
	gameOverGroup:insert(box)

	local scoreBackground = display.newRect(0,0,1,1)
	scoreBackground.x = display.contentWidth / 2
	scoreBackground.y = display.contentHeight / 2
	gameOverGroup:insert(scoreBackground)

	local scoreText = display.newText("score",0,0,"Helvetica",1)
	scoreText:setTextColor(0,0,0)
	scoreText.x = display.contentWidth / 2
	scoreText.y = display.contentHeight / 2
	gameOverGroup:insert(scoreText)

	local playAgain = display.newRect(0,0,1,1)
	playAgain.x = display.contentWidth / 2
	playAgain.y = display.contentHeight / 2
	playAgain:setFillColor(0,0,0)
	playAgain.alpha = 0.3
	gameOverGroup:insert(playAgain)
	playAgain:addEventListener("touch",replay)

	local quit = display.newRect(0,0,1,1)
	quit.x = display.contentWidth / 2
	quit.y = display.contentHeight / 2
	quit:setFillColor(0,0,0)
	quit.alpha = 0.3
	gameOverGroup:insert(quit)
	quit:addEventListener("touch",quitGame)

	transition.to(box,{time = 200,xScale = 320,yScale = 480})
	transition.to(scoreText,{time = 200,size = 50, y = 80})
	transition.to(scoreBackground,{time = 200,xScale = 280,yScale = 100, y = 80})
	transition.to(playAgain,{time = 200,xScale = 280,yScale = 80, y = 350})
	transition.to(quit,{time = 200,xScale = 280,yScale = 50, y = 425})


end

function replay( event )
	if event.phase == "ended" then
		director:changeScene("game")
	end
end

function quitGame( event )
	if event.phase == "ended" then
		director:changeScene("mainMenu","overFromTop")
	end
end