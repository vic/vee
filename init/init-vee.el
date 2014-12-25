(setq sml/no-confirm-load-theme t)

(defun vee/mac-custom nil
  (interactive)
  (setq mac-option-modifier 'meta)
  (setq mac-option-key-is-meta t)
  (setq mac-command-modifier 'control)
  (setq mac-command-key-is-meta nil))

(vee/mac-custom)
(setq ring-bell-function (lambda nil nil))

(column-number-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(helm-mode 1)
(persp-mode 1)

(sml/setup)
(sml/apply-theme 'dark)


(evil-mode 1) 

(require 'smyx-theme)

(set-frame-font "-*-Monaco-normal-normal-normal-*-12-*-*-*-m-0-fontset-auto2")
