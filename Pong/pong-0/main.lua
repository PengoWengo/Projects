--[[
    Love2d looks for main functons
        it has a certain order that the program HAS To run
]]
WINDOW_WIDTH = 1280
WINDOW_HEIGHT = 720
--screen ratio 16:9............... remember this........
--Runs when the game first starts up, only once... only once
function love.load()
    --love module's window module's setMode functions
    love.window.setMode(WINDOW_WIDTH,WINDOW_HEIGHT,{
        fullscreen = false,
        resizable = false,
        vsync = true
    })
end

function love.update()
end

--called after update function by Love2D, this draws what is on your screen
function love.draw()
    love.graphics.printf(
        'Hello Pong!',          --text to render
        0,                      --starting X Location
        WINDOW_HEIGHT/2 - 6,    --starting Y location
        WINDOW_WIDTH,           --number of pixels to center within
        'center')               --center allign(left or right)
end
