(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :config
  (setq projectile-project-search-path '("~/Documents/binwan-dev/project" "~/Documents/bsi" "~/Documents/omnisolu"))
  (setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)
	      ("C-c C-p s" . projectile-switch-project)
	      ("C-c C-p r" . projectile-discover-projects-in-search-path)))

(provide 'init-projectile)
