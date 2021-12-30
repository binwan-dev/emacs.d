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
 '(package-selected-packages
   '(exwm-systemtray exwm-config writeroom-mode writeroom yasnippet window-numbering which-key web-mode vue-mode use-package typescript-mode smartparens rainbow-mode rainbow-delimiters quelpa py-autopep8 omnisharp olivetti ob-restclient mc-extras magit lsp-ui lsp-pyright hungry-delete highlight-indent-guides helm-projectile helm-gtags go-projectile exwm exec-path-from-shell doom-themes doom-modeline deferred dashboard conda company-web ccls)))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
