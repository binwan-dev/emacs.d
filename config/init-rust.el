(use-package rust-mode
  :config
  (setq rust-format-on-save t)
  :bind (("C-c C-c" . rust-run))
  :hook (rust-mode .
		   (lambda ()
		     (setq indent-tabs-mode nil)
		     (prettify-symbols-mode)
		     (lsp))))

(provide 'init-rust)
