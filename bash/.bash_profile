echo "sourcing profile"

bind '"\C-f":vi-fWord'
bind '"\C-b":vi-bWord'

ssh-add
source ~/.bashrc

source ~/private/bashrc
export EDITOR=vim

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
# Change the file location because certain bash sessions truncate .bash_history
# file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history


[[ -r "/usr/local/etc/profile.d/bash_completion.sh" ]] && .  "/usr/local/etc/profile.d/bash_completion.sh"

# Created by `pipx` on 2021-09-22 08:48:48
export PATH="$PATH:/Users/gotcha/.local/bin"

export PATH="$HOME/.cargo/bin:$PATH"

source /Users/gotcha/.config/broot/launcher/bash/br
