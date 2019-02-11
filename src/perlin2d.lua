local Perlin2D = {}

local GRID_SIZE = 2
local SCALE = 0.005

function Perlin2D:setNoise()
    for x = 1, self.xSize do
        for y = 1, self.ySize do
            self.grid[x] = self.grid[x] or {}
            self.grid[x][y] = love.math.noise(x * SCALE + self.xOff, y * SCALE + self.yOff)
        end
    end
end

function Perlin2D:new()
    self.grid = {}
    self.xSize, self.ySize = love.graphics.getWidth() / GRID_SIZE, love.graphics.getHeight() / GRID_SIZE
    self.xOff, self.yOff = 0, 0
    self:setNoise()
    
    return self
end

function Perlin2D:update(dt)
    self.xOff, self.yOff = self.xOff + dt, self.yOff + dt
    self:setNoise()
end

function Perlin2D:draw()
    for x = 1, #self.grid do
        for y = 1, #self.grid[x] do
            local f = 1 * self.grid[x][y]
            love.graphics.setColor( f, f, f, 1 )
            love.graphics.rectangle( 'fill', (x - 1) * GRID_SIZE, (y - 1) * GRID_SIZE, GRID_SIZE, GRID_SIZE)
            love.graphics.setColor( 1, 1, 1, 1 )
        end
    end
end

return Perlin2D