(require-package 'projectile)
(require-package 'helm-projectile)

(use-package projectile
  :ensure t
  :init
  (projectile-mode 1)
  :config
  (helm-projectile-on)
  (setq projectile-project-search-path '("~/Documents/fnlinker/" "~/Documents/felix/"))
  (setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))
  :bind (:map projectile-mode-map
	      ("s-p" . projectile-command-map)
	      ("C-c p" . projectile-command-map)
	      ("C-c C-p" . projectile-switch-project)
	      ("C-c p r" . projectile-discover-projects-in-search-path)))

(provide 'init-project)
