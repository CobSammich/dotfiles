require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "kj", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

map("n", "gl", function()
  vim.diagnostic.open_float { border = "rounded" }
end, { desc = "Floating Diagnostic" })

map("n", "L", function()
  require("nvchad.tabufline").next()
end, { desc = "Goto next buffer" })

map("n", "H", function()
  require("nvchad.tabufline").prev()
end, { desc = "Goto prev buffer" })
--
-- Arrange Buffers
map("n", "<leader>hh", function()
  require("nvchad.tabufline").move_buf(-1)
end, { desc = "Move Buffer left" })

map("n", "<leader>ll", function()
  require("nvchad.tabufline").move_buf(1)
end, { desc = "Move Buffer left" })

map("n", "<leader>e", "<cmd> NvimTreeToggle <CR>", { desc = "Toggle nvimtree" })
map("n", "<leader>sc", ":setlocal spell! spelllang=en_us<CR>", { desc = "Toggle Spell Checking" })
map("n", "<C-d>", "obreakpoint()<ESC>", { desc = "Set debug trace" })
map("n", "<leader>fp", "<cmd> Telescope projects <CR>", { desc = "Find Recent Projects" })
