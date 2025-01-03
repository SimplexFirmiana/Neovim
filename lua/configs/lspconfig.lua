-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"
local servers = { "clangd", "cmake", "vimls", "bashls", "ccls", 
  "neocmake", "cssls", "lua_ls", "rust_analyzer",}
local nvlsp = require "nvchad.configs.lspconfig"

local on_init = function(client, _)
  if client.name == "clangd" then
    require("clangd_extensions.inlay_hints").setup_autocmd()
    require("clangd_extensions.inlay_hints").set_inlay_hints()
  end
end

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = on_init,
    capabilities = nvlsp.capabilities,
  }
end

-- configuring single server, example: typescript
lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  on_init = on_init,
  capabilities = nvlsp.capabilities,
  single_file_support = true,
  cmd = {
    "clangd",
    "--enable-config",
    "--background-index",
    "--pch-storage=memory",
    "--pretty",
    "--clang-tidy",
    "--all-scopes-completion",
    "--completion-style=detailed",
    "--header-insertion-decorators",
    "--header-insertion=never",
    "--limit-references=0",
    "--limit-results=0",
  }
}

lspconfig.ccls.setup{}
