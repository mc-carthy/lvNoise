Perlin1D = require('src.perlin1d')
Perlin2D = require('src.perlin2d')

function love.load()
    -- scene = Perlin1D:new{ octaves = 3 }
    scene = Perlin2D:new()
end

function love.update(dt)
    scene:update(dt)
end

function love.draw()
    scene:draw()
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    end
end