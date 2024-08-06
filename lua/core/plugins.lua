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

use({ 'nanotech/jellybeans.vim' })  
use('nvim-treesitter/nvim-treesitter', {run= ':TSUpdate'})
use{'VonHeikemen/lsp-zero.nvim', branch = 'v4.x'}
---LSP Supporrt
use{'neovim/nvim-lspconfig'}
use{'hrsh7th/cmp-nvim-lsp'}
use{'hrsh7th/nvim-cmp'}
use {
    "williamboman/mason.nvim"
}
use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
}
---Auto-completion
if packer_bootstrap then
    require('packer').sync()
  end
end)
