;;; packages.el --- vee Layer packages File for Spacemacs
;;
;; Copyright (c) 2012-2014 Sylvain Benner
;; Copyright (c) 2014-2015 Sylvain Benner & Contributors
;;
;; Author: Sylvain Benner <sylvain.benner@gmail.com>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;; List of all packages to install and/or initialize. Built-in packages
;; which require an initialization must be listed explicitly in the list.

(setq vee-packages
    '(
      ;; package names go here
      emacs
      popwin
      term+mux
      ))

;; List of packages to exclude.
(setq vee-excluded-packages '())

(defun vee/toggle-term nil
  (interactive)
  (if (eq 'term-mode major-mode)
      (popwin:close-popup-window)
    (term+mux-other-window)))

(defun vee/init-emacs ()
  (setq truncate-lines t)
  (spacemacs/toggle-fringe-off))

(defun vee/init-term+mux ()
  (require 'term+mux)
  (setq term-buffer-maximum-size 10000)
  (global-set-key (kbd "s-\\") 'vee/toggle-term)

  (when nil add-hook 'term-mode-hook
            (lambda()
              (global-unset-key (kbd "C-r"))
              (global-unset-key (kbd "C-t"))
              (global-unset-key (kbd "C-d"))
              (global-unset-key (kbd "C-c"))
              )))

(defun vee/init-popwin nil
  (require 'popwin)
  (popwin-mode 1)
  (setq display-buffer-function 'popwin:display-buffer)

  (push '((lambda (b) (string-match-p "alchemist" (buffer-name b))) :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)

  (push '((lambda (b) (string-match-p "magit" (buffer-name b))) :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)

  (push '(git-commit-mode :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)

  (push '(term-mode :position :top :height 0.3 :dedicated t :tail nil) popwin:special-display-config)

  (push '(erc-mode :position :top :height 16 :dedicated t) popwin:special-display-config)

  (push 'apropos-mode popwin:special-display-config)

  (push '(" *undo-tree*" :width 0.3 :position right :dedicated t) popwin:special-display-config)

  (push '(neotree-mode  :width 0.3 :position left :dedicated t) popwin:special-display-config))

;; For each package, define a function vee/init-<package-name>
;;
;; (defun vee/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
