(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/local-package/")
(add-subdirs-to-load-path "~/.emacs.d/config/")

;; native-comp Settings for Emacs 28+ 
;;(when (and (fboundp 'native-comp-available-p)
;;	   (native-comp-available-p))
;;  (setq native-comp-async-report-warnings-errors nil
;;	comp-deferred-compilation t
;;	package-native-compile t)
;;  (add-to-list 'native-comp-eln-load-path
;;	       (expand-file-name "eln-cache" user-emacs-directory)))
;;(native-compile-async "~/.emacs.d/elpa-29.0")

(require 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages
   '(writeroom-mode fuo racer racer-mode bongo helm-rg helm-ag lsp-pyright py-autopep8 web-mode tide tree-sitter origami lsp-completion lsp coverlay ns-auto-titlebar fill-column-indicator json-mode typescript-mode tsx-mode blamer posframe lsp-treemacs treemacs-magit treemacs-icons-dired treemacs-tab-bar treemacs treemacs-projectile yaml-mode vue-mode company-lsp helm-lsp helm-tramp c++-mode ob-csharp ox-gfm nyan-mode eaf-browser edbi cnfonts yasnippet window-numbering which-key use-package tree-sitter-langs tree-sitter-indent rust-mode rainbow-mode rainbow-delimiters quelpa protobuf-mode olivetti mmm-mode meow mc-extras magit lsp-ui hungry-delete helm-projectile helm-gtags go-projectile flycheck exec-path-from-shell doom-themes doom-modeline dashboard csharp-mode conda company)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(blamer-face ((t :foreground "#7a88cf" :background nil :height 140 :italic t))))
