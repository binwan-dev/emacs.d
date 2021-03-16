(require-package 'lsp-mode)
(require-package 'lsp-ui)

(use-package lsp-pyright
  :ensure t)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-mode
  :init
  (setq lsp-file-watch-threshold 102400)
  :bind (("C-c j" . lsp-find-definition))
  :hook
  (csharp-mode . lsp)
  (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))


(provide 'init-lspmode)
