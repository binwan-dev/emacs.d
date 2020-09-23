;; (require-package 'spacemacs-theme)
;; (require-package 'dracula-theme)
(require-package 'doom-themes)
;; (load-theme 'spacemacs-dark t)

(use-package doom-themes
  :config
  ;; Global settings (defaults)
  (setq doom-themes-enable-bold t    ; if nil, bold is universally disabled
        doom-themes-enable-italic t) ; if nil, italics is universally disabled
  (load-theme 'doom-city-lights t)

  ;; Enable flashing mode-line on errors
  (doom-themes-visual-bell-config)
  
  ;; Enable custom neotree theme (all-the-icons must be installed!)
  (doom-themes-neotree-config)
  ;; or for treemacs users
  (setq doom-themes-treemacs-theme "doom-colors") ; use the colorful treemacs theme
  (doom-themes-treemacs-config)
  
  ;; Corrects (and improves) org-mode's native fontification.
  (doom-themes-org-config))

(provide 'init-themes)

;; (require 'color-theme-sanityinc-solarized)
;; (require 'color-theme-sanityinc-tomorrow)

;; If you don't customize it, this is the theme you get.
;;(setq-default custom-enabled-themes '(sanityinc-tomorrow-bright))

;; ;; Ensure that themes will be applied even if they have not been customized
;; (defun reapply-themes ()
;;   "Forcibly load the themes listed in `custom-enabled-themes'."
;;   (dolist (theme custom-enabled-themes)
;;     (unless (custom-theme-p theme)
;;       (load-theme theme)))
;;   (custom-set-variables `(custom-enabled-themes (quote ,custom-enabled-themes))))

;; (add-hook 'after-init-hook 'reapply-themes)


;; ;;------------------------------------------------------------------------------
;; ;; Toggle between light and dark
;; ;;------------------------------------------------------------------------------
;; (defun light ()
;;   "Activate a light color theme."
;;   (interactive)
;;   (setq custom-enabled-themes '(sanityinc-tomorrow-day))
;;   (reapply-themes))

;; (defun dark ()
;;   "Activate a dark color theme."
;;   (interactive)
;;   (setq custom-enabled-themes '(sanityinc-tomorrow-bright))
;;   (reapply-themes))

;; (require-package 'dimmer)
;; (when (require 'dimmer)
;;   (setq-default dimmer-fraction 0.1)
;;   (add-hook 'after-init-hook 'dimmer-mode))
