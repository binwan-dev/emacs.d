;; I don't know why i use it?????
(use-package mmm-mode
  :ensure t
  :init
  (setq mmm-global-mode 'buffers-with-submode-classes)
  (setq mmm-submode-decoration-level 2)
  :config (require 'mmm-auto))

(provide 'init-mmm)
