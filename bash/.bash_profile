source ~/.bashrc

[[ -s "$HOME/.rvm/scripts/rvm" ]] && source "$HOME/.rvm/scripts/rvm" # Load RVM into a shell session *as a function*
source ~/private/bashrc
export EDITOR=vim
if [ -e /Users/gotcha/.nix-profile/etc/profile.d/nix.sh ]; then . /Users/gotcha/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
