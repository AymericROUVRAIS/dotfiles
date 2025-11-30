# Path to your oh-my-zsh installation
export ZSH="$HOME/.oh-my-zsh"

# Theme (you can change to agnoster, avit, ys, etc.)
ZSH_THEME="custom"

# Plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# Load Oh My Zsh
source $ZSH/oh-my-zsh.sh

# Enable autosuggestions in grey
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=8'

# History settings
HISTFILE=~/.zsh_history
HISTSIZE=10000
SAVEHIST=10000
setopt HIST_IGNORE_ALL_DUPS
setopt HIST_FIND_NO_DUPS
setopt SHARE_HISTORY
bindkey '^R' history-incremental-search-backward

# Basic bash-like key bindings
bindkey -e                          # Emacs key bindings (Bash-like)
autoload -Uz up-line-or-search     # Enable history search like Bash
autoload -Uz down-line-or-search
zle -N up-line-or-search
zle -N down-line-or-search
bindkey '^[[A' up-line-or-search   # Up arrow
bindkey '^[[B' down-line-or-search # Down arrow

# Fix common keybindings for Home/End/Delete/etc
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[3~' delete-char
bindkey '^[[1~' beginning-of-line
bindkey '^[[4~' end-of-line

# Optional: LS colors
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# Optional: Better grep colors
export GREP_OPTIONS='--color=auto'
export GREP_COLOR='mt-1;32'

# Source custom aliases or scripts (optional)
# source ~/.zsh_aliases

