module(...,package.seeall)

tnt = require "tnt"

--dipanggil setiap 1 detik utk bikin star
function spawn( ... )
	local num = math.random(5)
	if num == 1 then
		createStar2()
	else
		createStar()
	end
end

function createStar()
	local star = display.newImageRect("Assets/star.png",1,1)
	local post = math.random(1,4)
	if post == 1 then
		star.x = 40
	elseif post == 2 then
		star.x = 120
	elseif post == 3 then
		star.x = 200
	elseif post == 4 then
		star.x = 280
	end
	star.y = star.contentHeight/2+51
	tr = tnt:newTransition(star,{time = 3000 , y = 432 , onComplete=destroyStar})
	tr = tnt:newTransition(star,{time = 100,xScale = 60 , yScale = 60})
	starGroup:insert(star)
	star:addEventListener( "tap", starTapped )
end

function createStar2()
	local star = display.newImageRect("Assets/star.png",1,1)
		local post = math.random(1,4)
		if post == 1 then
			star.x = 40
		elseif post == 2 then
			star.x = 120
		elseif post == 3 then
			star.x = 200
		elseif post == 4 then
			star.x = 280
		end
		star.y = star.contentHeight/2+51
		tr = tnt:newTransition(star,{time = 3000 , y = 432 , onComplete=destroyStar})
		tr = tnt:newTransition(star,{time = 100,xScale = 60 , yScale = 60})
		starGroup:insert(star)
		star:addEventListener( "tap", starTapped )

		local star2 = display.newImageRect("Assets/star.png",1,1)
		local post2 = math.random(1,4)

		if post2 == post then
			if post >= 3 then
				post2 = post2 - math.random(2)
			else
				post2 = post2 + math.random(2)
			end
		end

		if post2 == 1 then
			star2.x = 40
		elseif post2 == 2 then
			star2.x = 120
		elseif post2 == 3 then
			star2.x = 200
		elseif post2 == 4 then
			star2.x = 280
		end
		star2.y = star.contentHeight/2+51
		tr = tnt:newTransition(star2,{time = 3000 , y = 432 , onComplete=destroyStar})
		tr = tnt:newTransition(star2,{time = 100,xScale = 60 , yScale = 60})
		starGroup:insert(star2)
		star2:addEventListener( "tap", starTapped )
		
end

function destroyStar(star)
	if not star.tapped == true then
		lives = lives - 1
	end
	if lives == 0 then
		tnt:cancelAllTransitions()
		tnt:cancelAllTimers()
		
		director:changeScene("gameOver")
		print("destroy star")
		
	else
		star:removeSelf()
	end
	
end

function starTapped( event )
	if isPaused == false then
	event.target.alpha = 0
	event.target.tapped  = true
	score = score + 10
	end
end

function pause( ... )
		tnt:pauseAllTransitions()
		tnt:pauseAllTimers()
		isPaused = true
		director:openPopUp("pause",resumeGame)
end

function toMenu( event )
	if event.phase == "ended" then
		tnt:cancelAllTransitions()
		tnt:cancelAllTimers()
		director:changeScene("mainMenu","overFromTop")
		print("to menu")
	end
end

function resumeGame( event )
		tnt:resumeAllTransitions()
		tnt:resumeAllTimers()
		isPaused = false
end

new = function( params )
	
	local localGroup = display.newGroup()

	sTimer = tnt:newTimer(1000,spawn,0)
	print("enter game")
	-- varibale game
	isPaused = false
	speed = 1
	level = 1
	lives = 3
	score = 0

	-- group
	group = display.newGroup()
	localGroup:insert(group)
	starGroup = display.newGroup()
	group:insert(starGroup)
	otherGroup = display.newGroup()
	group:insert(otherGroup)
	gameOverGroup = display.newGroup()
	group:insert(gameOverGroup)
	--group.alpha = 0

	local line = display.newRect(0,0,320,5)
	otherGroup:insert(line)
	line.y = display.contentHeight * 0.9
	local pauseButton = display.newRect(3,3,display.contentWidth*0.10,display.contentHeight*0.05)
	otherGroup:insert(pauseButton)
	pauseButton:addEventListener("tap",pause)
	
	--background
	local backgroundImage = display.newImageRect("Assets/mainMenuBackground.png",380,570)
	backgroundImage.x = 160
	backgroundImage.y = 240
	group:insert(backgroundImage)
	backgroundImage:toBack()

	--transition.to(group,{time=300,alpha = 1})

	--bars
	topBar = display.newRect(0,-100,480,100)
	bottomBar = display.newRect(0,480,480,100)
	topBar:setFillColor(0,0,0)
	bottomBar:setFillColor(0,0,0)
	topBar.alpha = 0.6
	bottomBar.alpha = 0.6

	otherGroup:insert(topBar)
	otherGroup:insert(bottomBar)


	return localGroup
end