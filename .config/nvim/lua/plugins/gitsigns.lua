return {
  'lewis6991/gitsigns.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local gitsigns = require('gitsigns')

    local function gitsigns_keymap_attach(bufnr)
      local function opts(desc)
        return { desc = 'git: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set('n', ']c', function()
        if vim.wo.diff then
          return ']c'
        end
        vim.schedule(function()
          gitsigns.next_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      vim.keymap.set('n', '[c', function()
        if vim.wo.diff then
          return '[c'
        end
        vim.schedule(function()
          gitsigns.prev_hunk()
        end)
        return '<Ignore>'
      end, { expr = true })

      -- vim.keymap.set('n', '[c', '<cmd>Gitsigns prev_hunk<CR>', opts('Stage Hunk'))
      -- vim.keymap.set('n', ']c', '<cmd>Gitsigns next_hunk<CR>', opts('Stage Hunk'))

      vim.keymap.set('n', '<space>hr', '<cmd>Gitsigns reset_hunk<CR>', opts('Reset Hunk'))
      vim.keymap.set('n', '<space>hR', '<cmd>Gitsigns reset_buffer<CR>', opts('Reset Buffer'))
      vim.keymap.set('n', '<space>hp', '<cmd>Gitsigns preview_hunk<CR>', opts('Preview Hunk'))
      vim.keymap.set('n', '<space>hb', '<cmd>lua require"gitsigns".blame_line{full=true}<CR>', opts('Blame Line'))
      vim.keymap.set('n', '<space>hs', '<cmd>Gitsigns stage_hunk<CR>', opts('Stage Hunk'))
      vim.keymap.set('n', '<space>hS', '<cmd>Gitsigns stage_buffer<CR>', opts('Stage Buffer'))
      vim.keymap.set('n', '<space>hU', '<cmd>Gitsigns reset_buffer_index<CR>', opts('Reset Buffer Index'))
      vim.keymap.set('n', '<space>hu', '<cmd>Gitsigns undo_stage_hunk<CR>', opts('Undo Staging Hunk'))

      vim.keymap.set('v', '<space>hsr', ':Gitsigns reset_hunk<CR>', opts('ResetHunk (Visual)'))
      vim.keymap.set('v', '<space>hss', ':Gitsigns stage_hunk<CR>', opts('StageHunk (Visual)'))
      vim.keymap.set('n', '<leader>gd', gitsigns.diffthis)
      vim.keymap.set('n', '<leader>gD', function()
        gitsigns.diffthis('~')
      end)
    end

    gitsigns.setup({
      signs = {
        add = { hl = 'GitSignsAdd', text = '│', numhl = 'GitSignsAddNr', linehl = 'GitSignsAddLn' },
        change = { hl = 'GitSignsChange', text = '│', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
        delete = { hl = 'GitSignsDelete', text = '_', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        topdelete = { hl = 'GitSignsDelete', text = '‾', numhl = 'GitSignsDeleteNr', linehl = 'GitSignsDeleteLn' },
        changedelete = { hl = 'GitSignsChange', text = '~', numhl = 'GitSignsChangeNr', linehl = 'GitSignsChangeLn' },
      },
      attach_to_untracked = true,
      signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
      numhl = false,     -- Toggle with `:Gitsigns toggle_numhl`
      linehl = false,    -- Toggle with `:Gitsigns toggle_linehl`
      word_diff = true,  -- Toggle with `:Gitsigns toggle_word_diff`
      -- sign_priority = 6,
      sign_priority = 100,
      current_line_blame_formatter = '<author>, <author_time:%Y-%m-%d> - <summary>',
      watch_gitdir = {
        interval = 1000,
        follow_files = true,
      },
      current_line_blame = false, -- Toggle with `:Gitsigns toggle_current_line_blame`
      current_line_blame_opts = {
        virt_text = true,
        virt_text_pos = 'eol', -- 'eol' | 'overlay' | 'right_align'
        delay = 1000,
        ignore_whitespace = false,
      },
      current_line_blame_formatter_opts = {
        relative_time = false,
      },
      update_debounce = 100,
      status_formatter = nil, -- Use default
      max_file_length = 40000,
      preview_config = {
        border = 'single',
        style = 'minimal',
        relative = 'cursor',
        row = 0,
        col = 1,
      },
      yadm = {
        enable = false,
      },
      on_attach = gitsigns_keymap_attach,
    })
  end,
}
