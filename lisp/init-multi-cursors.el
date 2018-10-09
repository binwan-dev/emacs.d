(require-package 'multiple-cursors)

(defun mc/cursor-is-bar () nil)

(global-set-key (kbd "C-S-c C-S-c") 'mc/edit-lines)
(global-set-key (kbd "C->") 'mc/mark-next-like-this)
(global-set-key (kbd "C-<") 'mc/mark-previous-like-this)
(global-set-key (kbd "C-c C-<") 'mc/mark-all-like-this)

(require-package 'mc-extras)

;; (define-key mc/keymap (kbd "C-. C-d") 'mc/remove-current-cursor)
;; (define-key mc/keymap (kbd "C-. d")   'mc/remove-duplicated-cursors)
;; (define-key mc/keymap (kbd "C-. =")   'mc/compare-chars)

(mc/cua-rectangle-setup)

(provide 'init-multi-cursors)
