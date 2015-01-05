(global-set-key (kbd "C-c h") 'helm-projectile)
(global-set-key (kbd "M-x") 'helm-M-x)
(global-set-key (kbd "C-x b") 'helm-mini)
(global-set-key (kbd "C-x C-f") 'helm-find-files)

(defun helm-all-the-things nil
  (interactive)
  (helm :sources (append
		  '(
		   helm-source-projectile-files-in-all-projects-list
		   helm-source-recentf
		   helm-source-buffers-list
		   helm-source-findutils
		   helm-source-bookmarks
		   helm-source-locate))
	:buffer "*helm all the things*"))

(require 'popwin)
(push '("^\*helm .+\*$" :regexp t) popwin:special-display-config)
(push '("^\*helm-.+\*$" :regexp t) popwin:special-display-config)

(setq helm-ff-search-library-in-sexp        t
      helm-ff-file-name-history-use-recentf t
      helm-M-x-fuzzy-match t
      helm-buffers-fuzzy-matching t
      helm-recentf-fuzzy-match    t
      helm-semantic-fuzzy-match t
      helm-imenu-fuzzy-match    t)
