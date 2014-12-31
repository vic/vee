(setq evil-leader/in-all-states 1)

(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "SPC" 'evil-execute-in-god-state
  "a" 'persp-mode-map
  "b" 'helm-mini
  "f" 'helm-find-files
  "g" 'helm-projectile-grep
  "m" 'magit-status
  "n" 'neotree-toggle
  "p" 'projectile-command-map
  "q" 'kill-this-buffer
  "r" 'helm-mini
  "s" 'helm-swoop
  "S" 'helm-multi-swoop-all
  "t" 'helm-projectile
  "u" 'undo-tree-visualize
  "v" 'helm-semantic-or-imenu
  "w" 'evil-window-map
  "x" 'helm-M-x
  "<tab>" 'persp-switch-quick-map
   )

(evil-leader/set-key-for-mode 'emacs-lisp-mode
  "E" 'eval-last-sexp
  "B" 'byte-compile-file)
