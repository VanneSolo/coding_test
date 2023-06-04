local FOV_PATH =({...})[1]:gsub("[%.\\/]fov$", "") .. '/'
local class  =require (FOV_PATH .. 'vendor/30log')

local FOV=class{ __name, _lightPasses, _options }
FOV.__name='FOV'
function FOV:__init(lightPassesCallback, options)
    self._lightPasses=lightPassesCallback
    self._options={topology=8}
    if options then for k,_ in pairs(options) do self._options[k]=options[k] end end
end

function FOV:compute(x, y, R, callback) end

function FOV:_getCircle(cx, cy, r)
    local result={}
    local dirs, countFactor, startOffset
    local topo=self._options.topology
    if topo==4 then
        countFactor=1
        startOffset={0,1}
        dirs={
              ROT.DIRS.EIGHT[8],
              ROT.DIRS.EIGHT[2],
              ROT.DIRS.EIGHT[4],
              ROT.DIRS.EIGHT[6]
             }
    elseif topo==8 then
        dirs=ROT.DIRS.FOUR
        countFactor=2
        startOffset={-1,1}
    end

    local x=cx+startOffset[1]*r
    local y=cy+startOffset[2]*r

    for i=1,#dirs do
        for j=1,r*countFactor do
            table.insert(result, {x, y})
            x=x+dirs[i][1]
            y=y+dirs[i][2]
        end
    end
    return result
end

function FOV:_getRealCircle(cx, cy, r)
    local i=0
    local result={}
    while i<2*math.pi do
        i=i+0.05
        x = cx + r * math.cos(i)
        y = cy + r * math.sin(i)
        table.insert(result, {x,y})
    end
    return result
end

return FOV
