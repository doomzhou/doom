cdls() { builtin cd $1 && ls; }
f () { if [[ $1 =~ ^[0-9]$ ]];then c_t=`ls -l | grep "^-" | awk -v tt=$1 'NR==tt+1{print$9}'`; elif [[ $1 =~ l[0-9] ]];then l1=`echo $1 |cut -c2`; c_t=`ls -l | grep "^-" | awk -v tt=$l1 '{a[NR]=$9}END{print a[NR-tt]}'`; else c_t=`ls -l | grep "^-" | awk '{print$9}' |grep "$1" |  awk 'NR==1{print$0}'`; fi; echo $c_t; }
d () { if [[ $1 =~ ^[0-9]$ ]];then c_t=`ls -l | grep "^d" | awk -v tt=$1 'NR==tt+1{print$9}'`; elif [[ $1 =~ l[0-9] ]];then l1=`echo $1 |cut -c2`; c_t=`ls -l | grep "^d" | awk -v tt=$l1 '{a[NR]=$9}END{print a[NR-tt]}'`; else c_t=`ls -l | grep "^d" | awk '{print$9}' |grep "$1" |  awk 'NR==1{print$0}'`; fi; echo $c_t; }
pass () { echo $1-$2 | md5sum | sha1sum | awk -F '[1a2b]' '{for (i=1;i<=NF;i++) if ( length($i)>= 6) print$i}' | sed -n '1p' | sed -n 's/[3c]/\%/gp'}
dirsha1sum () {echo $(find $1 -type f |wc | awk 'BEGIN{OFS="";}{print$1$2$3}') $(find $1 -type f  | xargs md5sum | awk '{printf$1};END{print""}' | md5sum) |sha1sum ;}

alias doom='ssh -p 6333 root@101.95.155.238'
alias zlfnetSs='netstat -ntlp | grep $1'
alias zlfpsS='ps -ef | grep $1'
alias pub='ssh doom@222.73.122.247'
alias godaddy='ssh -D 127.0.0.1:9050 doom@23.229.159.37'
alias yunpa='ssh -D 127.0.0.1:9051 ops@doom.gohjkl.com'
alias amazon='ssh -i ~/.ssh/amazon-dom.pem ec2-user@54.200.95.207' 
alias pafoffice='ssh -p 11122 shk.gohjkl.com'
HISTFILESIZE=
HISTSIZE=
HISTTIMEFORMAT="[%F:%T] "
# Path to your oh-my-zsh configuration.
ZSH=$HOME/.oh-my-zsh

# Set name of the theme to load.
# Look in ~/.oh-my-zsh/themes/
# Optionally, if you set this to "random", it'll load a random theme each
# time that oh-my-zsh is loaded.
ZSH_THEME="fox"

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
HIST_STAMPS="mm/dd/yyyy"

# Which plugins would you like to load? (plugins can be found in ~/.oh-my-zsh/plugins/*)
# Custom plugins may be added to ~/.oh-my-zsh/custom/plugins/
# Example format: plugins=(rails git textmate ruby lighthouse)
plugins=(git)

source $ZSH/oh-my-zsh.sh
source ~/.bash_profile

# User configuration

export PATH=$HOME/bin:/usr/local/bin:$PATH
# export MANPATH="/usr/local/man:$MANPATH"

# # Preferred editor for local and remote sessions
# if [[ -n $SSH_CONNECTION ]]; then
#   export EDITOR='vim'
# else
#   export EDITOR='mvim'
# fi

# Compilation flags
# export ARCHFLAGS="-arch x86_64"

# ssh
# export SSH_KEY_PATH="~/.ssh/dsa_id"
set -o vi
#bindkey -v
