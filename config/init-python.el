(use-package conda
  :init
  (setq conda-env-home-directory (expand-file-name "/home/binwan/.conda/"))
  (setq conda-anaconda-home (expand-file-name "/opt/anaconda/"))
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

(use-package lsp-python-ms
  :init
  (setq py-autopep8-enable-on-save t)
  :config (conda-env-autoactivate-mode t)
  :hook (python-mode . lsp)
  )

;; ;; (require-package 'company-jedi)
;; ;; (defun my/python-mode-hook ()
;; ;;   (add-to-list 'company-backends 'company-jedi))

;; ;; (add-hook 'python-mode-hook 'my/python-mode-hook)

;; (setq jedi:setup-keys t)  
;; (setq jedi:complete-on-dot t) 
;; ;; (require-package 'anaconda-mode)
;; ;; (add-hook 'python-mode-hook 'anaconda-mode)
;; ;; (add-hook 'python-mode-hook 'anaconda-eldoc-mode)

;; ;; (require-package 'company-anaconda)
;; ;; (eval-after-load "company"
;; ;;   '(add-to-list 'company-backends 'company-anaconda))


;; (setq elpy-rpc-backend "jedi")


;; (require-package 'company-jedi)
;; (defun my-python-mode-hook ()
;;   (add-to-list 'company-backends 'company-jedi))

;; (add-hook 'python-mode-hook 'my-python-mode-hook)

(provide 'init-python)
