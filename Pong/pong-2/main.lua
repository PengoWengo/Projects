
push = require 'push'       --import class

--screen ratio 16:9............... remember this........
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
--virtual window size: your coordinates will be based on this system
VIRTUAL_WIDTH = 432 
VIRTUAL_HEIGHT = 243

--Runs when the game first starts up, only once... only once
function love.load()
    --neares nearest filtering on upscaling and downscaling to prevent blurring of text and graphics 
    love.graphics.setDefaultFilter('nearest','nearest')

    --more retro looking font we need to load it in
    smallFont = love.graphics.newFont('font.ttf',8)

    --set the font to the retro loo
    love.graphics.setFont(smallFont)


    --initialize our virtual res screen inside of the original window size 
    push:setupScreen(VIRTUAL_WIDTH,VIRTUAL_HEIGHT,WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen=false,
        resizable=false,
        vsync=true
    })
end

function love.update()
end

--called after update function by Love2D, this draws what is on your screen
function love.draw()
    --begin rendering a virtual res
    push:apply('start')

    --clear the screen AND set the background color(R,G,B,A)
    love.graphics.clear(40,45,52,255)

    love.graphics.printf('Hello Pong!',0,20,VIRTUAL_WIDTH,'center')         --moving to the top of the screen
--love.graphics.rectangle('fill option',x,y,w,h)    --w and h can stretch the paddle....
--left side paddle
    love.graphics.rectangle('fill',10,30,5,20)
    --right side paddle
    love.graphics.rectangle('fill',VIRTUAL_WIDTH-10,VIRTUAL_HEIGHT-50,5,20)

    --ball
    love.graphics.rectangle('fill',VIRTUAL_WIDTH/2,VIRTUAL_HEIGHT/2,4,4)
        --end rendering of virtual res
        push:apply('end')
end
