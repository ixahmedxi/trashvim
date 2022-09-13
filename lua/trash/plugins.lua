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
  use({'akinsho/bufferline.nvim', tag = "v2.*" })
  use("nvim-lualine/lualine.nvim")

  use("nvim-treesitter/nvim-treesitter")
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

  -- Git
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

	if PACKER_BOOTSTRAP then
		require("packer").sync()
	end
end)
