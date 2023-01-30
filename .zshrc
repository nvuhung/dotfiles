# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# zmodload zsh/zprof

export NVM_LAZY_LOAD=true
DISABLE_MAGIC_FUNCTIONS=true
# Path to your oh-my-zsh installation.
export ZSH="$HOME/.oh-my-zsh"

# Plugins
plugins=(
  git
  zsh-completions
  # tmux
  autojump
  git-open
  fast-syntax-highlighting
  zsh-nvm
  # docker
  # docker-compose
  # colorize
  # osx
)
source $ZSH/oh-my-zsh.sh

### Fix slowness of pastes with zsh-syntax-highlighting.zsh
# https://github.com/zsh-users/zsh-autosuggestions/issues/238
pasteinit() {
  OLD_SELF_INSERT=${${(s.:.)widgets[self-insert]}[2,3]}
  zle -N self-insert url-quote-magic # I wonder if you'd need `.url-quote-magic`?
}

pastefinish() {
  zle -N self-insert $OLD_SELF_INSERT
}
zstyle :bracketed-paste-magic paste-init pasteinit
zstyle :bracketed-paste-magic paste-finish pastefinish
### Fix slowness of pastes


# Load config
DEFAULT_USER="$(whoami)"
source ~/.bash_profile
source ~/.zsh/zsh-autosuggestions/zsh-autosuggestions.zsh
# fpath+=($ZSH/plugins/docker)
autoload -U compinit && (compinit &; compinit -C)

# Search files
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"

# Theme
eval "$(starship init zsh)"

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"
