
(use-package flycheck
  :bind (("C-c e" . #'flycheck-next-error)
	 ("C-c C-v" . #'flycheck-mode)
	 ("C-c v n" . #'flycheck-next-error)
	 ("C-c v p" . #'flycheck-previous-error)))

(provide 'init-flycheck)
