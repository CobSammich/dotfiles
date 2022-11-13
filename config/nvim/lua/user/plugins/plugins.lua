local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
	PACKER_BOOTSTRAP = fn.system({
		"git",
		"clone",
		"--depth",
		"1",
		"https://github.com/wbthomason/packer.nvim",
		install_path,
	})
	print("Installing packer close and reopen Neovim...")
	vim.cmd([[packadd packer.nvim]])
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
	return
end

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

-- Install your plugins here
return packer.startup(function(use)
	-- My plugins here
	use("wbthomason/packer.nvim") -- Have packer manage itself
	use("nvim-lua/popup.nvim") -- An implementation of the Popup API from vim in Neovim
	use("nvim-lua/plenary.nvim") -- Useful lua functions used ny lots of plugins
	use("windwp/nvim-autopairs") -- Autopairs, integrates with both cmp and treesitter
	use("numToStr/Comment.nvim") -- Easily comment stuff
	use("kyazdani42/nvim-tree.lua")
	use("kyazdani42/nvim-web-devicons")
	use("lewis6991/impatient.nvim")
	use("akinsho/toggleterm.nvim")
	use("ahmedkhalf/project.nvim")
	-- use "goolord/alpha-nvim"
	-- use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
	use({ "kkoomen/vim-doge", run = ":call doge#install()" })
	use("vimwiki/vimwiki")

	-- Colorschemes
	use("lunarvim/darkplus.nvim")
	use("folke/tokyonight.nvim")
	use("jaredgorski/spacecamp") -- doesn't work with rounded borders
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("tyrannicaltoucan/vim-deep-space")
	use("YorickPeterse/happy_hacking.vim")
	use("sainnhe/sonokai")
	use("challenger-deep-theme/vim")
	use("bluz71/vim-moonfly-colors")
	use({ "adisen99/codeschool.nvim", requires = { "rktjmp/lush.nvim" } })
	use("rebelot/kanagawa.nvim")
	-- use "morhetz/gruvbox"
	use("ellisonleao/gruvbox.nvim")
	use("navarasu/onedark.nvim")
	-- use "joshdick/onedark.vim"
	use("NLKNguyen/papercolor-theme")
	use("Mofiqul/dracula.nvim")
	use("bratpeki/truedark-vim")

	-- cmp plugins
	use("hrsh7th/nvim-cmp") -- The completion plugin
	use("hrsh7th/cmp-buffer") -- buffer completions
	use("hrsh7th/cmp-path") -- path completions
	use("hrsh7th/cmp-cmdline") -- cmdline completions
	use("saadparwaiz1/cmp_luasnip") -- snippet completions
	use("hrsh7th/cmp-nvim-lsp")
	-- use "hrsh7th/cmp-nvim-lua"

	-- snippets
	use("L3MON4D3/LuaSnip") --snippet engine
	use("rafamadriz/friendly-snippets") -- a bunch of snippets to use

	-- LSP
	use("neovim/nvim-lspconfig") -- enable LSP
	use("williamboman/nvim-lsp-installer") -- simple to use language server installer
	-- use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
	use("jose-elias-alvarez/null-ls.nvim") -- for formatters and linters

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- Treesitter
	use({
		"nvim-treesitter/nvim-treesitter",
		run = ":TSUpdate",
	})
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use("lewis6991/gitsigns.nvim")

	-- tree and function display
	use("stevearc/aerial.nvim")
	-- signature completion
	use("ray-x/lsp_signature.nvim")
	-- dashboard showing previous projects open
	-- use("ChristianChiarulli/dashboard-nvim")
	use({
		"goolord/alpha-nvim",
		requires = { "kyazdani42/nvim-web-devicons" },
		config = function()
			require("alpha").setup(require("alpha.themes.startify").config)
		end,
	})

	-- status line
	use("nvim-lualine/lualine.nvim")

	-- Buffers
	use("akinsho/bufferline.nvim")

	-- Automatically create markdown tables
	use("dhruvasagar/vim-table-mode")

	use("chrisbra/Colorizer")

	use("lukas-reineke/indent-blankline.nvim")
	use("wakatime/vim-wakatime")

	use({ "hkupty/iron.nvim" })

	-- Automatically set up your configuration after cloning packer.nvim
	-- Put this at the end after all plugins
	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)