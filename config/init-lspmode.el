(require-package 'lsp-mode)
(require-package 'lsp-ui)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-mode
  :bind (("C-c j" . lsp-find-definition)))
;; (add-hook 'lsp-mode-hook 'lsp-ui-mode)

(provide 'init-lspmode)
