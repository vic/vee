# -*- shell-script -*-

export EDITOR=vim
export VISUAL=vim
alias e=vim

if [[ ! -z "${EMACS}" ]]; then
 #export TERM='xterm-256color'

 export EDITOR='emacsclient'
 export VISUAL='emacsclient'

 alias e='emacsclient'
 alias vim='emacsclient'
 alias vi='emacsclient'
 prompt minimal

 function E() {
   echo $* | xargs -II emacsclient -e '(eshell-command "I" t)'
 }

 alias magit='E magit-status $PWD'

fi
