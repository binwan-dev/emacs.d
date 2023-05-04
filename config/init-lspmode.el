(setq js-indent-level 2)

(use-package csharp-mode :ensure t)
(use-package vue-mode :ensure t
  :config
  (setq web-mode-code-indent-offset 2))
(use-package py-autopep8
  :hook
  (python-mode . py-autopep8-mode))
(use-package lsp-pyright
  :config
  (setq lsp-pyright-venv-path "/Users/binwan/opt/anaconda3/envs")
  (setq lsp-pyright-auto-import-completions t)
  (setq lsp-pyright-auto-search-paths t)
  :bind
  (("C-c j" . lsp-find-definition))
  :hook (python-mode . (lambda ()
                          (require 'lsp-pyright)
                          (lsp))))
(use-package lsp-mode
  :init
  :hook ((csharp-mode . lsp)
	 (vue-mode . lsp)
	 (lsp-mode . lsp-enable-which-key-integration)
	 (json-mode . lsp))
  :config
  (lsp-ui-mode -1)
  ;; for typescript/javascript
  ;; (setq lsp-typescript-auto-closing-tags t)
  ;; (setq lsp-typescript-format-enable t)
  ;; (setq lsp-javascript-auto-closing-tags t)
  
  (lsp-register-client
    (make-lsp-client :new-connection (lsp-tramp-connection "cls")
                     :major-modes '(csharp-mode)
                     :remote? t
                     :server-id 'csharp-ls-remote))
  :commands lsp
  :bind (
	 ("C-c s s" . lsp-restart-workspace)
	 ("C-." . lsp-execute-code-action)
	 ("C-c C-j" . lsp-find-definition)
	 ("C-c C-r" . lsp-find-references)
	 ("C-c C-i" . lsp-find-implementation)
	 ("C-C t b" . pop-tag-mark)))

;; (use-package lsp-ui :commands lsp-ui-mode)
(use-package helm-lsp :commands helm-lsp-workspace-symbol)
;; (use-package dap-mode)

(use-package web-mode
  :config
  (setq web-mode-code-indent-offset 4)
  (add-to-list 'auto-mode-alist '("\\.cshtml?\\'" . web-mode))
  (add-to-list 'auto-mode-alist '("\\.razor?\\'" . web-mode)))


;; ; lsp
;; (use-package lsp-ui
;;   :ensure t
;;   :commands lsp-ui-mode
;;   :init
;;   (add-hook 'lsp-mode-hook 'lsp-ui-mode)
;;   :config
;;   ;; (setq lsp-ui-peek-enable t)
;;   ;; (setq lsp-ui-doc-enable nil)
;;   ;; (setq lsp-ui-imenu-enable t)
;;   ;; (setq lsp-ui-flycheck-enable t)
;;   ;; (setq lsp-ui-sideline-enable nil)
;;   ;; (setq lsp-ui-sideline-ignore-duplicate t)
;;   )

;; (use-package lsp-mode
;;   ;; :init
;;   ;; (setq lsp-file-watch-threshold 102400)
;;   :config
;;   (setq tab-width 4)
;;   (setq indent-tabs-mode 4)
;;   (setq company-idle-delay 0)
;;   (setq company-minimum-prefix-length 1)  
;;   ;; (add-hook 'before-save-hook #'lsp-format-buffer t t)
;;   (add-hook 'before-save-hook #'lsp-organize-imports t t)

;;   (lsp-register-client
;;     (make-lsp-client :new-connection (lsp-tramp-connection "rust-analyzer")
;;                      :major-modes '(rust-mode)
;;                      :remote? t
;;                      :server-id 'rust-remote))
  
;;   :bind (("C-c C-j" . lsp-find-definition)
;; 	 ("C-c C-b" . pop-tag-mark)
;; 	 ("C-c s s" . lsp-restart-workspace)
;; 	 ("C-c C-c" . lsp-find-references)
;; 	 ("C-." . lsp-execute-code-action))
;;   :hook (prog-mode . lsp-deferred))

;; ; csharp
;; (use-package tree-sitter)
;; (use-package tree-sitter-langs)
;; (use-package tree-sitter-indent)

;; (use-package csharp-mode
;;   :ensure t
;;   :config
;;   ;(setq tree-sitter-indent-offset 4)
;;   ;(tree-sitter-mode)
;;   ;; (add-to-list 'auto-mode-alist '("\\.cs\\'" . tree-sitter-mode))
;;   )


;; (use-package py-autopep8
;;   :hook (python-mode . py-autopep8-enable-on-save))


;; (use-package ccls
;;   :config
;;   (setq ccls-executable "/usr/bin/ccls")
;;   :hook (ccls . lsp))

;; ;; set for csharp
;; ;; (use-package tree-sitter :ensure t)
;; ;; (use-package tree-sitter-langs :ensure t)
;; ;; (use-package tree-sitter-indent :ensure t)

;; (use-package csharp-mode
;;   :ensure t
;;   :hook (csharp-mode . lsp))

;; (use-package vue-mode
;;   :config
;;   (setq-default
;;    web-mode-markup-indent-offset 2
;;    web-mode-code-indent-offset 2
;;    web-mode-css-indent-offset 2)
;;   (setq js2-basic-offset 2)
;;   (setq css-indent-offset 2)
;;   (setq js-indent-level 2)
;;   (setq lsp-javascript-format-enable t)
;;   :hook (vue-mode . (lambda ()
;; 		      (olivetti-mode)
;; 		      (lsp))))


(provide 'init-lspmode)
