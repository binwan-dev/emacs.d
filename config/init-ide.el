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
  (add-to-list 'auto-mode-alist '("\\.md\\'" . markdown-ts-appear-mode)))

(provide 'init-ide)
