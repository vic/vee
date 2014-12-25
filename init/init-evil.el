(evil-mode 1)

(define-key evil-normal-state-map (kbd "t") 'evil-ace-jump-char-to-mode)
(define-key evil-normal-state-map (kbd "C-S-T") 'helm-projectile-grep)
(define-key evil-normal-state-map (kbd "C-t") 'helm-projectile)
