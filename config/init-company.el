;; company
(require-package 'company)
(global-company-mode)

(setq company-minimum-prefix-length 1)
(setq company-echo-delay 0)

(global-set-key (kbd "C-c <tab>") #'global-company-mode)

(provide 'init-company)
