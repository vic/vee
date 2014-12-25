(add-to-list 'load-path "~/.emacs.d/el-get/el-get")

(setq-default el-get-user-package-directory "~/.emacs.d/init")

(unless (require 'el-get nil 'noerror)
  (require 'package)
  (add-to-list 'package-archives
               '("melpa" . "http://melpa.org/packages/"))
  (package-refresh-contents)
  (package-initialize)
  (package-install 'el-get)
  (require 'el-get))

(add-to-list 'el-get-recipe-path "~/.emacs.d/recipes")
(el-get 'sync)
(el-get 'sync 'vee)



