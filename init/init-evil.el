(evil-mode 1)

(setq evil-esc-delay 0)
(setq evil-shift-width 2)
(setq evil-default-cursor nil)


;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)
(evil-set-initial-state 'neotree-mode 'motion)

(global-evil-visualstar-mode)


(defun vee:term/last-buffer nil
  (-find (lambda (b) (eq 'term-mode (with-current-buffer b major-mode))) (buffer-list)))

(defun vee:term/send-last-command nil
  (interactive)
  (save-excursion
    (with-current-buffer (vee:term/last-buffer)
      (popwin:display-buffer-1 (current-buffer))
      (term-send-up)
      (term-send-return))))

(defun vee:term/toggle nil
  (interactive)
  (if (eq 'term-mode major-mode)
      (popwin:close-popup-window)
    (popwin:display-buffer-1 (or (vee:term/last-buffer)
				 (save-window-excursion
				   (call-interactively 'multi-term))))))


(define-key global-map (kbd "C-<return>") 'vee:term/toggle)
(define-key global-map (kbd "C-<backspace>") 'vee:term/send-last-command)

(evil-define-key 'normal global-map (kbd "<tab>") 'persp-switch-quick)
(evil-define-key 'normal global-map (kbd "<backtab>") 'persp-cycle)
(evil-define-key 'normal global-map (kbd "C-]") 'keyboard-escape-quit)
(evil-define-key 'normal global-map (kbd "C-\\") 'evil-jump-to-tag)

(evil-define-key 'normal global-map (kbd "t") 'evil-ace-jump-char-to-mode)
(evil-define-key 'normal global-map (kbd "C-t") 'helm-projectile)
(evil-define-key 'motion global-map (kbd ";") 'evil-ex)


(evil-define-key 'normal global-map (kbd "C-D") 'mc/mark-all-like-this-dwim)
(evil-define-key 'visual global-map (kbd "C-D") 'mc/mark-all-like-this-dwim)
(evil-define-key 'emacs  global-map (kbd "C-D") 'mc/mark-all-like-this-dwim)

(evil-define-key 'normal global-map (kbd "C-d") 'mc/mark-next-like-this)
(evil-define-key 'visual global-map (kbd "C-d") 'mc/mark-next-like-this)
(evil-define-key 'emacs  global-map (kbd "C-d") 'mc/mark-next-like-this)

(define-key evil-window-map "q" 'kill-this-buffer)


