; -*- lexical-binding: t -*-
(setq debug-on-error t)

;;; This file bootstraps the configuration, which is divided into
;;; a number of other files.

(let ((minver "24.3"))
  (when (version< emacs-version minver)
    (error "Your Emacs is too old -- this config requires v%s or higher" minver)))
(when (version< emacs-version "24.5")
  (message "Your Emacs is old, and some functionality in this config will be disabled. Please upgrade if possible."))

(add-to-list 'load-path (expand-file-name "lisp" user-emacs-directory))
(require 'init-benchmarking) ;; Measure startup time

(defconst *spell-check-support-enabled* nil) ;; Enable with t if you prefer
(defconst *is-a-mac* (eq system-type 'darwin))

;;----------------------------------------------------------------------------
;; Adjust garbage collection thresholds during startup, and thereafter
;;----------------------------------------------------------------------------
(let ((normal-gc-cons-threshold (* 20 1024 1024))
      (init-gc-cons-threshold (* 128 1024 1024)))
  (setq gc-cons-threshold init-gc-cons-threshold)
  (add-hook 'after-init-hook
            (lambda () (setq gc-cons-threshold normal-gc-cons-threshold))))


;;(setq package-enable-at-startup nil)
(package-initialize)

;; define init-file func
(defun open-my-init-file ()
  (interactive)
  (find-file "~/.emacs.d/init.el"))

(require 'init-utils)
(require 'init-packages)
(require 'init-elpa)
(require 'init-exec-path-shell)
(require 'init-term)
(require 'init-themes)
(require 'init-ui)
(require 'init-powerline)
(require 'init-window)
(require 'init-better-defaults)
(require 'init-dired)
(require 'init-mmm)
(require 'init-yasnippet)
(require 'init-omnisharp)
(require 'init-helm)
(require 'init-helm-tag)
(require 'init-python)
(require 'init-go)
(require 'init-keybindings)
(require 'init-fci)
(require 'init-multi-cursors)
(require 'init-mssql)
(require 'init-undo-tree)
(require 'init-dashboard)
(require 'init-magit)
(require 'init-tab)
(require 'init-org)
(require 'init-project)
(require 'init-diminish)
(require 'init-vue)

(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
(put 'upcase-region 'disabled nil)
(put 'scroll-left 'disabled nil)
