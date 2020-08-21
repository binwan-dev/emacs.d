(setq company-minimum-prefix-length 1)
(setq company-idle-delay 0.08)
;; (set-default-font "Monaco 20")
(when (version< emacs-version "27")
  (set-default-font "Cascadia Code Bold 11"))
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-safe-themes
   (quote
    ("bffa9739ce0752a37d9b1eee78fc00ba159748f50dc328af4be661484848e476" "dcdd1471fde79899ae47152d090e3551b889edf4b46f00df36d653adc2bf550d" default)))
 '(org-agenda-files nil)
 '(package-selected-packages
   (quote
    (doom-themes company-lsp spacemacs-theme company monokai-theme hungry-delete smartparens js2-mode nodejs-repl popwin omnisharp helm web-mode expand-region popup cnfonts org-pomodoro yasnippet helm-ag elpy py-autopep8 counsel go-mode company-go evil evil-leader window-numbering evil-surround evil-nerd-commenter which-key sql-indent dotnet iedit use-package))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
