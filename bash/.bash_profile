export LANG="en_US.UTF-8"
export LANGUAGE="en_US.UTF-8"
export LC_ALL="en_US.UTF-8"

complete -W "$(echo $(grep '^ssh ' ~/.bash_history | sort -u | sed 's/^ssh //'))" ssh 
complete -W 'feedba.ch fractal resistor.seljebu.no login.stud.ntnu.no seljebu.no kondensator.seljebu.no filserver.chickenkiller.com rec.chickenkiller.com -p 2222 -l seljebu admin root murco.seljebu.no seljebu@login.stud.ntnu.no' ssh
# Generate a random password
#  $1 = number of characters; defaults to 32
#  $2 = include special characters; 1 = yes, 0 = no; defaults to 1
function apg() {
  if [ "$1" = "" ]
  then
      len=8
  else
      len=`expr $1 / 2 + 1`
  fi
  # half of chars with special chars
  #     get random bits   | encode     | take line 2  | get char 2->
  var1=`head /dev/urandom | uuencode - | sed -n 2p    | cut -c2-$len`
  # rest of chars with base64
  #     get random bits   | encode base64 | take line 2 | get char 2->
  var2=`head /dev/urandom | uuencode -m - | sed -n 2p   | cut -c2-$len`
  echo "$var1$var2"
}

# Evaluate system PATH
if [ -x /usr/libexec/path_helper ]; then
    eval `/usr/libexec/path_helper -s`
fi

# Virutalenvwrapper
export PROJECT_HOME='/Users/arve/Dokumenter/git/'
source /usr/local/bin/virtualenvwrapper.sh
alias mp='mkproject -f -p /usr/local/bin/python3'

# aliases
alias in='ipython notebook'
alias ub='unison -batch'
alias cdg='cd ~/Dokumenter/git'
alias cdm='cd ~/Dokumenter/git/master'
alias cdo='cd ~/Dokumenter/git/oppgaver'
alias g='git'


# git autocomplete
if [ -f ~/.git-completion.bash ]; then
  . ~/.git-completion.bash
fi

# added by Miniconda3 3.7.0 installer
#export PATH="/Users/arve/miniconda3/bin:$PATH"

# Setting PATH for Python 3.4
# The orginal version is saved in .bash_profile.pysave
#PATH="/Library/Frameworks/Python.framework/Versions/3.4/bin:${PATH}"
#export PATH
