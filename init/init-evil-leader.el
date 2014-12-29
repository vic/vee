(setq evil-leader/in-all-states 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "." 'evil-execute-in-emacs-state
  "," 'evil-execute-in-god-state
  "f" 'helm-projectile
  "g" 'helm-projectile-grep
  "m" 'magit-status
  "p" 'persp-switch
  "q" 'toggle-read-only
  "u" 'undo-tree-visualize
  "v" 'helm-semantic-or-imenu
  "x" 'helm-M-x
   )
