# -*- shell-script -*-

export EDITOR=vim
export VISUAL=vim
alias e=vim

if [[ ! -z "${EMACS}" ]]; then
 #export TERM='xterm-256color'

 export EDITOR='emacsclient'
 export VISUAL='emacsclient'

 prompt minimal

 alias e='emacsclient'
 alias en='emacsclient -n'
 alias vim='emacsclient'
 alias vi='emacsclient'

 function E() {
   echo $* | xargs -II emacsclient -e '(eshell-command "I" t)'
 }

 alias magit='E magit-status'
 alias O='E vee:open-project-session'

fi
