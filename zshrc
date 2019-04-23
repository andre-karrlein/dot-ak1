# Path to your oh-my-zsh installation.
# LINUX
export VISUAL=nvim
export EDITOR="$VISUAL"
alias uinfo="cat /run/motd.dynamic"
export ZSH=/root/.oh-my-zsh

DEFAULT_USER=root

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="robbyrussell"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  zsh-autosuggestions
  git
  composer
  docker
  jira
  tmux
)

source $ZSH/oh-my-zsh.sh

# User configuration

alias tmuxa="tmux attach -t"
alias tmuxl="tmux list-session"
alias tmuxn="tmux new -s"
alias zshconfig="vim ~/.zshrc"
alias ll="ls -lah"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/root/google-cloud-sdk/path.zsh.inc' ]; then . '/root/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.                                                                                                                
if [ -f '/root/google-cloud-sdk/completion.zsh.inc' ]; then . '/root/google-cloud-sdk/completion.zsh.inc'; fi