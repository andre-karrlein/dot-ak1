# Path to your oh-my-zsh installation.
# LINUX
export VISUAL=vim
export EDITOR="$VISUAL"
export ZSH=/home/andre/.oh-my-zsh
alias nvim="docker run --rm -it -v $(pwd):/code karrlein/neovim && clear"
alias uinfo="cat /run/motd.dynamic"
# MAC
#export ZSH=/Users/a.karrlein/.oh-my-zsh

DEFAULT_USER=a.karrlein

# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="powerlevel9k/powerlevel9k"

POWERLEVEL9K_MODE='awesome-patched'
POWERLEVEL9K_SHORTEN_DIR_LENGTH=3
POWERLEVEL9K_SHORTEN_STRATEGY="truncate_middle"
POWERLEVEL9K_STATUS_VERBOSE=false
POWERLEVEL9K_LEFT_PROMPT_ELEMENTS=(os_icon ram load dir dir_writable vcs)
POWERLEVEL9K_RIGHT_PROMPT_ELEMENTS=(status background_jobs command_execution_time)
POWERLEVEL9K_SHOW_CHANGESET=true
POWERLEVEL9K_CHANGESET_HASH_LENGTH=6
POWERLEVEL9K_TIME_FORMAT="%D{%H:%M \uE868  %d.%m.%y}"
POWERLEVEL9K_VCS_GIT_ICON='\uE1AA'
POWERLEVEL9K_VCS_GIT_GITHUB_ICON='\uE1AA'
POWERLEVEL9K_BATTERY_LOW_BACKGROUND="black"
POWERLEVEL9K_BATTERY_CHARGING_BACKGROUND="black"
POWERLEVEL9K_BATTERY_CHARGED_BACKGROUND="black"
POWERLEVEL9K_BATTERY_DISCONNECTED_BACKGROUND="black"
POWERLEVEL9K_BATTERY_LOW_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGING_FOREGROUND="249"
POWERLEVEL9K_BATTERY_CHARGED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_DISCONNECTED_FOREGROUND="249"
POWERLEVEL9K_BATTERY_LOW_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_BATTERY_CHARGING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_BATTERY_CHARGED_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_BATTERY_DISCONNECTED_VISUAL_IDENTIFIER_COLOR="249"
POWERLEVEL9K_LOAD_CRITICAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_WARNING_BACKGROUND="black"
POWERLEVEL9K_LOAD_NORMAL_BACKGROUND="black"
POWERLEVEL9K_LOAD_CRITICAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_WARNING_FOREGROUND="249"
POWERLEVEL9K_LOAD_NORMAL_FOREGROUND="249"
POWERLEVEL9K_LOAD_CRITICAL_VISUAL_IDENTIFIER_COLOR="red"
POWERLEVEL9K_LOAD_WARNING_VISUAL_IDENTIFIER_COLOR="yellow"
POWERLEVEL9K_LOAD_NORMAL_VISUAL_IDENTIFIER_COLOR="green"
POWERLEVEL9K_RAM_BACKGROUND="black"
POWERLEVEL9K_RAM_FOREGROUND="249"
POWERLEVEL9K_RAM_ELEMENTS=(ram_free)

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
alias mactags="ctags -f php.tags --language-force=PHP -R"
alias linuxtags="ctags-exuberant -f php.tags --language-force=PHP -R"
alias ll="ls -lah"
alias vimconf="vim ~/.vimrc"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/andre/google-cloud-sdk/path.zsh.inc' ]; then . '/home/andre/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/andre/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/andre/google-cloud-sdk/completion.zsh.inc'; fi
