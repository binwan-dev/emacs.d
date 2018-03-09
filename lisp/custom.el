
(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.08)
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(company-backends
   (quote
    (company-omnisharp company-bbdb company-nxml company-css company-eclim company-semantic company-cmake company-capf company-files
		       (company-dabbrev-code company-gtags company-etags company-keywords)
		       company-oddmuse company-dabbrev)))
 '(evil-leader/leader "SPC")
 '(global-company-mode t)
 '(helm-completing-read-handlers-alist
   (quote
    ((describe-function . helm-completing-read-symbols)
     (describe-variable . helm-completing-read-symbols)
     (describe-symbol . helm-completing-read-symbols)
     (debug-on-entry . helm-completing-read-symbols)
     (find-function . helm-completing-read-symbols)
     (disassemble . helm-completing-read-symbols)
     (trace-function . helm-completing-read-symbols)
     (trace-function-foreground . helm-completing-read-symbols)
     (trace-function-background . helm-completing-read-symbols)
     (find-tag . helm-completing-read-default-find-tag)
     (org-capture . helm-org-completing-read-tags)
     (org-set-tags . helm-org-completing-read-tags)
     (ffap-alternate-file)
     (tmm-menubar)
     (find-file)
     (find-file-at-point . helm-completing-read-sync-default-handler)
     (ffap . helm-completing-read-sync-default-handler)
     (execute-extended-command)
     (find-file-read-only . ido)
     (find-alternate-file))))
 '(omnisharp-auto-complete-popup-help-delay nil)
 '(omnisharp-imenu-support t)
 '(package-selected-packages
   (quote
    (fill-column-indicator iedit dotnet sql-indent which-key evil-nerd-commenter powerline-evil evil-surround powerline window-numbering evil company monokai-theme hungry-delete smartparens js2-mode nodejs-repl popwin omnisharp helm web-mode expand-region popup cnfonts org-pomodoro yasnippet helm-ag elpy py-autopep8 counsel go-mode company-go)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80)
 '(which-key-side-window-location (quote right)))
