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

source /Users/gotcha/co/just-bash-completion/just-completion.bash

line_between_commands() {
    for (( i=0 ; i<$COLUMNS ; i++ )); do echo -ne "=" ; done
}

function starship_pre(){
    # Force prompt to write history after every command.
    history -a
    line_between_commands
}

starship_precmd_user_func="starship_pre"
eval "$(starship init bash)"

# Created by `pipx` on 2021-09-22 08:48:48
export PATH="$PATH:/Users/gotcha/.local/bin"
eval "$(register-python-argcomplete pipx)"

eval "$(zoxide init bash)"

source /Users/gotcha/.config/broot/launcher/bash/br

eval "$(thefuck --alias)"
export MCFLY_FUZZY=2
eval "$(mcfly init bash)"


# direnv
eval "$(direnv hook bash)"
