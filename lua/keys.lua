local map = vim.keymap.set
local default_args = { noremap = true, silent = true }

-- Tab navigation
map('n', '<Tab>', ':tabnext<CR>', default_args)
map('n', '<S-Tab>', ':tabprev<CR>', default_args)

-- LSP mappings
map("n", "gD",  vim.lsp.buf.definition)
map("n", "K",  vim.lsp.buf.hover)
map("n", "gi", vim.lsp.buf.implementation)
map("n", "gr", vim.lsp.buf.references)
map("n", "gds", vim.lsp.buf.document_symbol)
map("n", "gws", vim.lsp.buf.workspace_symbol)
map("n", "<leader>cl", vim.lsp.codelens.run)
map("n", "<leader>sh", vim.lsp.buf.signature_help)
map("n", "<leader>rn", vim.lsp.buf.rename)
map("n", "<leader>f", vim.lsp.buf.format)
map("n", "<leader>ca", vim.lsp.buf.code_action)

-- workspace diagnostics
map("n", "<leader>aa", vim.diagnostic.setqflist)
map("n", "<leader>ae", function() vim.diagnostic.setqflist({ severity = "E" }) end)
map("n", "<leader>aw", function() vim.diagnostic.setqflist({ severity = "W" }) end)
map("n", "<leader>d", vim.diagnostic.setloclist)
map("n", "[c", function() vim.diagnostic.goto_prev({ wrap = false }) end)
map("n", "]c", function() vim.diagnostic.goto_next({ wrap = false })end)

-- Example mappings for usage with nvim-dap. If you don't use that, you can
-- skip these
--map("n", "<leader>dc", function() require("dap").continue() end)
--map("n", "<leader>dr", function() require("dap").repl.toggle() end)
--map("n", "<leader>dK", function() require("dap.ui.widgets").hover() end)
--map("n", "<leader>dt", function() require("dap").toggle_breakpoint() end)
--map("n", "<leader>dso", function() require("dap").step_over() end)
--map("n", "<leader>dsi", function() require("dap").step_into() end)
--map("n", "<leader>dl", function() require("dap").run_last() end)

