
;; use org
(require 'org)

;; enable code light
(setq org-src-fontify-natively t)

;; set agenda config
(setq org-agenda-file '("/mnt/e/Doc/org"))
(global-set-key (kbd "C-c a") 'org-agenda)

(provide 'init-org)
