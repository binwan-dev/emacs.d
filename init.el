;; for load sub directory config
(defun add-subdirs-to-load-path (dir)
  "Recursive add directories to `load-path'."
  (let ((default-directory (file-name-as-directory dir)))
    (add-to-list 'load-path dir)
    (normal-top-level-add-subdirs-to-load-path)))

;; ;; load unpublished script dir
(add-subdirs-to-load-path "~/.emacs.d/scripts/")

;; load config(
(add-subdirs-to-load-path "~/.emacs.d/config/")

(require 'init-config)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(package-selected-packages nil)
 '(package-vc-selected-packages
   '((tramp-rpc :url "https://github.com/ArthurHeymans/emacs-tramp-rpc"
                :lisp-dir "lisp")
     (opencode :url "https://github.com/colobas/opencode.el" :branch
               "main")
     (copilot :url "https://github.com/copilot-emacs/copilot.el"
              :branch "main")))
 '(warning-suppress-log-types '((copilot copilot-no-mode-indent)))
 '(warning-suppress-types '((copilot copilot-no-mode-indent))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
