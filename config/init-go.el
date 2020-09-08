(require-package 'go-projectile)
(require-package 'lsp-mode)
(require-package 'lsp-ui)

;; Prefer goimports to gofmt if installed
(let ((goimports (executable-find "goimports")))
  (when goimports
    (setq gofmt-command goimports)))

(add-hook 'before-save-hook 'gofmt-before-save nil t)
;; (whitespace-toggle-options '(tabs))
;;   (set (make-local-variable 'company-backends) '(company-go))

(use-package lsp-mode
  :ensure t
  :commands (lsp lsp-deferred)
  :hook (go-mode . lsp-deferred))

;; Optional - provides fancier overlays.
(use-package lsp-ui
  :ensure t
  :commands lsp-ui-mode)


;; Company mode is a standard completion package that works well with lsp-mode.
(use-package company
  :ensure t
  :config
  ;; Optionally enable completion-as-you-type behavior.
  (setq company-idle-delay 0)
  (setq company-minimum-prefix-length 1))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))


(defun go-mode-defaults ()
  (interactive)  
  (local-set-key (kbd "C-c C-b") 'pop-tag-mark)
  (local-set-key (kbd "C-c t") 'go-test-current-file)
  (local-set-key (kbd "C-c C-j") 'lsp-find-definition)
  (local-set-key (kbd "C-c s s") 'lsp-restart-workspace)
  (local-set-key (kbd "C-c s r") 'my-kill-go-server-fun)
  (local-set-key (kbd "C-c C-c") 'lsp-find-references)
  (add-hook 'before-save-hook #'lsp-format-buffer t t)
  (add-hook 'before-save-hook #'lsp-organize-imports t t)
  (setq tab-width 4))

(add-hook 'go-mode-hook 'go-mode-defaults)

;; ;; (require-package 'protobuf-mode)
;; ;; (defconst protobuf-style
;; ;;   '((c-basic-offset . 2)
;; ;;     (indent-tabs-mode . nil)))

;; ;; (add-hook 'protobuf-mode-hook
;; ;;           (lambda () (c-add-style "my-style" protobuf-style t)))

(defun my-kill-go-server-fun ()
  (interactive)
  (deferred:process-shell '"kill -9 `ps aux|grep gopls|grep -v grep |awk '{print $2}'`")
  (sleep-for 0.2)
  (lsp-restart-workspace))


(provide 'init-go)
