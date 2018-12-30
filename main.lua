local grid = {}
local GRID_SIZE = 5
local GRID_X, GRID_Y
local t = 0
local offset = 0

local function setNoise()
    offset = love.math.random()
end

function love.load()
    GRID_X, GRID_Y = love.graphics.getWidth() / GRID_SIZE, love.graphics.getHeight() / GRID_SIZE
    setNoise()
end

function love.update(dt)
    t = t + dt
    for x = 1, GRID_X do
        for y = 1, GRID_Y do
            grid[x] = grid[x] or {}
            grid[x][y] = love.math.noise(x + t, y + t)
        end
    end
end

function love.draw()
    for x = 1, #grid do
        for y = 1, #grid[x] do
            local f = 1 * grid[x][y]
            love.graphics.setColor( f, f, f, 1 )
            love.graphics.rectangle( 'fill', (x - 1) * GRID_SIZE, (y - 1) * GRID_SIZE, GRID_SIZE, GRID_SIZE)
            love.graphics.setColor( 1, 1, 1, 1 )
        end
    end
end

function love.keypressed(key)
    if key == 'escape' then
        love.event.quit()
    else
        setNoise()
    end
end