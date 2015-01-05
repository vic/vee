(setq evil-leader/in-all-states t)

(evil-leader/set-leader "SPC")
(evil-leader/set-key
  "SPC" 'evil-execute-in-god-state
  "<tab>" 'persp-switch-quick-map
  "?" 'help-command
  "\\" 'helm-etags-select
  "b" 'helm-mini
  "f" 'helm-find-files
  "g" 'helm-projectile-grep
  "G" 'helm-google-suggest
  "m" 'magit-status
  "n" 'neotree-toggle
  "e" 'helm-all-the-things
  "p" 'projectile-commander
  "q" 'kill-this-buffer
  "r" 'helm-mini
  "s" 'helm-swoop
  "S" 'helm-multi-swoop-all
  "t" 'helm-projectile
  "u" 'undo-tree-visualize
  "v" 'helm-semantic-or-imenu
  "x" 'helm-M-x
  "w" 'evil-window-map)

(evil-leader/set-key-for-mode 'emacs-lisp-mode
  "E" 'eval-last-sexp
  "B" 'byte-compile-file)
