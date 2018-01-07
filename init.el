(package-initialize)

(add-to-list 'load-path "c:/emacs_x64/home/.emacs.d/lisp/")

;; define init-file func
(defun open-my-init-file ()
  (interactive)
  (find-file "C:/emacs_x64/home/.emacs.d/init.el"))

(require 'init-packages)
(require 'init-ui)
(require 'init-better-defaults)
(require 'init-org)
(require 'init-keybindings)
(require 'init-omnisharp)
(require 'init-helm)
(setq custom-file (expand-file-name "lisp/custom.el" user-emacs-directory))
(load-file custom-file)
