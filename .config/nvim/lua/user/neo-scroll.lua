local status_ok, neoscroll = pcall(require, "neoscroll")
if not status_ok then
    return
end

neoscroll.setup({
    stop_eof = true,             -- Stop at <EOF> when scrolling downwards
    cursor_scrolls_alone = true, -- The cursor will keep on scrolling even if the window cannot scroll further
    duration_multiplier = 0.5,   -- Global duration multiplier
})
