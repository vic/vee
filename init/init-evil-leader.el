(setq evil-leader/in-all-states 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "." 'evil-execute-in-emacs-state
  "," 'evil-execute-in-god-state
  "p" 'persp-switch
  "g" 'magit-status
  "u" 'undo-tree-visualize
  "q" 'toggle-read-only
  "v" 'helm-semantic-or-imenu
   )
