(require 'popwin)
(popwin-mode 1)


(setq display-buffer-function 'popwin:display-buffer)

(push '((lambda (b) (string-match-p "magit" (buffer-name b))) :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)

(push '(git-commit-mode :tail nil :position :bottom :height 16 :dedicated t) popwin:special-display-config)

(push '(term-mode :position :top :height 0.7 :dedicated t) popwin:special-display-config)

(push '(erc-mode :position :top :height 16 :dedicated t) popwin:special-display-config)

(push 'apropos-mode popwin:special-display-config)

(push '(" *undo-tree*" :width 0.3 :position right :dedicated t) popwin:special-display-config)

(push '(neotree-mode  :width 0.3 :position left :dedicated t) popwin:special-display-config)
