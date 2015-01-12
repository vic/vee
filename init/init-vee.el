(global-auto-complete-mode 1)

(setq initial-scratch-message nil
      inhibit-startup-screen t)

(defun end-of-line-or-last-not-blank (&optional n)
  (interactive)
  (if (= (point) (save-excursion (end-of-line n) (point)))
      (skip-syntax-backward "-")
    (end-of-line n)))

(defun back-to-indentation-or-beginning (&optional n)
  (interactive)
  (if (= (point) (save-excursion (back-to-indentation) (point)))
      (beginning-of-line)
    (beginning-of-line n) (back-to-indentation)))


(defun vee:mac-custom nil
  (interactive)
  (setq mac-option-modifier 'meta)
  (setq mac-option-key-is-meta t)
  (setq mac-command-modifier 'control)
  (setq mac-command-key-is-meta nil))

(defun vee:untabify-buffer nil
  (interactive)
  (untabify (point-min) (point-max)))

(vee:mac-custom)

(setq backup-directory-alist
      `((".*" . ,temporary-file-directory)))
(setq auto-save-file-name-transforms
      `((".*" ,temporary-file-directory t)))
(setq ring-bell-function (lambda nil nil))

(define-key global-map [remap move-beginning-of-line]
  'back-to-indentation-or-beginning)
(define-key global-map [remap end-of-line] 'end-of-line-or-last-not-blank)
(define-key global-map [(control ?+)] 'text-scale-adjust)
(define-key global-map [(control ?-)] 'text-scale-adjust)
(define-key global-map [(control ?0)] 'text-scale-adjust)


(column-number-mode 1)
(tool-bar-mode -1)
(scroll-bar-mode -1)

(helm-mode 1)
(persp-mode 1)


(setq-default indent-tabs-mode nil)
(add-hook 'before-save-hook 'delete-trailing-whitespace)
(add-hook 'before-save-hook 'vee:untabify-buffer)

(setq sml/no-confirm-load-theme t)
(sml/setup)
(sml/apply-theme 'dark)

(evil-mode 1)
(global-evil-leader-mode 1)

(require 'smyx-theme)

(set-cursor-color "cyan")

(unless window-system
  (menu-bar-mode -1))

(when window-system
  (server-start)
  (toggle-frame-fullscreen))

(require 'helm-projectile)


(with-current-buffer (get-buffer-create "*scratch*")
  (delete-region (point-min) (point-max))
  (insert (concat "
"

(propertize "Finish one thing today.\n"
 'font-lock-face '(:height 8.0 :inherit variable-pitch))

(propertize "just. one. little. thing.\n"
 'font-lock-face '(:height 7.0 :inherit variable-pitch))

"
\n\n
It doesn’t have to be big.

it doesn’t have to be important.

it doesn’t have to be perfect.

It doesn’t have to be revolutionary.

It doesn’t have to be new.

It doesn’t have to have bells and whistles.

It doesn’t have to impress other people.

It doesn’t have to mean anything.

It doesn’t have to change the world.

It doesn’t have follow the latest trends.

it just needs to be finished.

\n\n
If it’s too big, break it into smaller chunks.

If it’s too hard, break it into easier chunks.

If it’s too daunting, break it into manageable chunks.

If it’s too scary, face the fear head on.

ship one thing today.

\n\n
If you don’t have the time, wake up 30 minutes earlier.

If you don’t have the drive, get it by forming a habit.

If you don’t have the knowledge, make learning today’s goal.

If you don’t have the resources, start small.

If you don’t have an idea, imitate something else.

release it to the world.

\n\n
You will be scared.

You will think it’s not important enough.

You will think nobody will care.

You will overestimate its importance.

You will sometimes fail.

\n\n
but it’s ok, you will have something to show for it.
then once you are done…

celebrate…

rest…

then do the same thing again tomorrow.
")))
