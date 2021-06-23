(require-package 'py-autopep8)
(require-package 'lsp-ui)

(use-package lsp-ui
  :hook (lsp-mode . lsp-ui-mode))

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
  :ensure t
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
  :ensure t
  :config
  (setq ccls-executable "/usr/bin/ccls")
  :hook (ccls . lsp))

(provide 'init-lspmode)
