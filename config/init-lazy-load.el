;;; Code:

(defun lazy-load-global-keys (key-alist filename &optional key-prefix)
  (lazy-load-set-keys key-alist nil key-prefix)
  (dolist (element key-alist)
    (setq fun (cdr element))
    (autoload fun filename nil t)))

(defun lazy-load-local-keys (key-alist keymap filename &optional key-prefix)
  (lazy-load-set-keys key-alist keymap key-prefix)
  (dolist (element key-alist)
    (setq fun (cdr element))
    (autoload fun filename nil t)))

(defun lazy-load-set-keys (key-alist &optional keymap key-prefix)
  "This function is to little type when define key binding.
`KEYMAP' is a add keymap for some binding, default is `current-global-map'.
`KEY-ALIST' is a alist contain main-key and command.
`KEY-PREFIX' is a add prefix for some binding, default is nil."
  (let (key def)
    (or keymap (setq keymap (current-global-map)))
    (if key-prefix
        (setq key-prefix (concat key-prefix " "))
      (setq key-prefix ""))
    (dolist (element key-alist)
      (setq key (car element))
      (setq def (cdr element))
      (cond ((stringp key) (setq key (read-kbd-macro (concat key-prefix key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key def))))

(defun lazy-load-unset-keys (key-list &optional keymap)
  "This function is to little type when unset key binding.
`KEYMAP' is add keymap for some binding, default is `current-global-map'
`KEY-LIST' is list contain key."
  (let (key)
    (or keymap (setq keymap (current-global-map)))
    (dolist (key key-list)
      (cond ((stringp key) (setq key (read-kbd-macro (concat key))))
            ((vectorp key) nil)
            (t (signal 'wrong-type-argument (list 'array key))))
      (define-key keymap key nil))))

(provide 'init-lazy-load)
