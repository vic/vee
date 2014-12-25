(setq evil-leader/in-all-states 1)

(evil-leader/set-leader ",")
(evil-leader/set-key
  "p" 'persp-switch
  "g" 'magit-status
  "u" 'undo-tree-visualize
  "q" 'toggle-read-only
  )
