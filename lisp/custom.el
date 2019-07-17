(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.08)
(set-default-font "DejaVu Sans Mono 12")
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(org-agenda-files nil)
 '(org-capture-templates
   (quote
    (("w" "Todo for Fnlinker" entry
      (file+headline "~/Documents/org/fnlinker.org" "Work Plan")
      "* TODO [#B] %?
 %i
" :empty-lines 1)
     ("s" "Work for self" entry
      (file+headline "~/Documents/org/self.org" "Self")
      "* TODO %?
 %i
" :empty-lines 1))) t)
 '(package-selected-packages
   (quote
    (vue-mode omnisharp company monokai-theme hungry-delete smartparens js2-mode nodejs-repl popwin helm web-mode expand-region popup cnfonts org-pomodoro yasnippet helm-ag elpy py-autopep8 counsel go-mode company-go evil evil-leader window-numbering evil-surround evil-nerd-commenter which-key sql-indent dotnet iedit color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
