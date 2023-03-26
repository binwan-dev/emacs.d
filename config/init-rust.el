(use-package rust-mode
  :config
  (setq rust-format-on-save t)
  (setq rust-indent-offset 2)
  (setq lsp-rust-server 'rust-analyzer)
  (add-hook 'rust-mode-hook #'racer-mode)
  ;; Prefer `rust-analyzer' over `rls'
  (with-eval-after-load 'lsp-mode
    (when (executable-find "rust-analyzer")
      (setq lsp-rust-server 'rust-analyzer)))
  :bind (("C-c C-c" . rust-run)))

(provide 'init-rust)
