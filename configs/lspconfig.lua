local on_attach = require("plugins.configs.lspconfig").on_attach
local capabilities = require("plugins.configs.lspconfig").capabilities

local lspconfig = require("lspconfig")

-- if you just want default config for the servers then put them in a table
local servers = { "html", "cssls", "ts_ls", "clangd", "pyright", "eslint", "astro", "svelte" }

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup({
    on_attach = on_attach,
    capabilities = capabilities,
  })
end

-- disable semantic tokens
lspconfig.ts_ls.setup({
  on_init = function(client, _)
    if
        not require("custom.chadrc").ui.lsp_semantic_tokens
        and client.supports_method("textDocument/semanticTokens")
    then
      client.server_capabilities.semanticTokensProvider = nil
    end
  end,
})

lspconfig.rust_analyzer.setup({
  capabilities = capabilities,
  on_attach = on_attach,
  cmd = {
    "rustup", "run", "stable", "rust-analyzer"
  }
})
