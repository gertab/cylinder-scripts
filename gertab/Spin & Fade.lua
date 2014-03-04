--[[
    Spin & Fade v1.0
    by gertab
 
    Very calm effect which makes the apps spin for half a revolution in different directions, and fade at the same time.
]]
local spin = dofile("include/spin.lua")
local fade = dofile("include/fade.lua")
return function(page, offset, screen_width, screen_height)
    local percent = offset/page.width
    page:translate(offset, 0, 0)
    i = 0
    while true do
        i = i + 1
        local view = page[i]
        if view == nil then break end
        local mult = 1
        if (i % 2 == 0) then mult = -1 end
        spin(view, percent*mult*0.5, 1)
    end 
    fade(page, percent)
end
