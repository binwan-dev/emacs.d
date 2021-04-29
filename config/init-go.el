(require-package 'go-projectile)
(require-package 'go-mode)

(use-package go-mode
  :ensure t
  :config
  (setq gofmt-command "goimports")
  (local-set-key (kbd "C-c t") 'go-test-current-file)
  (local-set-key (kbd "C-c s r") 'my-kill-go-server-fun)
  (add-hook 'before-save-hook 'gofmt-before-save)
  :hook (go-mode . lsp))

;; Optional - provides snippet support.
(use-package yasnippet
  :ensure t
  :commands yas-minor-mode
  :hook (go-mode . yas-minor-mode))


;; ;; (require-package 'protobuf-mode)
;; ;; (defconst protobuf-style
;; ;;   '((c-basic-offset . 2)
;; ;;     (indent-tabs-mode . nil)))

;; ;; (add-hook 'protobuf-mode-hook
;; ;;           (lambda () (c-add-style "my-style" protobuf-style t)))

;; (defun my-kill-go-server-fun ()
;;   (interactive)
;;   (deferred:process-shell '"kill -9 `ps aux|grep gopls|grep -v grep |awk '{print $2}'`")
;;   (sleep-for 0.2)
;;   (lsp-restart-workspace))


(provide 'init-go)
