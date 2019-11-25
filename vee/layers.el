
;;;;
;;
;; Vic's Emacs Environment distribution layers
;;
(configuration-layer/declare-layers
 '(
   ;; spacemacs
   nixos
   osx
   better-defaults
   syntax-checking
   version-control
   themes-megapack
   auto-completion

   ;; prog-mode
   lua
   javascript
   typescript
   html
   emacs-lisp
   idris
   ruby
   rust
   sql
   python
   clojure
   racket
   ocaml
   purescript
   elm
   coq
   elixir
   erlang
   haskell
   markdown
   (scala :variables
          scala-backend nil ; 'scala-metals
          scala-auto-start-backend nil
          scala-auto-insert-asterisk-in-comments t
          scala-enable-eldoc nil)
   shell-scripts
   syntax-checking

   ;; utils
   dash
   (git :variables
        git-magit-status-fullscreen t)
   restclient
   emoji

   (shell :variables
          shell-default-shell 'multi-term
          shell-default-term-shell "/usr/bin/fish"
          shell-enable-smart-eshell t)

   (erc :variables
        erc-server-list
        '(("irc.freenode.net"
           :port "6697"
           :ssl t
           :password nil
           :nick "vborja")
          ("irc.gitter.im"
           :port "6667"
           :ssl t
           :password nil
           :nick "vic")
          ("irc.net"
           :port "6697"
           :ssl t
           :password nil
           :nick "vborja")))

   ;; vee layers
   ;; vee-popwin
   ;; vee-editorconfig
   ;; vee-term+mux
   vee-themes
   vee-ui
   ;; vee-yaml
   ;; vee-dash
   ;; vee-neo4j
   ;; vee-multiedit
   ;; vee-treemacs

   ))
