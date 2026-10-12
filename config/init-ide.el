;; -*- lexical-binding: t; -*-

;; set default indent
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

;; git
(use-package magit)
  
(use-package smerge-mode
  :ensure t
  :bind (:map smerge-mode-map
         ("C-m" . smerge-keep-mine)
         ("C-o" . smerge-keep-other))
  :bind (("C-c C-g C-n" . smerge-vc-next-conflict)))

(use-package blamer
  :ensure t
  :bind (("s-i" . blamer-show-commit-info)
         ("C-c i" . blamer-show-posframe-commit-info))
  :defer 20
  :custom
  (blamer-idle-time 0.3)
  (blamer-min-offset 70)
  :custom-face
  (blamer-face ((t :foreground "#7a88cf"
                    :background nil
                    :italic t)))
  :config
  (global-blamer-mode 1))

;;; code tips
;; company
(use-package company
  :ensure t
  :init
  (setq company-minimum-prefix-length 3)
  (setq company-echo-delay 0.3)
  :config (global-company-mode t)
  :bind (("C-c <tab>" . #'global-company-mode))
  :bind (:map company-active-map
	      ("M-n" . nil)
	      ("M-p" . nil)
	      ("C-n" . #'company-select-next)
	      ("C-p" . #'company-select-previous)))

(add-subdirs-to-load-path "~/.emacs.d/config/themes") ;; load ide directory

;; protobuf file
(use-package protobuf-mode
  :config
  (add-to-list 'auto-mode-alist '("\\.proto\\'" . protobuf-mode)))

;; use lsp
(require 'init-lsp)

;; markdown
(use-package markdown-ts-appear
  :ensure t
  :hook (markdown-ts-mode . markdown-ts-appear-mode))

;; dap
(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-ui-mode)
  (dap-stopped . (lambda (arg) (call-interactively #'dap-hydra)))
  (dap-terminated . (binwan-dap-terminate-clean-file))
  :config
  ;; go 
  (require 'dap-dlv-go)
  
  ;; 3. 启用 launch.json 支持
  (require 'dap-launch))

(defun binwan-dap-terminate-clean-file()
  (lambda (session)
    ;; 获取当前调试项目的根目录
    (let* ((root (dap--session-workspace-folder session))
           (bin-path (expand-file-name "__debug_bin" root))
           (bin-exe-path (expand-file-name "__debug_bin.exe" root)))
      ;; 如果存在临时编译文件，则将其强行删除
      (when (file-exists-p bin-path)
        (delete-file bin-path)
        (message "[dap-go] 清理了遗留的调试二进制文件: __debug_bin"))
      (when (file-exists-p bin-exe-path)
        (delete-file bin-exe-path)
        (message "[dap-go] 清理了遗留的调试二进制文件: __debug_bin.exe")))))

(provide 'init-ide)
