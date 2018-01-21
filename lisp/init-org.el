
;; use org
(require 'org)

;; enable code light
(setq org-src-fontify-natively t)

;; set agenda config
(setq org-agenda-files '("~/org/"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; org capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Work Plan")
	 "* TODO {#B} %?\n %i\n"
	 :empty-lines 1)))
(global-set-key (kbd "C-c c") 'org-capture)

(provide 'init-org)
