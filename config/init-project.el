(use-package helm-projectile)

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :config
  (helm-projectile-on)
  (setq projectile-project-search-path '("~/Documents/fnlinker/" "~/Documents/binwan-dev/"))
  (setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)
	      ("C-c C-p" . projectile-switch-project)
	      ("C-c p r" . projectile-discover-projects-in-search-path)))

(defun binwan-load-archpc-project()
  (interactive)
  (append projectile-project-search-path '("/ssh:fnlinker-archpc:/home/binwan/Documents/fnlinker/" "/ssh:fnlinker-archpc:/home/binwan/Documents/binwan-dev/"))
  (projectile-discover-projects-in-search-path))

(defun binwan-unload-archpc-project()
  (interactive)
  (remove projectile-project-search-path '("/ssh:fnlinker-archpc:/home/binwan/Documents/fnlinker/" "/ssh:fnlinker-archpc:/home/binwan/Documents/binwan-dev/"))
  (projectile-discover-projects-in-search-path))

(provide 'init-project)
