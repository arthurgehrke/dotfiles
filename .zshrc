#!/usr/bin/env zsh
##############################################################################
# Source's
##############################################################################
export DOTFILES=$HOME/dotfiles
export INCLUDES=$HOME/.local/share/dotfiles

source $INCLUDES/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
source $INCLUDES/zsh-completions/zsh-completions.plugin.zsh
source $INCLUDES/zsh-history-substring-search/zsh-history-substring-search.zsh
source $INCLUDES/zsh-autosuggestions/zsh-autosuggestions.zsh

source $INCLUDES/powerlevel10k/powerlevel10k.zsh-theme

source $HOME/.themes/zsh/.p10k.zsh
source $INCLUDES/nvm/nvm.sh
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion
autoload -U add-zsh-hook

load-nvmrc() {
  local node_version="$(nvm version)"
  local nvmrc_path="$(nvm_find_nvmrc)"

  if [ -n "$nvmrc_path" ]; then
    local nvmrc_node_version=$(nvm version "$(cat "${nvmrc_path}")")

    if [ "$nvmrc_node_version" = "N/A" ]; then
      nvm install
    elif [ "$nvmrc_node_version" != "$node_version" ]; then
      nvm use
    fi
  elif [ "$node_version" != "$(nvm version default)" ]; then
    echo "Reverting to nvm default version"
    nvm use default
  fi
}

add-zsh-hook chpwd load-nvmrc
load-nvmrc
source $INCLUDES/z/z.sh

# Plugins configs
source $HOME/zshrc/completions.zsh
source $HOME/zshrc/autosuggestions.zsh

source $HOME/.shell_aliases
source $HOME/.shell_scripts

source $HOME/.fzf.zsh
source $HOME/.fzf-functions.zsh

##############################################################################
# MacOs
##############################################################################
export PATH="/opt/homebrew/bin:$PATH" 

# set PATH so it includes user's private bin if it exists
if [ -d "$HOME/bin" ] ; then
  PATH="$HOME/bin:$PATH"
fi

# Setting PATH for Python 3
# The original version is saved in .bash_profile.pysave
eval "$(pyenv init -)"

#export PATH
alias python='python3'
alias py='python3'

if [[ "$TERM" == "tmux-256color" ]]; then
  export TERM=screen-256color
fi

# npm global
export NPM_PACKAGES="/usr/local/npm_packages"
export NODE_PATH="$NPM_PACKAGES/lib/node_modules:$NODE_PATH"
export PATH="$NPM_PACKAGES/bin:$PATH"

# prefer US English & utf-8
export LC_ALL="en_US.UTF-8"
export LANG="en_US"

##############################################################################
# Configs
##############################################################################
DISABLE_AUTO_UPDATE="true"
DISABLE_MAGIC_FUNCTIONS=true
EDITOR=nvim

autoload -U colors
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# brew install coreutils
# colors for ls
if [[ -f ~/.dircolors ]] ; then
  eval $(gdircolors -b ~/.dircolors)
elif [[ -f /etc/DIR_COLORS ]] ; then
  eval $(gdircolors -b /etc/DIR_COLORS)
fi

setopt no_nomatch                # Don't error when there's nothing to glob, leave it unchanged
##############################################################################
# History
##############################################################################
HISTFILE=$HOME/.zsh_history
HISTSIZE=5000
SAVEHIST=5000
HISTFILESIZE=2000
DIRSTACKSIZE=8

setopt EXTENDED_HISTORY          # Write the history file in the ':start:elapsed;command' format.
setopt SHARE_HISTORY             # Share history between all sessions.
setopt HIST_EXPIRE_DUPS_FIRST    # Expire a duplicate event first when trimming history.
setopt HIST_IGNORE_DUPS          # Do not record an event that was just recorded again.
setopt HIST_IGNORE_ALL_DUPS      # Delete an old recorded event if a new event is a duplicate.
# setopt HIST_FIND_NO_DUPS         # Do not display a previously found event.
setopt HIST_IGNORE_SPACE         # Do not record an event starting with a space.
setopt HIST_SAVE_NO_DUPS         # Do not write a duplicate event to the history file.
setopt HIST_VERIFY               # Do not execute immediately upon history expansion.

##############################################################################
# Navigation
##############################################################################
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

##############################################################################
# SSH
# brew install keychain
if hash keychain 2>/dev/null; then
  alias ssh-agent-start='eval `keychain --eval --agents ssh --inherit any github-arthur gitlab-arthur`'
  alias ssh-agent-stop='keychain --stop all'
fi

##############################################################################
setopt AUTO_CD              # Go to folder path without using cd.

setopt AUTO_PUSHD           # Push the old directory onto the stack on cd.
setopt PUSHD_IGNORE_DUPS    # Do not store duplicates in the stack.
setopt PUSHD_SILENT         # Do not print the directory stack after pushd or popd.

setopt CORRECT              # Spelling correction
setopt CDABLE_VARS          # Change directory to a path stored in a variable.
setopt EXTENDED_GLOB        # Use extended globbing syntax.

##############################################################################
# Completion
##############################################################################
zmodload zsh/complist
bindkey '^[[Z' reverse-menu-complete
# bindkey '^I' menu-complete
# bindkey '^I'   complete-word       # tab          | complete

# zstyle ':completion:*' insert-tab true

##############################################################################
# KeyMappings
##############################################################################
## zsh-autosuggestions
# use ctrl+T to toggle autosuggestions
bindkey '^T' autosuggest-toggle

# accept the suggested words
# bindkey '^I' autosuggest-accept # with tab
bindkey '^o' autosuggest-accept

## history-substring-search
# Control-P/N keys
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

##############################################################################
# Bindings
##############################################################################
# change Ctrl+C to Ctrl+Q
stty intr '^d'
stty erase '^?'

##############################################################################
# Various
##############################################################################
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
