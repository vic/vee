(defun persp-cycle-next nil (interactive) (persp-cycle '(4)))
(defun persp-cycle-prev nil (interactive) (persp-cycle '(16)))

(defun persp-cycle (&optional direction)
  (interactive "P")
  (persp-switch
   (when (< 1 (length (persp-all-names)))
     (cond
      ((eq nil direction) (persp-name persp-last))
      ((numberp direction) (car (-slice (persp-all-names) direction)))
      ((equal '(4) direction)
       (or (nth (1+ (persp-curr-position)) (persp-all-names))
	   (car (persp-all-names))))
      ((equal '(16) direction)
       (if (= 0 (persp-curr-position))
	   (car (last (persp-all-names)))
	 (nth (1- (persp-curr-position)) (persp-all-names))))))))
