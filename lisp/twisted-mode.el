;;; ----------------------------------------------------------------
;;; twisted-mode, Miles Bader <miles /at/ gnu.org>

(defvar twisted-mode-map
  (let ((map (make-sparse-keymap)))
    (define-key map [remap self-insert-command] 'self-insert-twisted)
    (define-key map [remap delete-backward-char] 'delete-char)
    (define-key map [remap backward-delete-char] 'delete-char)
    (define-key map [remap backward-delete-char-untabify] 'delete-char)
    map)
  "Keymap for `twisted-mode'.")

(define-minor-mode twisted-mode
  "When enabled, self-inserting characters are inserted in \"twisted\" form
   See the variable `twisted-mapping' for the mapping used."
  :lighter " pǝʇsᴉʍT")

(defvar twisted-mapping
  '((?a . ?ɐ) (?b . ?q) (?c . ?ɔ) (?d . ?p)
    (?e . ?ǝ)           (?g . ?ᵷ) (?h . ?ɥ)
    (?i . ?ᴉ)           (?k . ?ʞ) ;(?l . ?ꞁ)
    (?m . ?ɯ) (?n . ?u)            (?p . ?d)
    (?q . ?b) (?r . ?ɹ)           (?t . ?ʇ)
    (?u . ?n) (?v . ?ʌ) (?w . ?ʍ)
    (?y . ?ʎ)
    (?, . ?‘) (?' . ?‚)
    (?. . ?˙) (?? . ?¿) (?! . ?¡)
    (?( . ?)) (?) . ?() (?[ . ?]) (?] . ?[)
    (?< . ?>) (?> . ?<)
    (?“ . ?„)
    )
  "Mapping from normal characters to twisted characters used by `self-insert-twisted'.")

(defun self-insert-twisted (arg)
  "Like `self-insert-command', but try to insert a twisted variant.
   The mapping from normal character to twisted characters is taken
   from `twisted-mapping'."
  (interactive "p")
  (let* ((initial-key (aref (this-command-keys-vector)
                            (- (length (this-command-keys-vector)) 1)))
	 (last-command-char
	  (or (cdr (assq initial-key twisted-mapping))
	      initial-key)))
    (setq last-command-event last-command-char)
    (self-insert-command arg)
    (backward-char arg)))

(provide 'twisted-mode)
