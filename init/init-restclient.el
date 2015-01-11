(defun vee:restclient-buffer nil
  (interactive)
  (with-current-buffer (get-buffer-create "*restclient*")
    (switch-to-buffer (current-buffer))
    (restclient-mode)))
