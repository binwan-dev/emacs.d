;;; appearance
(add-hook 'window-setup-hook #'toggle-frame-maximized t) ; full screen
;; center display
(use-package writeroom-mode
  :config
  (setq writeroom-width 160
        writeroom-bottom-divider-width 0
        writeroom-fringes-outside-margins t
        writeroom-fullscreen-effect nil
        writeroom-major-modes '(text-mode prog-mode conf-mode special-mode Info-mode dired-mode)
        writeroom-maximize-window nil
        writeroom-mode-line t
        writeroom-mode-line-toggle-position 'mode-line-format)
  ;; (add-to-list 'auto-mode-alist '("\\.proto?\\'" . writeroom-mode))
  :hook
  (emacs-startup . global-writeroom-mode))
;;; 

;;; bars
(tool-bar-mode -1)
(menu-bar-mode -1)
(scroll-bar-mode -1)

;;; theme
(add-subdirs-to-load-path "~/.emacs.d/config/themes")
(require 'init-doom) ; use doom theme
;; (require 'init-material-ocean)
;; (load-theme 'material-ocean-dark t)
; use dashboard
(use-package dashboard
  :config
  (dashboard-setup-startup-hook)
  (setq dashboard-items '((recents  . 8)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5))))

;;; windows
; window number
(use-package window-numbering
  :init
  (window-numbering-mode))

(provide 'init-appearance)
