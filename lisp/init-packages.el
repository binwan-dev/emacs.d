
;; Setting package source
(when (>= emacs-major-version 24)
  (require 'package)
  (package-initialize)
  (setq package-archives '(("gnu"   . "http://elpa.emacs-china.org/gnu/")
			   ("melpa" . "http://elpa.emacs-china.org/melpa/"))))

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

;; use js2-mode
;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       auto-mode-alist))

;; use nodejs-repl
(require 'nodejs-repl)

;;use swiper
;;(ivy-mode 1)
;;(setq ivy-use-virtual-buffers t)
;;(setq enable-recursive-minibuffers t)
;;(global-set-key "\C-s" 'swiper)

;; use monokai-theme
(load-theme 'monokai t)

;; popwin
(require 'popwin)
(popwin-mode 1)

(require 'helm-config)

(provide 'init-packages)
