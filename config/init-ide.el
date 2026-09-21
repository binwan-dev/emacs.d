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
  :vc (markdown-ts-appear
       :url "https://github.com/Thysrael/markdown-ts-appear"
       :rev :newest)
  :hook (markdown-ts-mode . markdown-ts-appear-mode)
  :config
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-ts-mode)))

;; dap
(use-package dap-mode
  :ensure t
  :hook
  (lsp-mode . dap-ui-mode)
  (dap-stopped . (lambda (arg) (call-interactively #'dap-hydra)))
  :config
  ;; go 
  (require 'dap-dlv-go)
  
  ;; 3. 启用 launch.json 支持
  (require 'dap-launch)

  ;; go template
  (with-eval-after-load 'dap-go
    ;; 1. 调试当前 main 包（标准启动）
    (dap-register-debug-template
     "Go Launch Application"
     '(:type "go"
             :request "launch"
             :name "Go Launch Application"
             :mode "auto"
             :program "${workspaceFolder}"))

    ;; 2. 调试带命令行参数的程序 (运行时会提示你输入参数)
    (dap-register-debug-template
     "Go Launch with Args"
     '(:type "go"
             :request "launch"
             :name "Go Launch with Args"
             :mode "auto"
             :program "${workspaceFolder}"
             :args [])) ; 在这里修改或添加你的参数

    ;; 3. 调试特定的单元测试 (Test)
    (dap-register-debug-template
     "Go Debug Test"
     '(:type "go"
             :request "launch"
             :name "Go Debug Test"
             :mode "test"
             :program "${fileDirname}"))))

(provide 'init-ide)
