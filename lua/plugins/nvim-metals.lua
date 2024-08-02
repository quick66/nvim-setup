function setup()
  metals_config = require('metals').bare_config()
  metals_config.init_options.statusBarProvider = 'on'
  metals_config.settings = {
    showImplicitArguments = true
  }
  metals_config.on_attach = function(client, buffer)
    vim.keymap.set("n", "<leader>ws", function() require("metals").hover_worksheet() end) -- expands long outputs of worksheet in hover
  end
  
  local nvim_metals_group = vim.api.nvim_create_augroup('nvim-metals', { clear = true })
  vim.api.nvim_create_autocmd('FileType', {
    pattern = { 'scala', 'sbt', 'java' },
    callback = function() require('metals').initialize_or_attach(metals_config) end,
    group = nvim_metals_group,
  })
end

return {
  setup = setup
}
