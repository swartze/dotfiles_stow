local config = require("plugins.configs.lspconfig")

local on_attach = config.on_attach
local capabilities = config.capabilities
local util = require("lspconfig/util")

local lspconfig = require("lspconfig")

lspconfig.pyright.setup({
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"python"},
})

lspconfig.gopls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  cmd = {"gopls"},
  filetypes = {"go", "gomod", "gowork", "gotmpl"},
  root_dir = util.root_pattern("go.work", "go.mod", ".git"),
  settings = {
    gopls = {
      completeUnimported = true,
      usePlaceholders = true,
      analyses = {
        unusedparams = true,
      },
    },
  },
}


lspconfig.terraformls.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  flags = { debounce_text_changes = 150 },
  filetypes = {"terraform", "terraform-vars", "tf"},
  root_dir = function(dirpath)
  return util.root_pattern(".terraform", ".git")(dirpath) or util.path.dirname(dirpath)
  end,
}

lspconfig.tflint.setup{
  on_attach = on_attach,
  capabilities = capabilities,
  filetypes = {"terraform", "terraform-vars", "tf"},
  root_dir = function(dirpath)
  return util.root_pattern(".terraform", ".git")(dirpath) or util.path.dirname(dirpath)
  end,
}
