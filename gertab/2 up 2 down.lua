local spin = dofile("include/spin.lua")
local fade = dofile("include/fade.lua")
return function(page, offset, screen_width, screen_height)
    local percent = offset/page.width
    local num = 0
    local numCopied = 0
    local view = nil
    while true do
        num = num + 1
        view = page[num]
        if view == nil then break end
        -- numCopied holds the column no
        numCopied = num%4
        if numCopied == 0 then numCopied = 4 end
        if (numCopied == 1 or numCopied == 3) then
            view:translate(offset, page.height*percent, 0)
        else
            view:translate(offset, -page.height*percent, 0)
        end
        fade(view, percent, 1)
    end
end