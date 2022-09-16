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

return packer.startup(function(use)
	-- Essentials
	use("wbthomason/packer.nvim")
	use("nvim-lua/plenary.nvim")

	-- Colorschemes
	use({ "catppuccin/nvim", as = "catppuccin" })

	-- File explorer
	use("kyazdani42/nvim-web-devicons")
	use("kyazdani42/nvim-tree.lua")

	-- Buffer and status lines
	use({ "akinsho/bufferline.nvim", tag = "v2.*" })
	use("nvim-lualine/lualine.nvim")

	-- Treesitter
	use("nvim-treesitter/nvim-treesitter")
	use("windwp/nvim-ts-autotag")
	use("nvim-treesitter/nvim-treesitter-textobjects")

	use("folke/which-key.nvim")

	-- Telescope
	use("nvim-telescope/telescope.nvim")

	-- CMP
	use("hrsh7th/nvim-cmp")
	use("hrsh7th/cmp-buffer")
	use("hrsh7th/cmp-path")
	use("hrsh7th/cmp-cmdline")
	use("saadparwaiz1/cmp_luasnip")
	use("hrsh7th/cmp-nvim-lsp")
	use("L3MON4D3/LuaSnip")
	use("rafamadriz/friendly-snippets")
	use("windwp/nvim-autopairs")
	use("onsails/lspkind.nvim")

	-- Comments
	use("numToStr/Comment.nvim")
	use("JoosepAlviste/nvim-ts-context-commentstring")

	-- Git
	use({
		"lewis6991/gitsigns.nvim",
		config = function()
			require("gitsigns").setup()
		end,
	})
	use("sindrets/diffview.nvim")
	use("tpope/vim-fugitive")

	-- Utils
	use("lewis6991/impatient.nvim")
	use("goolord/alpha-nvim")
	use("phaazon/hop.nvim")
	use("lukas-reineke/indent-blankline.nvim")
	use("ethanholz/nvim-lastplace")
	use("abecodes/tabout.nvim")
	use({
		"max397574/better-escape.nvim",
		config = function()
			require("better_escape").setup()
		end,
	})
	use({
		"kylechui/nvim-surround",
		config = function()
			require("nvim-surround").setup()
		end,
	})
	use("ellisonleao/glow.nvim")
	use("famiu/bufdelete.nvim")

	-- LSP
	use("williamboman/mason.nvim")
	use("williamboman/mason-lspconfig.nvim")
	use("neovim/nvim-lspconfig")
	use("b0o/schemastore.nvim")
	use("jose-elias-alvarez/typescript.nvim")
	use("jayp0521/mason-null-ls.nvim")
	use("WhoIsSethDaniel/mason-tool-installer.nvim")
	use("jose-elias-alvarez/null-ls.nvim")
	use("ray-x/lsp_signature.nvim")
	use({
		"https://git.sr.ht/~whynothugo/lsp_lines.nvim",
		config = function()
			require("lsp_lines").setup()
		end,
	})

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
