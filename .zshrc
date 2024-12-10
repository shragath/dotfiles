if [ -d "$HOME/ltex-ls-15.2.0" ] ; then
  export PATH="$PATH:$HOME/ltex-ls-15.2.0/bin"
fi
if [ -d "/usr/local/texlive/2022/bin" ] ; then
  export PATH="/usr/local/texlive/2022/bin/x86_64-linux:$PATH"
  # export MANPATH="/usr/local/texlive/2022/texmf-dist/doc/man:$MANPATH"
  export INFOPATH="/usr/local/texlive/2022/texmf-dist/doc/info:$INFOPATH"
fi

# Android Debug Bridge (adb)
if [ -d "$HOME/adb-fastboot/platform-tools" ] ; then
 export PATH="$HOME/adb-fastboot/platform-tools:$PATH"
fi
# If you come from bash you might have to change your $PATH.
# export PATH=$HOME/bin:/usr/local/bin:$PATH

# Path to your oh-my-zsh installation.
  export ZSH="/home/shragath/.oh-my-zsh"

# Path to dotnet tools
if [ -d "$HOME/.dotnet/tools" ] ; then
  export PATH="$PATH:$HOME/.dotnet/tools"
fi

# Path to go
if [ -d "$HOME/.local/go/bin" ] ; then
  export PATH="$PATH:$HOME/.local/go/bin"
fi
if [ -d "$HOME/go/bin" ] ; then
  export PATH="$PATH:$HOME/go/bin"
fi

# Path to Matlab
if [ -d "$HOME/MATLAB/R2022b/bin" ] ; then
  export PATH="$PATH:$HOME/MATLAB/R2022b/bin"
fi

# Blender
if [ -d "$HOME/.local/blender-3.3.0-linux-x64" ] ; then
  export PATH="$HOME/.local/blender-3.3.0-linux-x64/:$PATH"
fi

# Path to Python pyenv
export PYENV_ROOT="$HOME/.pyenv"
command -v pyenv >/dev/null || export PATH="$PYENV_ROOT/bin:$PATH"
eval "$(pyenv init -)"

export PATH=~/.npm-global/bin:$PATH
# Node Version Manager path

# Set name of the theme to load --- if set to "random", it will
# load a random theme each time oh-my-zsh is loaded, in which case,
# to know which specific one was loaded, run: echo $RANDOM_THEME
# See https://github.com/ohmyzsh/ohmyzsh/wiki/Themes
# ZSH_THEME="afowler"
ZSH_THEME="robbyrussell"

# Set list of themes to pick from when loading at random
# Setting this variable when ZSH_THEME=random will cause zsh to load
# a theme from this variable instead of looking in $ZSH/themes/
# If set to an empty array, this variable will have no effect.
# ZSH_THEME_RANDOM_CANDIDATES=( "robbyrussell" "agnoster" )

# Uncomment the following line to use case-sensitive completion.
# CASE_SENSITIVE="true"

# Uncomment the following line to use hyphen-insensitive completion.
# Case-sensitive completion must be off. _ and - will be interchangeable.
# HYPHEN_INSENSITIVE="true"

# Uncomment the following line to disable bi-weekly auto-update checks.
# DISABLE_AUTO_UPDATE="true"

# Uncomment the following line to automatically update without prompting.
# DISABLE_UPDATE_PROMPT="true"

# Uncomment the following line to change how often to auto-update (in days).
# export UPDATE_ZSH_DAYS=13

# Uncomment the following line if pasting URLs and other text is messed up.
# DISABLE_MAGIC_FUNCTIONS="true"

# Uncomment the following line to disable colors in ls.
# DISABLE_LS_COLORS="true"

# Uncomment the following line to disable auto-setting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment the following line to enable command auto-correction.
# ENABLE_CORRECTION="true"

# Uncomment the following line to display red dots whilst waiting for completion.
# Caution: this setting can cause issues with multiline prompts (zsh 5.7.1 and newer seem to work)
# See https://github.com/ohmyzsh/ohmyzsh/issues/5765
# COMPLETION_WAITING_DOTS="true"

# Uncomment the following line if you want to disable marking untracked files
# under VCS as dirty. This makes repository status check for large repositories
# much, much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment the following line if you want to change the command execution time
# stamp shown in the history command output.
# You can set one of the optional three formats:
# "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# or set a custom format using the strftime function format specifications,
# see 'man strftime' for details.
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder
# source ~/.zsh/catppuccin_mocha-zsh-syntax-highlighting.zsh

# Which plugins would you like to load?
# Standard plugins can be found in $ZSH/plugins/
# Custom plugins may be added to $ZSH_CUSTOM/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
# Add wisely, as too many plugins slow down shell startup.
plugins=(
  git
  bundler
  dotenv
  macos
  rake
  rbenv
  ruby
  zsh-autosuggestions
  vi-mode
)

source $ZSH/oh-my-zsh.sh

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

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias godot='~/Dev/Godot_v3.5.1-stable_mono_x11_64/Godot_v3.5.1-stable_mono_x11.64'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias luamake=/home/shragath/lua-language-server/3rd/luamake/luamake
alias config='/usr/bin/git --git-dir=/home/shragath/.dotfiles/ --work-tree=/home/shragath'
alias vim=nvim

# Keybind
bindkey '^Y' autosuggest-accept
bindkey -v
PATH="$HOME/.local/bin/:$PATH"



[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
source <(ng completion script)
