return {
  {
    'nvim-treesitter/nvim-treesitter',
    version = false, -- last release is way too old and doesn't work on Windows
    build = ':TSUpdate',
    lazy = false,
    event = { 'BufReadPost', 'BufNewFile' },
    dependencies = {
      'nvim-treesitter/nvim-treesitter-textobjects',
      'nvim-treesitter/playground',
    },
    opts = {
      auto_install = true,
      highlight = { enable = true },
      indent = { enable = true },
      autopairs = {
        enable = false,
      },
      endwise = {
        enable = false,
      },
      autotag = {
        enable = false,
      },
      ensure_installed = {
        'bash',
        'c',
        'html',
        'javascript',
        'json',
        'lua',
        'markdown',
        'ruby',
        'rust',
        'scss',
        'markdown_inline',
        'luadoc',
        'luap',
        'markdown',
        'markdown_inline',
        'dockerfile',
        'jsdoc',
        'python',
        'query',
        'regex',
        'tsx',
        'typescript',
        'vim',
        'vimdoc',
        'ssh_config',
        'r',
        'sql',
        'yaml',
        'bash',
        'html',
        'gitcommit',
      },
      match = {
        enable = true,
      },
      -- rainbow = { enable = true, extended_mode = false },
      refactor = { highlight_definitions = { enable = true } },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<C-space>',
          node_incremental = '<C-space>',
          scope_incremental = false,
          node_decremental = '<bs>',
        },
      },
    },
    ---@param opts TSConfig
    config = function(_, opts)
      if type(opts.ensure_installed) == 'table' then
        ---@type table<string, boolean>
        local added = {}
        opts.ensure_installed = vim.tbl_filter(function(lang)
          if added[lang] then
            return false
          end
          added[lang] = true
          return true
        end, opts.ensure_installed)
      end
      require('nvim-treesitter.configs').setup(opts)
    end,
  },
  {
    'JoosepAlviste/nvim-ts-context-commentstring',
    lazy = true,
  },
}
