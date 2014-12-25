(evil-mode 1)

(define-key evil-normal-state-map (kbd "t") 'evil-ace-jump-char-to-mode)
(define-key evil-normal-state-map (kbd "C-S-T") 'helm-projectile-grep)
(define-key evil-normal-state-map (kbd "C-t") 'helm-projectile)

(define-key evil-motion-state-map (kbd "C-e") 'evil-last-non-blank)

(setq evil-leader/in-all-states 1)
(global-evil-leader-mode)

(setq evil-shift-width 2)
(setq evil-want-C-i-jump t)
(setq evil-want-C-u-scroll t)
(setq evil-complete-all-buffers nil)

(setq evil-default-cursor t)
(set-cursor-color "cyan")

;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)

(evil-surround-mode 1)
(global-evil-visualstar-mode)

(setq evil-esc-delay 0)
(evil-leader/set-leader ",")
(evil-leader/set-key
  "p" 'persp-switch
  "g" 'magit-status
  )
