
(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 1)
  (setq company-echo-delay 0)
  :config (global-company-mode t)
  :bind (("C-c <tab>" . #'global-company-mode))
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . #'company-select-next)
	      ("C-p" . #'company-select-previous)))

(provide 'init-company)
