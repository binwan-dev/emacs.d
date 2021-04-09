(require-package 'lsp-ui)
(require-package 'py-autopep8)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

(use-package lsp-mode
  ;; :init
  ;; (setq lsp-file-watch-threshold 102400)
  :bind (("C-c j" . lsp-find-definition)))

;; (use-package lsp-python-ms
;;   :ensure t
;;   :init (setq lsp-python-ms-auto-install-server t)
;;   :hook
;;   (python-mode . (lambda ()
;;                           (require 'lsp-python-ms)
;;                           (lsp))))  ; or lsp-deferred

(use-package py-autopep8
  :hook (python-mode . py-autopep8-enable-on-save))


(use-package lsp-pyright
  :ensure t
  :config
  (setq lsp-pyright-venv-path "/home/binwan/anaconda3/envs")
  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-auto-search-paths t)
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(use-package csharp-mode
  :ensure t
  :config
  (setq lsp-csharp-server-path "/opt/omnisharp-linux/run")
  :hook (csharp-mode . lsp))

(use-package ccls
  :ensure t
  :config
  (setq ccls-executable "/usr/bin/ccls")
  :hook (ccls . lsp))

(provide 'init-lspmode)
