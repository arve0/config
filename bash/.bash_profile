export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

#THIS MUST BE AT THE END OF THE FILE FOR SDKMAN TO WORK!!!
export SDKMAN_DIR="/Users/arve/.sdkman"
[[ -s "/Users/arve/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arve/.sdkman/bin/sdkman-init.sh"

source ~/.git-completion.bash
source ~/.bd-completion.bash

export PATH="/Users/arve/.bin:/Users/arve/miniconda3/bin:$PATH"

alias g=git
alias s="git status"
alias got=git
alias gut=git
alias gi=git
alias bd=". bd -si"
alias password="openssl rand -base64 32"
alias c=pbcopy
alias p=pbpaste
alias cb="git-branch | sed 's/ //' | pbcopy"
alias fn="find . -iname"
alias secure-dns="sudo networksetup -setdnsservers Wi-Fi 127.0.0.1"
alias reset-dns="sudo networksetup -setdnsservers Wi-Fi empty"

# oracle sql plus
export ORACLE_HOME=~/Applications/oracle/product/instantclient_64/11.2.0.4.0
export PATH=$ORACLE_HOME/bin:$PATH
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
alias sp="rlwrap -if . sqlplus nvms_data/nvms_data@vegloggen"
alias spa="rlwrap -if . sqlplus nvmsdata_a/nvmsdata_a@vegloggen"
alias spb="rlwrap -if . sqlplus nvmsdata_b/nvmsdata_b@vegloggen"

export PATH="$HOME/.cargo/bin:$PATH"

# terminal prefix
function git-branch {
  git symbolic-ref --short HEAD 2> /dev/null | tr "\n" " "
}
function update_prompt {
  # \[\e]7;content\a sets terminal titlebar
  export PS1="\[\e]2;\u@\H \w\a\] \W $(git-branch)\$ "
}
PROMPT_COMMAND=update_prompt

eval "$(rbenv init -)"

# Eternal bash history.
# ---------------------
# Undocumented feature which sets the size to "unlimited".
# http://stackoverflow.com/questions/9457233/unlimited-bash-history
export HISTFILESIZE=
export HISTSIZE=
export HISTTIMEFORMAT="[%F %T] "
# Change the file location because certain bash sessions truncate .bash_history file upon close.
# http://superuser.com/questions/575479/bash-history-truncated-to-500-lines-on-each-login
export HISTFILE=~/.bash_eternal_history
# Force prompt to write history after every command.
# http://superuser.com/questions/20900/bash-history-loss
PROMPT_COMMAND="history -a; $PROMPT_COMMAND"

# fuzzy searching, CTRL-T, CTRL-R
[ -f ~/.fzf.bash ] && source ~/.fzf.bash
