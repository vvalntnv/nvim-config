-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
  -- Packer can manage itself
  use 'wbthomason/packer.nvim'

  use {
	  'nvim-telescope/telescope.nvim', tag = '0.1.5',
	  requires = { {'nvim-lua/plenary.nvim'} }
  }
  use 'sainnhe/everforest'
  use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})  
  use 'mbbill/undotree'
  use 'tpope/vim-fugitive'
  use {
	  'VonHeikemen/lsp-zero.nvim',
	  branch = 'v3.x',
	  requires = {
		  --- Uncomment the two plugins below if you want to manage the language servers from neovim
		  -- {'williamboman/mason.nvim'},
		  -- {'williamboman/mason-lspconfig.nvim'},

		  -- LSP Support
		  {'neovim/nvim-lspconfig'},
		  -- Autocompletion
		  {'hrsh7th/nvim-cmp'},
		  {'hrsh7th/cmp-nvim-lsp'},
		  {'L3MON4D3/LuaSnip'},
	  }
  }
  use {
    "williamboman/mason.nvim"
  }
  use "williamboman/mason-lspconfig.nvim"
  use "wakatime/vim-wakatime"
  use 'pixelneo/vim-python-docstring'
  use {
	  "gmr458/vscode_modern_theme.nvim",
	  lazy = false,
	  -- priority = 1000,
	  config = function()
		  require("vscode_modern").setup({
			  cursorline = true,
			  transparent_background = false,
			  nvim_tree_darker = true,
		  })
		  -- vim.cmd.colorscheme("vscode_modern")
	  end,
  }
  use "nvim-lua/plenary.nvim"
  use "ThePrimeagen/harpoon"
  use 'mfussenegger/nvim-dap' 
  use "rcarriga/nvim-dap-ui"
  use 'mfussenegger/nvim-dap-python'
  use {
	  'numToStr/Comment.nvim',
	  config = function()
		  require('Comment').setup()
	  end
  }
  use { "catppuccin/nvim", as = "catppuccin" }
  use 'neovim/nvim-lspconfig'
  use 'simrat39/rust-tools.nvim'

  -- Debugging
  use 'nvim-lua/plenary.nvim'
  use 'mfussenegger/nvim-dap'
  use "rebelot/kanagawa.nvim"
  use "nvim-neotest/nvim-nio" 
end)


