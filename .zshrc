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
if command -v pyenv &> /dev/null; then
  export PYENV_ROOT="$HOME/.pyenv"
  export PATH="$PYENV_ROOT/bin:$PATH"
  eval "$(pyenv init -)"
fi

export PATH=~/.npm-global/bin:$PATH
# Node Version Manager path

# Set name of the theme to load
ZSH_THEME="robbyrussell"

# Plugins
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
export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
export EDITOR='vim'

# Set personal aliases, overriding those provided by oh-my-zsh libs,
# plugins, and themes. Aliases can be placed here, though oh-my-zsh
# users are encouraged to define aliases within the ZSH_CUSTOM folder.
# For a full list of active aliases, run `alias`.
#
# Example aliases
alias sail='[ -f sail ] && sh sail || sh vendor/bin/sail'
alias godot='~/Dev/Godot_v3.5.1-stable_mono_x11_64/Godot_v3.5.1-stable_mono_x11.64'

alias luamake=/home/shragath/lua-language-server/3rd/luamake/luamake
alias config='/usr/bin/git --git-dir=/home/shragath/.dotfiles/ --work-tree=/home/shragath'
if command -v nvim &> /dev/null; then
  alias vim=nvim
fi

# Keybind
bindkey '^Y' autosuggest-accept
bindkey -v
PATH="$HOME/.local/bin/:$PATH"



#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="$HOME/.sdkman"
[[ -s "$HOME/.sdkman/bin/sdkman-init.sh" ]] && source "$HOME/.sdkman/bin/sdkman-init.sh"


# Load Angular CLI autocompletion.
if command -v ng &> /dev/null; then
  source <(ng completion script)
fi

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/home/shragath/Downloads/google-cloud-sdk/path.zsh.inc' ]; then . '/home/shragath/Downloads/google-cloud-sdk/path.zsh.inc'; fi

# The next line enables shell command completion for gcloud.
if [ -f '/home/shragath/Downloads/google-cloud-sdk/completion.zsh.inc' ]; then . '/home/shragath/Downloads/google-cloud-sdk/completion.zsh.inc'; fi

export N_PREFIX="$HOME/n"; [[ :$PATH: == *":$N_PREFIX/bin:"* ]] || PATH+=":$N_PREFIX/bin"  # Added by n-install (see http://git.io/n-install-repo).

# setup fzf key binding and fuzzy completion
source <(fzf --zsh)
