-- Enable packer package management
local ensure_packer = function()
  local packer_path = vim.fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
  if not vim.loop.fs_stat(packer_path) then
    vim.fn.system({
      'git', 'clone',
      '--depth', '1',
      'https://github.com/wbthomason/packer.nvim',
      packer_path,
    })
    vim.cmd [[ packadd packer.nvim ]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

require('packer').startup(function(use)
  -- self-update
  use { 'wbthomason/packer.nvim', opt = true }
  -- plugin list:
  use {
    'scalameta/nvim-metals', tag = 'v0.9.x',
    requires = { 'nvim-lua/plenary.nvim' },
    config = function() require('plugins/nvim-metals').setup() end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('settings')
require('keys')

