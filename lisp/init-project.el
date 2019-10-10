(require-package 'projectile)
(require-package 'helm-projectile)
(projectile-mode 1)
(setq projectile-project-search-path '("~/Documents/fnlinker/"))
(define-key projectile-mode-map (kbd "s-p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c p") 'projectile-command-map)
(define-key projectile-mode-map (kbd "C-c C-p") 'projectile-switch-project)
(define-key projectile-mode-map (kbd "C-c p r") 'projectile-discover-projects-in-search-path)

(setq projectile-mode-line
      '(:eval (format " Projectile[%s]"
                      (projectile-project-name))))

(helm-projectile-on)

(provide 'init-project)
