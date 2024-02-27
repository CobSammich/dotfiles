---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- Move between buffers
    ["L"] = {
      function()
        require("nvchad.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["H"] = {
      function()
        require("nvchad.tabufline").tabuflinePrev()
      end,
      "Goto prev buffer",
    },

    -- Show diagnostics
    ["gl"] = {
      function()
        vim.diagnostic.open_float { border = "rounded" }
      end,
      "Floating diagnostic",
    },
    -- Arrange Buffers
    ["<leader>hh"] = {
      function()
        require("nvchad.tabufline").move_buf(-1)
      end,
      "Move Buffer left",
    },
    ["<leader>ll"] = {
      function()
        require("nvchad.tabufline").move_buf(1)
      end,
      "Move Buffer left",
    },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    ["<leader>sc"] = { ":setlocal spell! spelllang=en_us<CR>", "Toggle Spell Checking" },

    ["<C-d>"] = { "oipdb.set_trace()<ESC>", "Set debug trace" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find Recent Projects" },
  },

  i = {
     -- I have a problem with shifts...
    ["kj"] = { "<ESC>", "Exit Insert Mode", opts = { nowait = true } },
    ["kJ"] = { "<ESC>", "Exit Insert Mode", opts = { nowait = true } },
    ["Kj"] = { "<ESC>", "Exit Insert Mode", opts = { nowait = true } },
    ["KJ"] = { "<ESC>", "Exit Insert Mode", opts = { nowait = true } },
  },
}

-- vim.cmd[[autocmd Filetype tex inoremap $ $$<ESC>i]]
-- more keybinds!

return M
