(use-package dashboard
  :init
  (dashboard-setup-startup-hook)
  :config
  (setq dashboard-items '((recents  . 8)
                        (bookmarks . 5)
                        (projects . 5)
                        (agenda . 5)
                        (registers . 5)))
  )

(provide 'init-dashboard)
