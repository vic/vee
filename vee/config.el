
;;;;
;;
;; Vic's Emacs Environment distribution layers
;;
(configuration-layer/declare-layers
 '(
   ;; spacemacs
   osx
   better-defaults
   syntax-checking
   version-control
   themes-megapack
   (auto-completion :variables
                    auto-completion-return-key-behavior 'complete
                    auto-completion-tab-key-behavior 'cycle
                    auto-completion-complete-with-key-sequence "jj"
                    auto-completion-complete-with-key-sequence-delay 0.1
                    auto-completion-private-snippets-directory nil
                    auto-completion-enable-snippets-in-popup t
                    auto-completion-enable-help-tooltip t
                    auto-completion-enable-sort-by-usage t)

   ;; prog-mode
   lua
   javascript
   typescript
   html
   emacs-lisp
   ruby
   ;; python
   elm
   elixir
   erlang
   haskell
   markdown

   ;; utils
   dash
   git
   restclient
   emoji

   (shell :variables
          shell-default-shell 'multi-term)

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
   vee-popwin
   vee-editorconfig
   vee-term+mux
   vee-themes
   vee-ui
   vee-yaml
   vee-dash

   ))
