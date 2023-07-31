---@type MappingsTable
local M = {}

M.general = {
  n = {
    [";"] = { ":", "enter command mode", opts = { nowait = true } },
    -- Move between buffers
    ["L"] = {
      function()
        require("nvchad_ui.tabufline").tabuflineNext()
      end,
      "Goto next buffer",
    },
    ["H"] = {
      function()
        require("nvchad_ui.tabufline").tabuflinePrev()
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
        require("nvchad_ui.tabufline").move_buf(-1)
      end,
      "Move Buffer left",
    },
    ["<leader>ll"] = {
      function()
        require("nvchad_ui.tabufline").move_buf(1)
      end,
      "Move Buffer left",
    },
    ["<leader>e"] = { "<cmd> NvimTreeToggle <CR>", "Toggle nvimtree" },

    ["<leader>sc"] = { ":setlocal spell! spelllang=en_us<CR>", "Toggle Spell Checking" },

    ["<C-d>"] = { "oipdb.set_trace()<ESC>", "Set debug trace" },

    ["<leader>fp"] = { "<cmd> Telescope projects <CR>", "Find Recent Projects" },
  },

  i = {
    ["kj"] = { "<ESC>", "Exit Insert Mode", opts = { nowait = true } },
  },
}

-- more keybinds!

return M
