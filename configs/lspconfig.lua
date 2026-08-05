local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "clangd", "pyright", "ruff", "eslint", "astro", "svelte", "rust_analyzer" }

for _, lsp in ipairs(servers) do
  vim.lsp.config(lsp, {
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- disable semantic tokens
vim.lsp.config("ts_ls", {
  on_init = function(client, _)
    if
        not require("custom.chadrc").ui.lsp_semantic_tokens
        and client:supports_method("textDocument/semanticTokens")
    then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

vim.lsp.config("rust_analyzer", {
  cmd = {
    "rustup", "run", "stable", "rust-analyzer"
  }
})

vim.lsp.enable(servers)
