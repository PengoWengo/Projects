
push = require 'push'       --import class

--screen ratio 16:9............... remember this........
WINDOW_WIDTH = 720
WINDOW_HEIGHT = 1280
--virtual window size: your coordinates will be based on this system
VIRTUAL_WIDTH = 243
VIRTUAL_HEIGHT = 432 

--Runs when the game first starts up, only once... only once
function love.load()
    --neares nearest filtering on upscaling and downscaling to prevent blurring of text and graphics 
    love.graphics.setDefaultFilter('nearest','nearest')

    --initialize our virtual res screen inside of the original window size 
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_HEIGHT,WINDOW_WIDTH,{
        fullscreen=false,
        resizzble=false,
        vsync=true
    })
end

function love.update()
end

--called after update function by Love2D, this draws what is on your screen
function love.draw()
    --begin rendering a virtual res
    push:apply('start')

    love.graphics.printf(
        'Hello Pong!',          --text to render
        0,                      --starting X Location
        VIRTUAL_HEIGHT/2 - 6,    --starting Y location
        VIRTUAL_WIDTH,           --number of pixels to center within
        'center')               --center allign(left or right)
    
        --end rendering of virtual res
        push:apply('end')
end
