;; set default indent
(setq-default tab-width 4)
(setq-default indent-tabs-mode nil)

(use-package exec-path-from-shell
  :config
  (exec-path-from-shell-initialize)
  (exec-path-from-shell-copy-env "PATH")
  (exec-path-from-shell-copy-env "GO111MODULE")
  (exec-path-from-shell-copy-env "GOPROXY")
  (exec-path-from-shell-copy-env "GOPRIVATE"))

;; git
(use-package magit)

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

;; use lsp-bridge
;; (require 'init-lsp-bridge)

;; (use-package eglot
;;   :hook (prog-mode . eglot-ensure)
;;   :config
;;   (setq eglot-events-buffer-size 0)
;;   :bind (
;; 	 ("C-c s s" . eglot-reconnect)
;; 	 ("C-." . eglot-code-actions)
;; 	 ("C-c C-j" . xref-find-definitions)
;; 	 ("C-c C-r" . xref-find-references)
;; 	 ("C-c C-i" . eglot-find-implementation)
;; 	 ("C-C t b" . pop-tag-mark)))

(provide 'init-ide)
