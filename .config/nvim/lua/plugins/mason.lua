return {
  'williamboman/mason.nvim',
  lazy = false,
  cmd = { 'Mason', 'MasonInstall', 'MasonInstallAll', 'MasonUninstall', 'MasonUninstallAll', 'MasonLog' },
  dependencies = {
    'williamboman/mason-lspconfig.nvim',
    'WhoIsSethDaniel/mason-tool-installer.nvim',
  },
  keys = { { '<leader>cm', '<cmd>Mason<cr>', desc = 'Mason' } },
  build = ':MasonUpdate',
  config = function()
    local mason = require('mason')
    local mason_lspconfig = require('mason-lspconfig')
    local mason_tool_installer = require('mason-tool-installer')
    mason.setup({
      ui = {
        icons = {
          package_installed = '✓',
          package_pending = '➜',
          package_uninstalled = '✗',
        },
      },
    })
    mason_lspconfig.setup({
      ensure_installed = {
        'bashls', -- bash, sh, zsh
        'pyright', -- python
        'rust_analyzer', -- rust lacks linter
        'yamlls', -- yaml
      },
      automatic_installation = true, -- not the same as ensure_installed
    })
    mason_tool_installer.setup({
      automatic_installation = true, -- not the same as ensure_installed
      ensure_installed = {
        'lua-language-server',
        'black', -- python format
        'isort', -- python format
        'prettierd', -- yaml format
        'pylint', -- python lint
        'selene', -- lua lint
        'shellcheck', -- bash, sh, zsh lint
        'shfmt', -- bash, sh, zsh format
        'yamllint', -- yaml lint
        'eslint_d',
        'prettier',
        'prettierd',
        'eslint',
        'stylelint',
        'sqlls',
      },
    })
  end,
}
