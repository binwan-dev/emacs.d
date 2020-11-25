(use-package mc-extras :ensure t)

(use-package multiple-cursors
  :ensure t
  :config (mc/cua-rectangle-setup)
  :bind (
	 ("C-S-c C-S-c" . 'mc/edit-lines)
	 ("C->" . 'mc/mark-next-like-this)
	 ("C-<" . 'mc/mark-previous-like-this)
	 ("C-c C-<" . 'mc/mark-all-like-this)))

;; (defun mc/cursor-is-bar () nil)

;; (define-key mc/keymap (kbd "C-. C-d") 'mc/remove-current-cursor)
;; (define-key mc/keymap (kbd "C-. d")   'mc/remove-duplicated-cursors)
;; (define-key mc/keymap (kbd "C-. =")   'mc/compare-chars)

(provide 'init-multi-cursors)
