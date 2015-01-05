(evil-mode 1)

(setq evil-esc-delay 0)
(setq evil-shift-width 2)
(setq evil-default-cursor nil)


;; Set the initial evil state that certain major modes will be in.
(evil-set-initial-state 'magit-log-edit-mode 'emacs)
(evil-set-initial-state 'nav-mode 'emacs)
(evil-set-initial-state 'grep-mode 'emacs)
(evil-set-initial-state 'ibuffer-mode 'normal)
(evil-set-initial-state 'neo-tree-mode 'motion)

(global-evil-visualstar-mode)


(setq vee/tab-map
      (let ((map (make-sparse-keymap)))
	(define-key map [remap self-insert-command] 'vee/tab-map/self-insert)
	(define-key map [remap delete-backward-char] 'delete-char)
	(define-key map [remap backward-delete-char] 'delete-char)
	(define-key map [remap backward-delete-char-untabify] 'delete-char)
	(define-key map (kbd "<tab>") 'persp-cycle)
	(keymap-canonicalize map)))
(fset 'vee/tab-map vee/tab-map)


(defun vee/tab-map/self-insert (x)
  (interactive "P")
  (message "ey"))

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
    (popwin:display-buffer-1 (or (vee:term/last-buffer) (multi-term)))))

(define-key global-map (kbd "C-<return>") 'vee:term/toggle)
(define-key global-map (kbd "C-<backspace>") 'vee:term/send-last-command)

(evil-define-key 'normal global-map (kbd "<tab>") 'vee/tab-map)
(evil-define-key 'normal global-map (kbd "C-]") 'keyboard-escape-quit)
(evil-define-key 'normal global-map (kbd "C-\\") 'evil-jump-to-tag)

(evil-define-key 'normal global-map (kbd "t") 'evil-ace-jump-char-to-mode)
(evil-define-key 'normal global-map (kbd "C-t") 'helm-projectile)
(evil-define-key 'motion global-map (kbd ";") 'evil-ex)

(evil-define-key 'visual global-map (kbd "C-d") 'mc/mark-next-like-this)
(evil-define-key 'normal global-map (kbd "C-D") 'mc/mark-all-like-this-dwim)


