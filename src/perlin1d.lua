local Perlin1D = {}

local scaleX = 0.01
local gridSize = 1


function Perlin1D:setPoints(xoff, numOctaves)
    for x = 0, self.numPoints do
        self.points[x] = 0
    end
    numOctaves = numOctaves or 1
    local scale = scaleX
    for o = 1, numOctaves do
        for x = 0, self.numPoints do
            self.points[x] = self.points[x] + (love.math.noise((x + xoff) * scale) * 0.5^o)
            -- self.points[x] = self.points[x] + (1 * 0.5^o)
        end
        scale = scale * 2
    end
end

function Perlin1D:new(params)
    self.points = {}
    self.numPoints = math.floor(love.graphics.getWidth() / gridSize)
    self.xOffset = 0
    self.xSpeed = 100
    self.numOctaves = params.octaves or 1

    self:setPoints(self.xOffset, self.numOctaves)
    
    return self
end

function Perlin1D:update(dt)
    self.xOffset = self.xOffset + self.xSpeed * dt
    self:setPoints(self.xOffset, self.numOctaves)
end

function Perlin1D:draw()
    love.graphics.setColor(1, 1, 1)
    for x = 1, self.numPoints do
        love.graphics.line((x - 1) * gridSize, self.points[x - 1] * love.graphics.getHeight(), x * gridSize, self.points[x] * love.graphics.getHeight())
    end
end

return Perlin1D