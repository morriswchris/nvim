-- Suppress lspconfig deprecation warning
-- Add this to your init.lua if you want to hide the warning
vim.api.nvim_create_autocmd("User", {
  pattern = "LspAttach",
  callback = function()
    -- Suppress the deprecation warning
    vim.g.lspconfig_deprecation_warning = false
  end,
})
