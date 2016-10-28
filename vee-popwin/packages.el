;;; packages.el --- vee-popwin layer packages file for Spacemacs.
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
;; added to `vee-popwin-packages'. Then, for each package PACKAGE:
;;
;; - If PACKAGE is not referenced by any other Spacemacs layer, define a
;;   function `vee-popwin/init-PACKAGE' to load and initialize the package.

;; - Otherwise, PACKAGE is already referenced by another Spacemacs layer, so
;;   define the functions `vee-popwin/pre-init-PACKAGE' and/or
;;   `vee-popwin/post-init-PACKAGE' to customize the package as it is loaded.

;;; Code:

(defconst vee-popwin-packages
  '(popwin)
  "The list of Lisp packages required by the vee-popwin layer.

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


(defun vee-popwin/post-init-popwin nil
  (use-package popwin
    :config
    (vee-popwin/special-buffers))
  (require 'popwin))


(defun vee-popwin/special-buffers nil
  nil)

(defun vee-popwin/bad-apples nil
  (push '("Anaconda" :regexp t :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '("alchemist" :regexp t :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '("magit" :regexp t :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '(git-commit-mode :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '("term:fish.*" :regexp t :position :top :height 0.3 :dedicated t :tail nil) popwin:special-display-config)
  (push '("term:side.*" :regexp t :position :right :width 0.5 :dedicated t :tail nil) popwin:special-display-config)
  (push '(erc-mode :position :top :height 16 :dedicated t) popwin:special-display-config)
  (push 'apropos-mode popwin:special-display-config)
  (push '(" *undo-tree*" :width 0.3 :position right :dedicated t) popwin:special-display-config)
  (push '(neotree-mode  :width 0.3 :position left :dedicated t) popwin:special-display-config))


;;; packages.el ends here
