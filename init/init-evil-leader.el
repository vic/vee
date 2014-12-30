(setq evil-leader/in-all-states 1)

(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "SPC" 'save-buffer
  "." 'evil-execute-in-emacs-state
  "," 'evil-execute-in-god-state
  "b" 'helm-buffers-list
  "f" 'helm-find-files
  "g" 'helm-projectile-grep
  "m" 'magit-status
  "p" 'persp-switch
  "q" 'kill-this-buffer
  "t" 'helm-projectile
  "u" 'undo-tree-visualize
  "v" 'helm-semantic-or-imenu
  "w" 'evil-window-map
  "x" 'helm-M-x
   )

(evil-leader/set-key-for-mode 'emacs-lisp-mode
  "E" 'eval-last-sexp
  "B" 'byte-compile-file)
