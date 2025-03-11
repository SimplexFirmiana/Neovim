-- load defaults i.e lua_lsp
require("nvchad.configs.lspconfig").defaults()

local lspconfig = require "lspconfig"

local servers = { "clangd", "cssls", "cmake", "neocmake", "lua_ls", "rust_analyzer" }
local nvlsp = require "nvchad.configs.lspconfig"

for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = nvlsp.on_attach,
    on_init = nvlsp.on_init,
    capabilities = nvlsp.capabilities,
  }
end

lspconfig.clangd.setup {
  on_attach = nvlsp.on_attach,
  -- on_init = nvlsp.on_init,
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


