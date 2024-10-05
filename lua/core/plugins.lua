local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
use 'wbthomason/packer.nvim'
use {
			  'nvim-telescope/telescope.nvim', tag = '0.1.8',
	-- or                            , branch = '0.1.x',
	  requires = { {'nvim-lua/plenary.nvim'} }
	}

use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
use{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}
---LSP Supporrt
use{'hrsh7th/cmp-nvim-lsp'}
use{'hrsh7th/nvim-cmp'}
use {
  'nvim-tree/nvim-tree.lua',
  requires = {
    'nvim-tree/nvim-web-devicons',  
  },
}
use { "catppuccin/nvim", as = "catppuccin" }
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
use {'freddiehaddad/feline.nvim'}
use({
	"L3MON4D3/LuaSnip",
	-- follow latest release.
	tag = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
	-- install jsregexp (optional!:).
	build = "make install_jsregexp"
})
use { 'saadparwaiz1/cmp_luasnip' }
use 'nvim-tree/nvim-web-devicons'
use 'lewis6991/gitsigns.nvim' 
use 'romgrk/barbar.nvim'
use {'lervag/vimtex'}
use {  'nvim-lualine/lualine.nvim',
  requires = { 'nvim-tree/nvim-web-devicons', opt = true }}

use{"tpope/vim-dadbod",
    "kristijanhusak/vim-dadbod-completion",
    "kristijanhusak/vim-dadbod-ui"}


use {
'glepnir/dashboard-nvim',
requires = { 'nvim-tree/nvim-web-devicons' }
}    
use 'm4xshen/autoclose.nvim'
if packer_bootstrap then
    require('packer').sync()
  end
end)
