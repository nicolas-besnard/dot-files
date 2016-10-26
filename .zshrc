
# Path to your oh-my-zsh installation.
export ZSH=$HOME/.oh-my-zsh
# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="robbyrussell"

# Example aliases
# alias zshconfig="mate ~/.zshrc"
# alias ohmyzsh="mate ~/.oh-my-zsh"

# Set this to use case-sensitive completion
# CASE_SENSITIVE="true"

# Uncomment this to disable bi-weekly auto-update checks
# DISABLE_AUTO_UPDATE="true"

# Uncomment to change how often to auto-update? (in days)
# export UPDATE_ZSH_DAYS=13

# Uncomment following line if you want to disable colors in ls
# DISABLE_LS_COLORS="true"

# Uncomment following line if you want to disable autosetting terminal title.
# DISABLE_AUTO_TITLE="true"

# Uncomment following line if you want to disable command autocorrection
# DISABLE_CORRECTION="true"

# Uncomment following line if you want red dots to be displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

# Uncomment following line if you want to disable marking untracked files under
# VCS as dirty. This makes repository status check for large repositories much,
# much faster.
# DISABLE_UNTRACKED_FILES_DIRTY="true"

# Uncomment following line if you want to the command execution time stamp shown
# in the history command output.
# The optional three formats: "mm/dd/yyyy"|"dd.mm.yyyy"|"yyyy-mm-dd"
# HIST_STAMPS="mm/dd/yyyy"

# Would you like to use another custom folder than $ZSH/custom?
# ZSH_CUSTOM=/path/to/new-custom-folder

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(osx rails ruby github node npm brew zsh-syntax-highlighting zsh-autosuggestions git-extras httpie jsontools)

source $ZSH/oh-my-zsh.sh

# User configuration

export PATH="$PATH:/usr/bin:/bin:/usr/sbin:/sbin:/usr/local/bin:$HOME/.bin:$HOME/.tmuxifier/bin"
# export MANPATH="/usr/local/man:$MANPATH"

# You may need to manually set your language environment
# export LANG=en_US.UTF-8

# Preferred editor for local and remote sessions
if [[ -n $SSH_CONNECTION ]]; then
    export EDITOR='vim'
else
    export EDITOR='vim'
fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
alias mv="mv -v"
alias cp="cp -v"
alias rm="rm -v"
alias l="ls -l"
alias gs="git s"
alias rails_assets="rake assets:clobber && rake assets:precompile"
alias ddb="cd /Applications/dynamodb && java -Djava.library.path=./DynamoDBLocal_lib -jar DynamoDBLocal.jar"
alias elastic="cd /Applications/elasticsearch/bin/ && ./elasticsearch"
alias dev="cd ~/Documents/development"
alias clean="find . \( -name '*~' -o -name '#*#' -o -name '.DS_Store' -o -name '*.log' \) -delete -exec echo "Removed" {} \;"
alias t="~/todo-txt/todo.sh"
alias gitb="sh ~/.bin/gitb.sh"
alias flushdns="dscacheutil -flushcache && killall -HUP mDNSResponder"
alias gdc='git difff --cached | less -r'
alias gd='git difff | less -r'
PATH=$PATH:$HOME/.rvm/bin:$HOME/gocode/bin # Add RVM to PATH for scripting
source ~/.bin/z/z.sh

# Load zsh-syntax-highlighting.
source ~/.zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# Load zsh-autosuggestions.
source ~/.zsh/zsh-autosuggestions/autosuggestions.zsh

# Enable autosuggestions automatically.
zle-line-init() {
    zle autosuggest-start
}
zle -N zle-line-init
AUTOSUGGESTION_ACCEPT_RIGHT_ARROW=1

source ~/todo-txt/todo_completion
export GOPATH="$HOME/gocode/"

test -e ${HOME}/.iterm2_shell_integration.zsh && source ${HOME}/.iterm2_shell_integration.zsh

curl --version 2>&1 > /dev/null
if [ $? -ne 0 ]; then
    echo "Could not find curl."
    return 1
fi

export SUDO_PROMPT='\[\e[38m\]%p\[\e[0m\] password: '

# Replace the sudo prompt and add some color to it
alias sudo="sudo -p \"$fg_bold[red][sudo] $fg_no_bold[red]Password:$reset_color \" "

transfer() {
    # check arguments
    if [ $# -eq 0 ];
    then
	echo "No arguments specified. Usage:\necho transfer /tmp/test.md\ncat /tmp/test.md | transfer test.md"
	return 1
    fi

    # get temporarily filename, output is written to this file show progress can be showed
    tmpfile=$( mktemp -t transferXXX )

    # upload stdin or file
    file=$1

    if tty -s;
    then
	basefile=$(basename "$file" | sed -e 's/[^a-zA-Z0-9._-]/-/g')

	if [ ! -e $file ];
	then
	    echo "File $file doesn't exists."
	    return 1
	fi

	if [ -d $file ];
	then
	    # zip directory and transfer
	    zipfile=$( mktemp -t transferXXX.zip )
	    cd $(dirname $file) && zip -r -q - $(basename $file) >> $zipfile
	    curl --progress-bar --upload-file "$zipfile" "https://transfer.sh/$basefile.zip" >> $tmpfile
	    rm -f $zipfile
	else
	    # transfer file
	    curl --progress-bar --upload-file "$file" "https://transfer.sh/$basefile" >> $tmpfile
	fi
    else
	# transfer pipe
	curl --progress-bar --upload-file "-" "https://transfer.sh/$file" >> $tmpfile
    fi

    # cat output link
    cat $tmpfile

    # cleanup
    rm -f $tmpfile
}

encrypt() {
	tar -cf - $1 | openssl aes-128-cbc -salt -out backup.tar.aes
}

decrypt() {
	openssl aes-128-cbc -d -salt -in $1 | tar -x -f -
}

routes() {
  # regenerate tmp/routes if it is not already generated or it is older than the routes config file
  if [[ ! -f tmp/routes ]] || [[ tmp/routes -ot config/routes.rb ]]; then
    rake routes >! tmp/routes
  fi

  if (($#)); then
    if type ag >/dev/null; then
      ag --color --nonumbers "${(j:|:)@}" tmp/routes
    else
      grep "${(j:|:)@}" tmp/routes
    fi
  else
    cat tmp/routes
  fi
}

alias rr="routes"

function gct {
  tmux send "git difff --cached | less -r" C-m \; split-window -h \; send "git commit; exit" C-m
}

eval "$(tmuxifier init -)"
