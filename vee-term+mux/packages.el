;;; packages.el --- vee-term+mux layer packages file for Spacemacs.
;;
;; Copyright (c) 2012-2016 Sylvain Benner & Contributors
;;
;; Author: vic <vic@mjolnir>
;; URL: https://github.com/syl20bnr/spacemacs
;;
;; This file is not part of GNU Emacs.
;;
;;; License: GPLv3

;;; Commentary:

;; See the Spacemacs documentation and FAQs for instructions on how to implement
;; a new layer:
;;
;;   SPC h SPC layers RET
;;
;;
;; Briefly, each package to be installed or configured by this layer should be
;; added to `vee-term+mux-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vee-term+mux/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vee-term+mux/pre-init-PACKAGE' and/or
;;   `vee-term+mux/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vee-term+mux-packages
  '(popwin term+mux)
  "The list of Lisp packages required by the vee-term+mux layer.

Each entry is either:

1. A symbol, which is interpreted as a package to be installed, or

2. A list of the form (PACKAGE KEYS...), where PACKAGE is the
    name of the package to be installed or loaded, and KEYS are
    any number of keyword-value-pairs.

    The following keys are accepted:

    - :excluded (t or nil): Prevent the package from being loaded
      if value is non-nil

    - :location: Specify a custom installation location.
      The following values are legal:

      - The symbol `elpa' (default) means PACKAGE will be
        installed using the Emacs package manager.

      - The symbol `local' directs Spacemacs to load the file at
        `./local/PACKAGE/PACKAGE.el'

      - A list beginning with the symbol `recipe' is a melpa
        recipe.  See: https://github.com/milkypostman/melpa#recipe-format")

(defun vee-term+mux/toggle-term (&optional name)
  (interactive)
  (if (eq 'term-mode major-mode)
      (popwin:close-popup-window)
    (setq name (or name "fish"))
    (term+mux-other-window
     (or (term+mux-session name)
         (term+mux-new-session name)))
    (popwin:stick-popup-window)))

(defun vee-term+mux/init-term+mux nil
  (use-package term+mux
    :init (require 'term)
    :config
    (setq term-buffer-maximum-size 10000)
    (global-set-key (kbd "s-<backspace>") (lambda nil (interactive) (vee-term+mux/toggle-term "fish")))
    (global-set-key (kbd "s-SPC") (lambda nil (interactive) (vee-term+mux/toggle-term "side")))

    (evil-define-key 'normal term-raw-map
      (kbd "s-k") 'erase-buffer
      (kbd "s-,") term+mux-map)

    (evil-define-key 'insert term-raw-map
      (kbd "s-k") 'erase-buffer
      (kbd "C-p") '(lambda () (interactive) (term-send-raw-string "\C-p"))
      (kbd "C-n") '(lambda () (interactive) (term-send-raw-string "\C-n"))
      (kbd "C-r") '(lambda () (interactive) (term-send-raw-string "\C-r"))
      (kbd "C-c") '(lambda () (interactive) (term-send-raw-string "\C-c"))
      (kbd "s-,") term+mux-map)
    ))

(defun vee-term+mux/post-init-popwin nil nil)

;;; packages.el ends here
