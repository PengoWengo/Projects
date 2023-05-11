
push = require 'push'       --import class
--screen ratio 16:9............... remember this........
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
--virtual window size: your coordinates will be based on this system
VIRTUAL_WIDTH = 432 
VIRTUAL_HEIGHT = 243

PADDLE_SPEED = 200

--Runs when the game first starts up, only once... only once
function love.load()
    --neares nearest filtering on upscaling and downscaling to prevent blurring of text and graphics 
    love.graphics.setDefaultFilter('nearest','nearest')

    --set the seed or the "randomness" of the serve
    --if we set the "randomness" based on time, in theory it is the most random
    math.randomseed(os.time())


    --more retro looking font we need to load it in

    smallFont = love.graphics.newFont('font.ttf',8)
    scoreFont = love.graphics.newFont('font.ttf',32)
    --set the font to the retro loo
    love.graphics.setFont(smallFont)

    --setup player score
    player1Score = 0
    player2Score = 0

    --setup paddle location
    player1Y = 30
    player2Y = VIRTUAL_HEIGHT-50

    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen=false,
        resizable=false,
        vsync=true
    })
    --set the ball's default location
    ballX= VIRTUAL_WIDTH/2-2
    ballY= VIRTUAL_HEIGHT/2-2

    --preset the ball's velocity vector
    ballDX = math.random(2) == 1 and 100 or -100
    ballDY = math.random(-50,50) * 1.5

    --setting up the game to be in a "start mode" or "main menu"
    --stat examples: main menu, play, high score, game over
    gameState = 'start'
    --initialize our virtual res screen inside of the original window size 

end

--update runs every time the sceen refreshes
function love.update(dt)
    if love.keyboard.isDown('w') then
        player1Y = math.max(0,player1Y + -PADDLE_SPEED*dt)
    elseif love.keyboard.isDown('s') then
        player1Y = math.min(VIRTUAL_HEIGHT - 20,player1Y + PADDLE_SPEED*dt)

    end
    --player 2 or right side movement
    if love.keyboard.isDown('up') then
        player2Y = math.max(0,player2Y + -PADDLE_SPEED*dt)
    elseif love.keyboard.isDown('down') then
        player2Y = math.min(VIRTUAL_HEIGHT - 20,player2Y + PADDLE_SPEED*dt)
    end

    --pos = init pos +vector*time   kinematics
    if gameState == 'play' then
        ballX = ballX+ballDX*dt
        ballY = ballY+ballDY*dt
    end
end

function love.keypressed(key)
    --keys can be accessed by string name
    if key == 'escape' then
        love.event.quit()
    elseif key == 'enter' or key == 'return' then
        if gameState == 'start' then
            gameState = 'play'
        else
            gameState = 'start'
        
            ballX= VIRTUAL_WIDTH/2-2
            ballY= VIRTUAL_HEIGHT/2-2
            ballDX = math.random(2) == 1 and 100 or -100
            ballDY = math.random(-50,50) * 1.5
            --reet the ball and anything else you want to reset...
        end
    end
end

--called after update function by Love2D, this draws what is on your screen
function love.draw()
    --begin rendering a virtual res
    push:apply('start')

    --clear the screen AND set the background color(R,G,B,A)
    love.graphics.clear(40,45,52,255)
    
    love.graphics.setFont(smallFont)
    if gameState == 'start' then
        love.graphics.printf('Hello Start State!',0,20,VIRTUAL_WIDTH,'center')         --moving to the top of the screen
    else
        love.graphics.printf('Hello Play State!',0,20,VIRTUAL_WIDTH,'center')  
    end

    love.graphics.setFont(scoreFont)
    love.graphics.print(tostring(player1Score), VIRTUAL_WIDTH / 2 - 50, VIRTUAL_HEIGHT / 3)
    love.graphics.print(tostring(player2Score), VIRTUAL_WIDTH / 2 + 30, VIRTUAL_HEIGHT / 3)


    --love.graphics.rectangle('fill option',x,y,w,h)    --w and h can stretch the paddle....
    --left side paddle
    love.graphics.rectangle('fill',10,player1Y,5,20)
    --right side paddle
    love.graphics.rectangle('fill',VIRTUAL_WIDTH-10,player2Y,5,20)

    --ball
    love.graphics.rectangle('fill',ballX,ballY,4,4)
    --end rendering of virtual res
    push:apply('end')
end
