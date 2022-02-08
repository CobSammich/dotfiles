-- set colorscheme as default at first
vim.cmd "colorscheme default"

local colorscheme = "spacecamp"

-- Try to set colorscheme -- if it doesn't work then keep as default
local status_ok, _ = pcall(vim.cmd, "colorscheme " .. colorscheme)

if not status_ok then
    vim.notify("colorscheme " .. colorscheme .. " not found!")
    return
end
