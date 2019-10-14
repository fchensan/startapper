module(...,package.seeall)

new = function()

	--print("halo")

	local localGroup = display.newGroup()

	isStarted = true
	local menuGroup = display.newGroup()
	localGroup:insert(menuGroup)
	--title
	local title = display.newText("Game",0,0,"Helvetica",50)
	title.x = display.contentWidth / 2
	title.y = display.contentHeight * 0.1
	menuGroup:insert(title)
	--background
	local backgroundImage = display.newImageRect("Assets/mainMenuBackground.png",380,570)
	backgroundImage.x = 160
	backgroundImage.y = 240
	menuGroup:insert(backgroundImage)
	backgroundImage:toBack()

	Runtime:addEventListener( "accelerometer", function(event)
		if event.isShake then
		stop()
	end
	end )


	return localGroup
end
function stop()
	
	print("aaaa")
	director:changeScene("game")
		
end