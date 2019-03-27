export GOPATH=$HOME/go
export PATH=$PATH:$GOPATH/bin
export PATH=$PATH:/usr/local/opt/go/libexec/bin

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting
export PATH=$HOME/software/fullrelease/bin:$PATH
export PATH=$HOME/software/flake8/bin:$PATH
export PATH=/usr/local/bin:$PATH
export PATH=$HOME/bin:$PATH
export PATH=$PATH:$HOME/software/gsl/src
export RIPGREP_CONFIG_PATH=/Users/gotcha/.ripgreprc
export CLICOLOR=1
export FZF_CTRL_T_OPTS="--preview 'bat --color=always --line-range :500 {}'"
export FZF_ALT_C_OPTS="--preview 'tree -C {} | head -100'"

export LC_ALL=en_US.UTF-8
export LANG=en_US.UTF-8

alias iu="/Users/gotcha/auto/bin/install-user.sh"
alias viu="vim /Users/gotcha/auto/bin/install-user.sh"
alias grun='java org.antlr.v4.gui.TestRig'
alias antlr4='java -Xmx500M -cp "/usr/local/lib/antlr-4.5.3-complete.jar:$CLASSPATH" org.antlr.v4.Tool'
alias fzf='fzf-tmux'
alias cdp='cd ~/co; cd $(fd -d 2 -t 'd' | fzf)'

[ -f ~/.fzf.bash ] && source ~/.fzf.bash

fzf_find_edit() {
    local file=$(
      fzf --no-multi --preview 'bat --color=always --line-range :500 {}'
      )
    if [[ -n $file ]]; then
        $EDITOR $file
    fi
}

alias ffe='fzf_find_edit'

fzf_grep_edit(){
    if [[ $# == 0 ]]; then
        echo 'Error: search term was not provided.'
        return
    fi
    local match=$(
      rg --color=never --line-number "$1" |
        fzf --no-multi --delimiter : \
            --preview "bat --color=always --line-range {2}: {1}"
      )
    local file=$(echo "$match" | cut -d':' -f1)
    local line=$(echo "$match" | cut -d':' -f2)
    if [[ -n $file ]]; then
        $EDITOR -c "let @/='$1' | norm n" $file +"$line"
    fi
}

alias fge='fzf_grep_edit'
fzf_kill() {
    local pids=$(
      ps -f -u $USER | sed 1d | fzf --multi | tr -s [:blank:] | cut -d' ' -f3
      )
    if [[ -n $pids ]]; then
        echo "$pids" | xargs kill -9 "$@"
    fi
}

alias fkill='fzf_kill'

complete -C /usr/local/bin/vault vault
eval "$(direnv hook bash)"

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"

line_between_commands() {
    for (( i=0 ; i<\$COLUMNS ; i++ )); do echo -ne = ; done 
}
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
case "$TERM" in
xterm*|rxvt*|screen-256color*)
  if ! [[ "$PROMPT_COMMAND" =~ "do echo -ne" ]]; then
    export PROMPT_COMMAND=" history -a ; for (( i=0 ; i<\$COLUMNS ; i++ )); do echo -ne = ; done ; $PROMPT_COMMAND"
  fi
   ;;
*)
   ;;
esac

[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && .  "/usr/local/etc/profile.d/bash_completion.sh"

git_branch() {
  git branch 2> /dev/null | sed -e '/^[^*]/d' -e 's/* \(.*\)/(\1)/'
}
export PS1="[\u@\h \W]\$(git_branch)\$ "
