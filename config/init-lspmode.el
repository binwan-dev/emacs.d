(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-mode
  ;; :init
  ;; (setq lsp-file-watch-threshold 102400)
  :bind (("C-c j" . lsp-find-definition))
  :hook
  (csharp-mode . lsp))

(use-package lsp-python-ms
  :ensure t
  :init (setq lsp-python-ms-auto-install-server t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-python-ms)
                          (lsp))))  ; or lsp-deferred


(provide 'init-lspmode)
