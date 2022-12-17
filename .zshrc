# Fig pre block. Keep at the top of this file.
[[ -f "$HOME/.fig/shell/zshrc.pre.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.pre.zsh"
# If you come from bash you might have to change your $PATH.

export ZSH="$HOME/.oh-my-zsh"
PROMPT="%1d:~$ "
DEFAULT_USER="david"

plugins=(
    git
    node
    sublime
    zsh-interactive-cd
    colored-man-pages
    colorize
    common-aliases
    npm
    docker
    redis-cli
    golang
    colored-man-pages
    cp
    fzf
    gcloud
    history
    postgres
    httpie
    copybuffer
    ssh-agent
    zsh-vi-mode
    fzf-tab
    zsh-autosuggestions
    zsh-syntax-highlighting
    zsh-vim-mode
)

source $ZSH/oh-my-zsh.sh

export SSH_KEY_PATH="~/.ssh/rsa_id"
export PATH="$PATH:$GOPATH/bin"
export PATH="$PATH:$GOROOT/bin"
export PATH="$HOME/.cargo/bin:$PATH"
export PATH="/opt/homebrew/bin:/usr/local/bin:$PATH"
export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8
export ARCHFLAGS="-arch x86_64"
export PATH=/usr/local/bin:$PATH
export PATH="$HOME/.npm-packages/bin:$PATH"
export PATH=$HOME/programming/scripts/python:$PATH
export NODE_PATH=$HOME/.nvm/versions/node/
export NVM_DIR="$HOME/.nvm"  
export PATH=$HOME/.nvm/versions/node/v12.17.0/bin:$PATH
export PATH="/usr/local/bin/git-fuzzy/bin:$PATH"

load_nvm () { source $(brew --prefix nvm)/nvm.sh; }

export MANPAGER="nvim +Man!"
export CLICOLOR=1
export LSCOLORS=ExFxCxDxBxegedabagacad
export LESS='-i -M -R -W -S'
export GREP_OPTIONS='--color=auto' GREP_COLOR='100;8'
export CC=clang
export CXX=clang++
export PKG_CONFIG_PATH="/opt/local/lib/pkgconfig:$PKG_CONFIG_PATH"

export NNN_PLUG='f:finder;j:autojump;o:fzopen;h:fzhist;d:diffs;t:treeview;v:imgview;c:fzcd;p:preview-tui;o:preview;i:preview-old;d:dragdrop'
export NNN_FIFO="/tmp/nnn.fifo"
export PYQ_FIFO="/tmp/pyq.fifo"

# export PATH="/$HOME/Programming/scripts/git-fuzzy/bin:$PATH"
export GF_PREFERRED_PAGER="delta --theme=gruvbox --highlight-removed -w __WIDTH__"
export PATH="$HOME/.pyenv/bin:$PATH"
export PATH="/usr/local/bin:$PATH"
eval "$(pyenv init -)"
export LDFLAGS="-L/usr/local/opt/zlib/lib -L/usr/local/opt/bzip2/lib"
export CPPFLAGS="-I/usr/local/opt/zlib/include -I/usr/local/opt/bzip2/include"
export PATH="$PATH:$HOME/.foundry/bin"
export PATH="$PATH:$HOME/davidvanisacker/.local/bin"
export ZVM_VI_INSERT_ESCAPE_BINDKEY=kj


FCEDIT='nvim'
VISUAL='nvim'
EDITOR='nvim'




#aliases
alias less='less -FSRXc'
alias finder='open -a Finder ./'
alias c='load_nvm && nvm use stable && code-insiders -a'
alias cic='set completion-ignore-case on'
alias sublime="open -a /Applications/Sublime\ Text.app"
alias gcc='gcc -Wall -pedantic -std=c99'
alias g++='g++ -Wall -pedantic'
alias ll="ls -lhA"
alias histg="history | grep"
alias cpath="pwd|pbcopy"
alias cl="tput cup 11 0 && tput ed"
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'
alias diff='colordiff'
alias mount='mount | column -t'
alias sha1='openssl sha1'
alias ccat='pygmentize -f terminal'
alias git-show-merged='git branch --merged | egrep -v "(^\*|master|develop)"'
alias gd='ssh david@$(cat ~/server_ips | fzf | awk "{print \$4}")'
alias cat='bat'
alias a='fasd -a'
alias d='fasd -d'
alias s='fasd -si'
alias sd='fasd -sid'
alias sf='fasd -sif'
alias z='fasd_cd -d'
alias zz='fasd_cd -d -i'
alias v='f -e vim'
alias nw="tmux new-window"
alias vim="nvim"


alias fgit='git fuzzy'
falias () { alias | fzf } # search through the current list of alias



# Functions
trash () { command mv "$@" ~/.Trash ; }
mans () { man $1 | grep -iC2 --color=always $2 | less ; }
ql () { qlmanage -p "$*" >& /dev/null; }
mcd () { mkdir -p $1; cd $1; }
ffs () { /usr/bin/find . -name "$@"'*' ; }  # ffs:      Find file whose name starts with a given string
ffe () { /usr/bin/find . -name '*'"$@" ; }  # ffe:      Find file whose name ends with a given string
he () { man $1 | grep -e $2 }

if which peco &> /dev/null; then
    function peco_select_history() {
        local tac
        (which gtac &> /dev/null && tac="gtac") || \
            (which tac &> /dev/null && tac="tac") || \
            tac="tail -r"
                    BUFFER=$(fc -l -n 1 | eval $tac | \
                        peco --layout=bottom-up --query "$LBUFFER")
                                            CURSOR=$#BUFFER # move cursor
                                            zle -R -c       # refresh
                                        }

                                    zle -N peco_select_history
                                    bindkey '^R' peco_select_history
fi

fpydoc() { echo '' | fzf --preview 'pydoc {q} | pygmentize -f terminal -O bg=dark -l md | less -R' }
fpydoc() { echo '' | fzf --preview 'pydoc {q} | pygmentize -f terminal -O bg=dark -l md | less -R' }
fsh() { echo '' | fzf --print-query --preview 'sh -c {q}'}
fman () { man -k . | fzf --preview 'man {q}' }
fman3 () { man $1 | fzf --preview 'man ls | grep {q}' }
fman2 () { man -k . | fzf --prompt='Man> ' | awk '{print $1}' | fzf --preview 'man {q}' }
fmicro () { micro $(find $@ -type f || fzf --preview 'less -R {}') }
fhistory () { history | fzf }
fenv () { printenv | fzf --border }


man_finder() {
    man -k . | fzf --prompt='Man> ' | awk '{print $1}' | xargs -I man
}

show-commit () {git show :/$1}
commit-id () { git rev-parse HEAD~$1 }
get-commit-id () { git rev-parse HEAD~$1 | pbcopy }

add-script-to-path () {
    cp $1 '/usr/local/bin/'$1
    chmod +x '/usr/local/bin/'$1
}

git-fetch-all () {
    git branch -r | grep -v '\->' | while read remote; do git branch --track "${remote#origin/}" "$remote"; done
    git fetch --all
    git pull --all  
}

is_in_git_repo() {
    git rev-parse HEAD > /dev/null 2>&1
}

join-lines() {
local item
while read item; do
    echo -n "${(q)item} "
done
}

bind-git-helper() {
local c
for c in $@; do
    eval "fzf-g$c-widget() { local result=\$(_g$c | join-lines); zle reset-prompt; LBUFFER+=\$result }"
    eval "zle -N fzf-g$c-widget"
    eval "bindkey '^g^$c' fzf-g$c-widget"
done
}
bind-git-helper f b t r h
unset -f bind-git-helper

camelcase() {
    perl -pe 's#(_|^)(.)#\u$2#g'
}


source /usr/local/share/zsh-autosuggestions/zsh-autosuggestions.zsh

fzf-down() {
fzf --height 50% "$@" --border
}

_gf() {
    is_in_git_repo || return
    git -c color.status=always status --short |
        fzf-down -m --ansi --nth 2..,.. \
        --preview '(git diff --color=always -- {-1} | sed 1,4d; cat {-1}) | head -500' |
        cut -c4- | sed 's/.* -> //'
    }

_gb() {
    is_in_git_repo || return
    git branch -a --color=always | grep -v '/HEAD\s' | sort |
        fzf-down --ansi --multi --tac --preview-window right:70% \
        --preview 'git log --oneline --graph --date=short --color=always --pretty="format:%C(auto)%cd %h%d %s" $(sed s/^..// <<< {} | cut -d" " -f1) | head -'$LINES |
        sed 's/^..//' | cut -d' ' -f1 |
        sed 's#^remotes/##'
    }

_gt() {
    is_in_git_repo || return
    git tag --sort -version:refname |
        fzf-down --multi --preview-window right:70% \
        --preview 'git show --color=always {} | head -'$LINES
    }

_gh() {
    is_in_git_repo || return
    git log --date=short --format="%C(green)%C(bold)%cd %C(auto)%h%d %s (%an)" --graph --color=always |
        fzf-down --ansi --no-sort --reverse --multi --bind 'ctrl-s:toggle-sort' \
        --header 'Press CTRL-S to toggle sort' \
        --preview 'grep -o "[a-f0-9]\{7,\}" <<< {} | xargs git show --color=always | head -'$LINES |
        grep -o "[a-f0-9]\{7,\}"
    }

_gr() {
    is_in_git_repo || return
    git remote -v | awk '{print $1 "\t" $2}' | uniq |
        fzf-down --tac \
        --preview 'git log --oneline --graph --date=short --pretty="format:%C(auto)%cd %h%d %s" {1} | head -200' |
        cut -d$'\t' -f1
    }



# initialize conda
# !! Contents within this block are managed by 'conda init' !!
__conda_setup="$('/usr/local/anaconda3/bin/conda' 'shell.zsh' 'hook' 2> /dev/null)"
if [ $? -eq 0 ]; then
    eval "$__conda_setup"
else
    if [ -f "/usr/local/anaconda3/etc/profile.d/conda.sh" ]; then
        . "/usr/local/anaconda3/etc/profile.d/conda.sh"
    else
        export PATH="/usr/local/anaconda3/bin:$PATH"
    fi
fi
unset __conda_setup


# Google cloud SDK
if [ -f "$HOME/google-cloud-sdk/path.zsh.inc" ]; then . "$HOME/google-cloud-sdk/path.zsh.inc"; fi
if [ -f "$HOME/google-cloud-sdk/completion.zsh.inc" ]; then . "$HOME/google-cloud-sdk/completion.zsh.inc"; fi

ulimit -n 65536
ulimit -u 2048


eval "$(fasd --init auto)"

bindkey -v 
set -o vi
setopt prompt_subst
autoload -Uz vcs_info

zstyle ':vcs_info:*' stagedstr 'M' 
zstyle ':vcs_info:*' unstagedstr 'M' 
zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:*' actionformats '%F{5}[%F{2}%b%F{3}|%F{1}%a%F{5}]%f '
zstyle ':vcs_info:*' formats \
    '%F{5}[%F{2}%b%F{5}] %F{2}%c%F{3}%u%f'
    zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
    zstyle ':vcs_info:*' enable git 
    +vi-git-untracked() {
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        [[ $(git ls-files --other --directory --exclude-standard | sed q | wc -l | tr -d ' ') == 1 ]] ; then
            hook_com[unstaged]+='%F{1}??%f'
    fi
}


precmd () { vcs_info }
PROMPT='%F{5}[%F{2}%n%F{5}] %F{3}%3~ ${vcs_info_msg_0_} %f%# '

# FZF Config
export FZF_BASE="$HOME/.fzf"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

autoload -U compinit
compinit -i

google() { open /Applications/Google\ Chrome.app/ "http://www.google.com/search?q= $1"; }
zapper() { open /Applications/Google\ Chrome.app/ "http://zapper.fi/es/account/$1?tab=history"; }
debank() { open /Applications/Google\ Chrome.app/ "https://debank.com/profile/$1"; } 
etherscan() { open /Applications/Google\ Chrome.app/ "https://etherscan.io/address/$1"; } 
tx() { open /Applications/Google\ Chrome.app/ "https://etherscan.io/tx/$1"; } 
contract() { open /Applications/Google\ Chrome.app/ "https://etherscan.deth.net/address/$1"; }

function codi() {
  local syntax="${1:-python}"
  shift
  vim -c \
    "let g:startify_disable_at_vimenter = 1 |\
    set bt=nofile ls=0 noru nonu nornu |\
    hi ColorColumn ctermbg=NONE |\
    hi VertSplit ctermbg=NONE |\
    hi NonText ctermfg=0 |\
    Codi $syntax" "$@"
}

# Fig post block. Keep at the bottom of this file.
[[ -f "$HOME/.fig/shell/zshrc.post.zsh" ]] && builtin source "$HOME/.fig/shell/zshrc.post.zsh"

# tabtab source for packages
# uninstall by removing these lines
[[ -f ~/.config/tabtab/zsh/__tabtab.zsh ]] && . ~/.config/tabtab/zsh/__tabtab.zsh || true
