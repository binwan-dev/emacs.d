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
	      ("C-c C-p s" . projectile-switch-project)
	      ("C-c C-p r" . projectile-discover-projects-in-search-path)))

(provide 'init-project)
