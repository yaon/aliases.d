# Aliases related to git stuff

alias -g commti='commit'
alias -g gti='git'
alias g='git'

alias -g gc='git commit'
alias -g gca='git commit -a'

alias -g gs='git status -sb'

alias -g gps='git push'
alias -g gpl='git pull'

alias -g gsss='git stash'
alias -g gspp='git stash pop'
alias -g gsll='git stash list'

alias -g gd='git diff --color --color-words'
alias -g gdc='gd --cached'

alias -g gck='git checkout'
alias -g gsum='git summary'

alias -g gll='git log --color --no-merges --graph --pretty=format:"%C(auto)%h %C(auto)%d%Creset %C(auto)%s %C(red)%m%m %C(cyan)%an" --color --graph'
alias -g gl='git --no-pager log -30 --color --no-merges --graph --pretty=format:"%C(auto)%h %C(auto)%d%Creset %C(auto)%s %C(red)%m%m %C(cyan)%an" --color --graph'
alias -g grp='git \grep --break --heading --color -B 1 -A 2 -n -I'

function ggrep() {

    case $1 in
        'js' | 'javascript')
            lang='javascript'
            ;;
        'c' | 'c++' | 'cpp')
            lang=c++
            ;;
        'ruby' | 'rb')
            lang=ruby
            ;;
        'py' | 'python')
            lang=python
            ;;
        'sh' | 'bash' | 'zsh')
            lang=bash
            ;;
        'ocaml')
            lang=ocaml
            ;;
    esac

    if [ -z $lang ]; then
        langOpt='-g'
    else
        langOpt="-l$lang"
        shift
    fi

    pattern=$1
    shift
    g \grep -B 1 -A 3 --break --heading --show-function --no-color -n -I -e $pattern -- $* | pygmentize $langOpt -O bg=dark,fg=light,full -f256 | \less -r
}

alias -g grpjs='ggrep \js'


# vim: ft=zsh
alias -g ga='git add'

# Full synchronisation
alias  gsync='gpl && gps'
alias  gcm="git commit -m '"
