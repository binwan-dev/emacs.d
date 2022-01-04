(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode
  :init
  (add-hook 'lsp-mode-hook 'lsp-ui-mode)
  :config
  (setq lsp-ui-peek-enable t)
  (setq lsp-ui-doc-enable nil)
  (setq lsp-ui-imenu-enable t)
  (setq lsp-ui-flycheck-enable t)
  (setq lsp-ui-sideline-enable nil)
  (setq lsp-ui-sideline-ignore-duplicate t))

(use-package lsp-mode
  ;; :init
  ;; (setq lsp-file-watch-threshold 102400)
  :config
  (setq tab-width 4)
  (setq indent-tabs-mode 4)
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1)
  ;; (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  :bind (("C-c C-j" . lsp-find-definition)
	 ("C-c C-b" . pop-tag-mark)
	 ("C-c s s" . lsp-restart-workspace)
	 ("C-c C-c" . lsp-find-references)
	 ("C-." . lsp-execute-code-action)))

(use-package py-autopep8
  :hook (python-mode . py-autopep8-enable-on-save))


(use-package lsp-pyright
  :config
  (setq lsp-pyright-venv-path "/Users/bin/opt/anaconda3/envs")
  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-auto-search-paths t)
  :bind
  (("C-c j" . lsp-find-definition))
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))

(use-package ccls
  :config
  (setq ccls-executable "/usr/bin/ccls")
  :hook (ccls . lsp))

;; set for csharp
;; (use-package tree-sitter :ensure t)
;; (use-package tree-sitter-langs :ensure t)
;; (use-package tree-sitter-indent :ensure t)

(use-package csharp-mode
  :ensure t
  :hook (csharp-mode . lsp))


(provide 'init-lspmode)
