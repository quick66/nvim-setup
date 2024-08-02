local opt = vim.opt

-- UI
opt.mouse = 'a' -- Enable mouse
opt.number = true -- Show line numbers
opt.completeopt = 'menuone,noinsert,noselect' -- Insert mode completions
--opt.clipboard = 'unnamedplus' -- Use system clipboard
vim.cmd [[autocmd BufEnter * set fo-=c fo-=r fo-=o]] -- No autocomment lines after <CR>
vim.opt_global.shortmess:remove('F') -- TODO do I really need it?

-- Color
opt.syntax = 'on' -- Enable syntax highlight
opt.termguicolors = true -- 24-bit colors in terminal

-- Tabs
opt.softtabstop = 2 -- Tab width in spaces
opt.expandtab = true -- Replace tabs with spaces

-- Indentation
opt.smartindent = true -- Smart indentation
opt.shiftwidth = 2 -- Indentation width

-- LSP basic
vim.api.nvim_buf_set_option(0, 'omnifunc', 'v:lua.vim.lsp.omnifunc')

