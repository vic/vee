(evil-define-key 'motion global-map " " 'evil-execute-in-god-state)
(evil-define-key 'normal global-map " " 'evil-execute-in-god-state)
(evil-define-key 'god global-map [backspace] 'evil-god-state-bail)
(evil-define-key 'god global-map [escape] 'evil-god-state-bail)

(add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
(add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))

