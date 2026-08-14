(use-package ghostel
  :ensure t
  :config
  (global-set-key (kbd "C-x C-t") 'ghostel)
  (global-set-key (kbd "C-x p t") 'ghostel-project))


(provide 'init-terminal)
