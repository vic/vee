(defconst vee-treemacs-packages
  '(treemacs
    treemacs-evil
    treemacs-projectile
    )
  "The list of Lisp packages required by the vee-treemacs layer.

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

(defun vee-treemacs/init-treemacs-evil nil
  (use-package treemacs-evil
    :ensure t
    :demand t))

(defun vee-treemacs/init-treemacs-projectile nil
  (use-package treemacs-projectile
    :config
    (setq treemacs-header-function #'treemacs-projectile-create-header)
    :bind (:map spacemacs-default-map
                 ("pT" . treemacs-projectile)
                 ("pt" . treemacs-projectile-toggle))))


(defun vee-treemacs/init-treemacs nil
  (use-package treemacs
    :ensure t
    :defer t
    :config
    (progn
      (setq treemacs-follow-after-init          t
            treemacs-width                      35
            treemacs-indentation                2
            treemacs-git-integration            t
            treemacs-change-root-without-asking nil
            treemacs-sorting                    'alphabetic-desc
            treemacs-show-hidden-files          t
            treemacs-never-persist              nil
            treemacs-goto-tag-strategy          'refetch-index)

      (treemacs-follow-mode t)
      (treemacs-filewatch-mode t))
    :bind
    (:map global-map
          ([f8]        . treemacs-toggle)
          ("<C-M-tab>" . treemacs-toggle)
          ("M-0"       . treemacs-select-window)
          ("C-c 1"     . treemacs-delete-other-windows)
          :map spacemacs-default-map
          ("ft"    . treemacs-toggle)
          ("fT"    . treemacs)
          ("f C-t" . treemacs-find-file))))


;;; packages.el ends here
