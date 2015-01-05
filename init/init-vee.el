(setq initial-scratch-message nil
      inhibit-startup-screen t)

(defun end-of-line-or-last-not-blank (&optional n)
  (interactive)
  (if (= (point) (save-excursion (end-of-line n) (point)))
      (skip-syntax-backward "-")
    (end-of-line n)))

(defun back-to-indentation-or-beginning (&optional n)
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (beginning-of-line n) (back-to-indentation)))


(defun vee:mac-custom nil
  (interactive)
  (setq mac-option-modifier 'meta)
  (setq mac-option-key-is-meta t)
  (setq mac-command-modifier 'control)
  (setq mac-command-key-is-meta nil))

(defun vee:untabify-buffer nil
  (interactive)
  (untabify (point-min) (point-max)))

(vee:mac-custom)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq ring-bell-function (lambda nil nil))

(define-key global-map [remap move-beginning-of-line]
  'back-to-indentation-or-beginning)
(define-key global-map [remap end-of-line] 'end-of-line-or-last-not-blank)
(define-key global-map [(control ?+)] 'text-scale-adjust)
(define-key global-map [(control ?-)] 'text-scale-adjust)
(define-key global-map [(control ?0)] 'text-scale-adjust)


(column-number-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(helm-mode 1)
(persp-mode 1)
(global-auto-complete-mode 1)

(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'vee:untabify-buffer)

(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)

(evil-mode 1)
(global-evil-leader-mode 1)

(require 'smyx-theme)

(set-cursor-color "cyan")

(unless window-system
  (menu-bar-mode -1))

(when window-system
  (server-start)
  (toggle-frame-fullscreen))

(require 'helm-projectile)

(with-current-buffer "*scratch*"
  (insert-image (create-image "~/.emacs.d/gnu-mad.png"))
  (insert "(require 'evil)")
  (goto-char (point-max)))
