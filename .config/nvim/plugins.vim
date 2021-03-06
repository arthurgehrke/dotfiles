filetype plugin indent on

call plug#begin()
  Plug 'kyazdani42/nvim-tree.lua'
  Plug 'kyazdani42/nvim-web-devicons'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'vim-airline/vim-airline'
  Plug 'vim-airline/vim-airline-themes'

  Plug 'folke/lsp-colors.nvim'
  Plug 'morhetz/gruvbox'

  " Plug 'glepnir/dashboard-nvim'
  Plug 'mhinz/vim-startify'

  Plug 'moll/vim-bbye'

  Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
  Plug 'junegunn/fzf.vim'
  Plug 'nvim-lua/plenary.nvim'
  Plug 'junegunn/vim-peekaboo'
  Plug 'lukas-reineke/indent-blankline.nvim'
  Plug 'raimondi/delimitmate'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-commentary'
  Plug 'bkad/camelcasemotion'

  Plug 'jdhao/better-escape.vim'

  Plug 'lewis6991/gitsigns.nvim'
  Plug 'rhysd/git-messenger.vim'

  Plug 'nvim-lua/popup.nvim'
  Plug 'folke/trouble.nvim'
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
  Plug 'dense-analysis/ale'
  Plug 'galooshi/vim-import-js'
  Plug 'MaxMEllon/vim-jsx-pretty'
  Plug 'vim-scripts/lastpos.vim'

  Plug 'haya14busa/is.vim'
  Plug 'haya14busa/incsearch.vim'
  Plug 'WhoIsSethDaniel/toggle-lsp-diagnostics.nvim'
  Plug 'neovim/nvim-lspconfig'
  Plug 'williamboman/nvim-lsp-installer'
call plug#end()

source $HOME/.config/nvim/plugconf/vimcommentary.vim
source $HOME/.config/nvim/plugconf/lsp.vim
source $HOME/.config/nvim/plugconf/lsp_config.vim
source $HOME/.config/nvim/plugconf/nvim_lsp_installer.vim
source $HOME/.config/nvim/plugconf/toggle_lsp_diagnostics.vim
source $HOME/.config/nvim/plugconf/trouble.vim
source $HOME/.config/nvim/plugconf/nvim_treesitter.vim
source $HOME/.config/nvim/plugconf/gitsigns.vim
source $HOME/.config/nvim/plugconf/lualine.vim
source $HOME/.config/nvim/plugconf/airline.vim
source $HOME/.config/nvim/plugconf/indent_blankline.vim
source $HOME/.config/nvim/plugconf/nvim_tree.vim
source $HOME/.config/nvim/plugconf/better_scape.vim
source $HOME/.config/nvim/plugconf/fzf.vim
source $HOME/.config/nvim/plugconf/camel_case_motion.vim
source $HOME/.config/nvim/plugconf/git_messenger.vim
source $HOME/.config/nvim/plugconf/fugitive.vim
source $HOME/.config/nvim/plugconf/incsearch.vim
source $HOME/.config/nvim/plugconf/ale.vim
source $HOME/.config/nvim/plugconf/vim_import_js.vim
