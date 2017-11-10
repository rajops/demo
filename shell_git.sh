

#! /bin/bash
##
## Setting the git branch and syncronized status into PS1 definition
##
## The comments defines the values preseted by the distribution thought ~/.bashrc
##
## Instalation:
##	copy the script to /home/${user}/
## 	execute the script inside the ~/.bashrc with: '. scriptName'
##

## check if some color is set
if echo "$PS1" | grep '\\\[\\033\[' >/dev/null 2>&1 ; then
#       PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$'
        PS1="${PS1}""\$(git branch >/dev/null 2>&1 && echo '\[\033[01;30m\]git:'\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$(if [ \$(git diff --numstat 2>/dev/null | wc -l) -gt 0 ]; then echo '\[\033[01;31m\]:unsync'; else echo ''; fi)'\[\033[00m\] \$')";
else
#       PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$'
        PS1="${PS1}""\$(git branch >/dev/null 2>&1 && echo 'git:'\$(git branch 2>/dev/null | grep '^*' | colrm 1 2)\$(if [ \$(git diff --numstat 2>/dev/null | wc -l) -gt 0 ]; then echo ':unsync'; else echo ''; fi)' \$')";
fi
PS1="${PS1}"' '
