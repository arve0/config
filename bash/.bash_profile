if [[ "$OSTYPE" == "darwin"* ]]; then
	source .bash_osx
fi

if [ -f .bash_aliases ]; then
	source .bash_aliases
fi

source ~/.git-completion.bash
# autocomplete for g (git alias)
__git_complete g __git_main

# back dir
source ~/.bd-completion.bash

export PATH="/Users/arve/.bin:$PATH"
export LANG=en_US

# oracle sql plus
export ORACLE_HOME=~/Applications/oracle/product/instantclient_64/11.2.0.4.0
export PATH=$ORACLE_HOME/bin:$PATH
export DYLD_LIBRARY_PATH=$ORACLE_HOME/lib
alias sp="rlwrap -if . sqlplus nvms_data/nvms_data@vegloggen"
alias spa="rlwrap -if . sqlplus nvmsdata_a/nvmsdata_a@vegloggen"
alias spb="rlwrap -if . sqlplus nvmsdata_b/nvmsdata_b@vegloggen"

# rust cargo
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

# ruby env for homebrew
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

# node version manager
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# manage jvm/scala versions
export SDKMAN_DIR="/Users/arve/.sdkman"
[[ -s "/Users/arve/.sdkman/bin/sdkman-init.sh" ]] && source "/Users/arve/.sdkman/bin/sdkman-init.sh"

