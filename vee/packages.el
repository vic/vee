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
      popwin
      term+mux
      editorconfig
      sass-mode
      yaml-mode
      hydandata-light-theme
      idea-drakula-theme
      atom-one-dark-theme
      evil-god-state
      emacs
      ))

;; List of packages to exclude.
(setq vee-excluded-packages '())

(defun vee/init-pabbrev ()
  (require 'pabbrev)
  (global-pabbrev-mode t)
  (define-key pabbrev-mode-map (kbd "RET") 'pabbrev-expand-maybe)
  )

(defun vee/toggle-term (&optional name)
  (interactive)
  (if (eq 'term-mode major-mode)
      (popwin:close-popup-window)
    (setq name (or name "fish"))
    (term+mux-other-window
     (or (term+mux-session name)
         (term+mux-new-session name)))
    (popwin:stick-popup-window)))

(defun vee/init-evil-god-state ()
  ;;(require 'evil-god-state)

  (evil-leader/set-key (kbd "ESC") 'evil-execute-in-god-state)
  (add-hook 'evil-god-state-entry-hook (lambda () (diminish 'god-local-mode)))
  (add-hook 'evil-god-state-exit-hook (lambda () (diminish-undo 'god-local-mode)))
  (evil-define-key 'god global-map [escape] 'evil-god-state-bail))

(defun vee/init ()
  )

(defun vee/user ()
  (vee/init--popwin)

  (spacemacs/toggle-truncate-lines-off)
  (spacemacs/toggle-fringe-off)
  (golden-ratio-mode t)

  (setq-default
   truncate-lines t
   evil-shift-width 2
   js2-basic-offset 2
   git-magit-status-fullscreen t
   )

  (setq-default
   web-mode-code-indent-offset 2
   web-mode-markup-indent-offset 2
   css-indent-offset 2
   js-indent-level 2
   elm-indent-offset 4
   spacemacs-indent-sensitive-modes (add-to-list 'spacemacs-indent-sensitive-modes 'elm-mode)
   )

  (add-hook 'elm-mode-hook #'elm-oracle-setup-completion)

  (require 'editorconfig)
  (editorconfig-mode t)

  (evil-leader/set-key (kbd "f f") 'ido-find-file)
  (evil-global-set-key 'normal (kbd "U") 'undo-tree-redo)
  (evil-global-set-key 'normal (kbd "s-k") 'evil-jump-backward)
  (evil-global-set-key 'normal (kbd "s-j") 'evil-jump-forward)

  (evil-global-set-key 'normal (kbd "Q") 'kill-this-buffer)
  (evil-leader/set-key (kbd "b #") 'server-edit)

  (evil-global-set-key 'insert (kbd "<backtab>") 'company-complete-common-or-cycle)
  (evil-global-set-key 'replace (kbd "<backtab>") 'company-complete-common-or-cycle)

  ;;(evil-leader/set-key (kbd "b #") 'server-buffer-done)
  ;;(evil-leader/set-key (kbd "b q") 'kill-buffer-if-not-modified)
  ;;(evil-leader/set-key (kbd "b Q") 'kill-buffer)
  ;;(evil-leader/set-key (kbd "b k") 'kill-buffer-and-window)

  (global-centered-cursor-mode t)


  )

(defun vee/init-term+mux ()
  (require 'term)
  (require 'term+mux)
  (setq term-buffer-maximum-size 10000)
  (global-set-key (kbd "s-<backspace>") (lambda nil (interactive) (vee/toggle-term "fish")))
  (global-set-key (kbd "s-SPC") (lambda nil (interactive) (vee/toggle-term "side")))

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
  )

(defun vee/init--popwin nil
  (require 'popwin)
  (popwin-mode 1)
  (setq display-buffer-function 'popwin:display-buffer)

  (push '("alchemist" :regexp t :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '("magit" :regexp t :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '(git-commit-mode :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)
  (push '("term:fish.*" :regexp t :position :top :height 0.3 :dedicated t :tail nil) popwin:special-display-config)
  (push '("term:side.*" :regexp t :position :right :width 0.5 :dedicated t :tail nil) popwin:special-display-config)
  (push '(erc-mode :position :top :height 16 :dedicated t) popwin:special-display-config)
  (push 'apropos-mode popwin:special-display-config)
  (push '(" *undo-tree*" :width 0.3 :position right :dedicated t) popwin:special-display-config)
  (push '(neotree-mode  :width 0.3 :position left :dedicated t) popwin:special-display-config))

(defun vee/init-editorconfig nil
  (require 'editorconfig)
  (editorconfig-mode 1))

(defun vee/init-sass-mode nil
  (require 'sass-mode))

(defun vee/init-yaml-mode nil
  (require 'yaml-mode))


(defun vee/firacode nil
  "Enable code ligatures on firacode"
  (mac-auto-operator-composition-mode)
  (when (window-system)
    (set-default-font "Fira Code Light"))
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                 )
               ))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))

  )


;; For each package, define a function vee/init-<package-name>
;;
;; (defun vee/init-my-package ()
;;   "Initialize my package"
;;   )
;;
;; Often the body of an initialize function uses `use-package'
;; For more info on `use-package', see readme:
;; https://github.com/jwiegley/use-package
