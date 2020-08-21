;; Setting package source
(when (>= emacs-major-version 24)
  (require 'package)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/")
			   ("qinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(require 'cl)

;; use huagry-delete
;;(require-package 'hungry-delete)
;;(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
;;(smartparens-global-mode t)
;;(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; popwin
;;(require-package 'popwin)
;;(popwin-mode 1)

;;(require-package 'helm-config)

;;(require-package 'expand-region)
;;(global-set-key (kbd "C-=") 'er/expand-region)

;;(require-package 'org-pomodoro)

;;(require-package 'iedit)

;;(require-package 'use-package)

(provide 'init-packages)
