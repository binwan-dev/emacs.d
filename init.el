(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))
(add-subdirs-to-load-path "~/.emacs.d/config/")

(require 'init)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(package-selected-packages
   '(lsp-mode yasnippet window-numbering which-key use-package spinner rainbow-mode rainbow-delimiters quelpa py-autopep8 powerline omnisharp olivetti mmm-mode mc-extras magit lv lsp-ui lsp-pyright hungry-delete highlight-indent-guides helm-projectile helm-gtags helm-ag go-projectile fullframe exec-path-from-shell doom-themes doom-modeline deferred dashboard conda company ccls)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
