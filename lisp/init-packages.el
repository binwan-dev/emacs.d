;; Setting package source
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/")
			   ("qinghua" . "http://mirrors.tuna.tsinghua.edu.cn/elpa/melpa/"))))

(require 'cl)
;; my package list
(defvar frankwan/packages '(
			    company
			    monokai-theme
			    hungry-delete
			    smartparens
			    js2-mode
			    nodejs-repl
			    popwin
			    omnisharp
			    helm
			    web-mode
			    expand-region
			    popup
			    cnfonts
			    org-pomodoro
			    yasnippet
			    helm-ag
			    elpy
			    py-autopep8
			    counsel
			    go-mode
			    company-go
			    evil
			    evil-leader
			    window-numbering
			    evil-surround
			    evil-nerd-commenter
			    which-key
			    sql-indent
			    dotnet
			    iedit
			    color-theme-sanityinc-tomorrow
			    color-theme-sanityinc-solarized
			    ) "Default packages")
(setq package-selected-packages frankwan/packages)

(defun frankwan/packages-installed-p ()
  (loop for pkg in frankwan/packages
	when (not (package-installed-p pkg)) do (return nil)
	finally (return t)))

(unless (frankwan/packages-installed-p)
  (message "%s" "Refreshing package datbase...")
  (package-refresh-contents)
  (dolist (pkg frankwan/packages)
    (when (not (package-installed-p pkg))
      (package-install pkg))))


;; use huagry-delete
(require 'hungry-delete)
(global-hungry-delete-mode)

;;(add-hook 'emacs-lisp-mode-hook 'smartparens-mode)
(smartparens-global-mode t)
(sp-local-pair 'emacs-lisp-mode "'" nil :actions nil)

;; popwin
(require 'popwin)
;;(popwin-mode 1)

(require 'helm-config)

(require 'expand-region)
(global-set-key (kbd "C-=") 'er/expand-region)

(require 'org-pomodoro)

(require 'iedit)

(provide 'init-packages)
