# My binaries
  export PATH=$PATH:$HOME/bin/

# Path Ruby binaries
# export PATH=$PATH:$HOME/.rubies/ruby-2.5.1/bin
# export PATH="/usr/local/opt/ruby/bin:/usr/local/lib/ruby/gems/3.0.0/bin:/Users/alejandro/.gem/ruby/3.0.0/bin:$PATH"

# Path go binaries
#  export PATH=$PATH:$HOME/bin/programs/go/bin
#  export GOPATH=$HOME/go/

# Path to binaries installed by python & aws-cli for linux
#  export PATH=$PATH:$HOME/.local/bin

# Path to binaries installed by python via Homebrew for MacOs
HOMEBREW_PYTHON_PATH=$(brew --prefix python)/libexec/bin
export PATH=$PATH:$HOMEBREW_PYTHON_PATH

 # Add Elasticbeanstalk binraries to PATH. Used eb to deploy the Pursuit-gong app to aws
export PATH=$PATH:$HOME/.ebcli-virtual-env/executables

# Path to ESP32 Tools 
  #Toolchain 
#  export PATH=$PATH:$HOME/alejo/ESP32/toolchain/xtensa-esp32-elf/bin
  #IoT Development Framework
#  export IDF_PATH=$HOME/alejo/ESP32/esp-idf
#

# Volta (for nodejs and yarn binaries)
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# Add Postgres binaries to path
export PATH=$PATH:/Applications/Postgres.app/Contents/Versions/latest/bin

 #Path to your oh-my-zsh installation.
  export ZSH=$HOME/.oh-my-zsh

# Set my favorite editor
  export EDITOR=vim

# Needed to set this because oh-my-zsh was complaining on mac about insecure completion-dependent directories detected
  export ZSH_DISABLE_COMPFIX=true

# Make Zsh behave as vim 
bindkey -v
# Set name of the theme to load. Optionally, if you set this to "random"
# it'll load a random theme each time that oh-my-zsh is loaded.
# See https://github.com/robbyrussell/oh-my-zsh/wiki/Themes
ZSH_THEME="amuse-alejo"

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion. Case
# sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/export VOLTA_HOME="$HOME/.volta"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(git z colored-man-pages zsh-completions)
autoload -U compinit && compinit

source $ZSH/oh-my-zsh.sh

# Enable aws-cli autocomplete 
#source $HOME/.local/bin/aws_zsh_completer.sh

# User configuration

# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/rsa_id"

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias ns="npm start"
alias ys="yarn start"
alias nsd="npm run start:dev"
alias nt="npm test"
alias yda="yarn dev:app" # Run flowcode app in development
alias chrome="/Applications/Google\ Chrome.app/Contents/MacOS/Google\ Chrome"
alias flow_clean="cd ~/code/flow && rm -rf apps/app/.next" 
alias flow_clean_and_install="flow_clean && rm -rf node_modules && yarn install"

# Functions (to avoid quotes scape hoops)
git_status_ls() {
  git status -s | awk '{if ($1 != "D") print $2}'
}

# Startup scripts
#sh ~/dotfiles/startup/vscode_settings.sh #Keep my vscode setting on Mac at 42

#export NVM_DIR="$HOME/.nvm" Skip, trying out Volta
#[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
#[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

# Enable Volta 
export VOLTA_HOME="$HOME/.volta"
export PATH="$VOLTA_HOME/bin:$PATH"

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/alejandrofranco/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/Users/alejandrofranco/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/Users/alejandrofranco/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/Users/alejandrofranco/Downloads/google-cloud-sdk/completion.zsh.inc'; fi
