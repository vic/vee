;; http://rawsyntax.com/blog/learn-emacs-zsh-and-multi-term/

(setq multi-term-program "/bin/zsh")
(add-hook 'term-mode-hook
          (lambda ()
            (setq term-buffer-maximum-size 10000)
            (setq show-trailing-whitespace nil)
	    (define-key term-raw-map (kbd "C-y") 'term-paste)
	    ))
