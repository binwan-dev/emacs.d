(require-package 'flycheck)

;; flycheck
(global-set-key (kbd "C-c e") #'flycheck-next-error)
(global-set-key (kbd "C-c C-v") #'flycheck-mode)
(global-set-key (kbd "C-c v n") #'flycheck-next-error)
(global-set-key (kbd "C-c v p") #'flycheck-previous-error)

(provide 'init-flycheck)
