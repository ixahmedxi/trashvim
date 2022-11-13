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

local packer = require("packer")

-- Have packer use a popup window
packer.init({
	display = {
		open_fn = function()
			return require("packer.util").float({ border = "rounded" })
		end,
	},
})

return packer.startup(function(use)
	-- Essentials
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")
	use("miversen33/import.nvim")
	use("kyazdani42/nvim-web-devicons")
	use("MunifTanjim/nui.nvim")

	-- Navigation
	use({
		"nvim-neo-tree/neo-tree.nvim",
		branch = "v2.x",
	})
	use("folke/which-key.nvim")

	-- Buffers
	use("lewis6991/gitsigns.nvim")
	use("nvim-lualine/lualine.nvim")
	use({ "akinsho/bufferline.nvim", tag = "v3.*" })
	use("famiu/bufdelete.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("kevinhwang91/nvim-hlslens")
	use("petertriho/nvim-scrollbar")

	-- Colorschemes
	use("kvrohit/mellow.nvim")
	use("Yazeed1s/oh-lucy.nvim")
	use({ "catppuccin/nvim", as = "catppuccin" })
	use("marko-cerovac/material.nvim")
	use("folke/tokyonight.nvim")
	use("olivercederborg/poimandres.nvim")
	use("tiagovla/tokyodark.nvim")
	use("projekt0n/github-nvim-theme")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")
	use("p00f/nvim-ts-rainbow")
	use("windwp/nvim-autopairs")

	-- Telescope
	use("nvim-telescope/telescope.nvim")
	use({
		"nvim-telescope/telescope-fzf-native.nvim",
		run = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build",
	})
	use("nvim-telescope/telescope-project.nvim")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("onsails/lspkind.nvim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("b0o/SchemaStore.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use("simrat39/symbols-outline.nvim")
	use("j-hui/fidget.nvim")
	use("ray-x/lsp_signature.nvim")
	use("smjonas/inc-rename.nvim")
	use({
		"weilbith/nvim-code-action-menu",
		cmd = "CodeActionMenu",
	})
	use("kosayoda/nvim-lightbulb")
	use("jose-elias-alvarez/null-ls.nvim")
	use("jayp0521/mason-null-ls.nvim")
  use("gpanders/editorconfig.nvim")
  use("folke/trouble.nvim")

	-- Editing
	use("max397574/better-escape.nvim")
	use("ethanholz/nvim-lastplace")
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")
	use("abecodes/tabout.nvim")
	use("phaazon/hop.nvim")
	use("kylechui/nvim-surround")

	-- UI
	use("goolord/alpha-nvim")
	use("stevearc/dressing.nvim")

	-- Misc
	use("lewis6991/impatient.nvim")
	use("akinsho/toggleterm.nvim")
  use("rcarriga/nvim-notify")

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
