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
;; auto switch theme according to system dark mode (macOS)
(defvar system-dark-mode-last-state nil
  "Stores the last detected system dark mode state.")
(defun set-auto-switch-theme ()
  "Check system dark mode every 2 seconds and switch theme if changed."
  (interactive)
  (let* ((dark-mode-p (string= (shell-command-to-string
                                "printf %s \"$( osascript -e 'tell application \"System Events\" to tell appearance preferences to return dark mode' )\"")
                               "true"))
         (theme-changed? (not (eq dark-mode-p system-dark-mode-last-state))))
    (when theme-changed?
      (if dark-mode-p
          (progn
            (load-theme 'doom-one t)
            (message "Switched to dark theme (doom-one)"))
        (progn
          (load-theme 'doom-acario-light t)
          (message "Switched to light theme (doom-acario-light)"))))
    (setq system-dark-mode-last-state dark-mode-p))
  ;; Check every 60 seconds (you can adjust the interval as needed)
  (run-at-time 60 nil #'set-auto-switch-theme))

;; Initial check and theme setup
(if (eq system-type 'darwin)
    (progn
      (message "Detected macOS: Enabling auto theme switching...")
      (set-auto-switch-theme))
  (require 'init-doom)
  (message "Non-macOS: Loading default theme (init-doom)"))

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
