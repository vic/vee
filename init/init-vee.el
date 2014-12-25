(evil-mode 1) 
(tool-bar-mode -1)
(setq ring-bell-function (lambda nil nil))

(require 'smyx-theme)

(defun vee/mac-custom nil
  (interactive)
  (setq mac-option-modifier 'meta)
  (setq mac-option-key-is-meta t)
  (setq mac-command-modifier 'control)
  (setq mac-command-key-is-meta nil))

(vee/mac-custom)
