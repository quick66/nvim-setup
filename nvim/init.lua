-- Enable mouse
vim.opt_global.mouse = 'a'

-- Enable syntax highlight
vim.opt_global.syntax = 'on'

-- More colors
vim.opt_global.termguicolors = true

-- 2-space over tab
vim.opt_global.tabstop = 2
vim.opt_global.softtabstop = 2
vim.opt_global.shiftwidth = 2

-- Enable packer package management
vim.cmd('packadd packer.nvim')
require('packer').startup(function(use)
  -- self-update
  use { 'wbthomason/packer.nvim', opt = true }
  -- plugin list:
  use {'scalameta/nvim-metals', tag = 'v0.7.x', requires = { "nvim-lua/plenary.nvim" }}
end)

-- nvim-metals plugin configuration
metals_config = require("metals").bare_config()
metals_config.init_options.statusBarProvider = "on"
vim.opt_global.shortmess:remove("F")
local nvim_metals_group = vim.api.nvim_create_augroup("nvim-metals", { clear = true })
vim.api.nvim_create_autocmd("FileType", {
  pattern = { "scala", "sbt", "java" },
  callback = function()
    require("metals").initialize_or_attach(metals_config)
  end,
  group = nvim_metals_group,
})

