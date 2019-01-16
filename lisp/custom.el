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
 '(Custom-safe-themes
   (quote
    ("628278136f88aa1a151bb2d6c8a86bf2b7631fbea5f0f76cba2a0079cd910f7d" "82d2cac368ccdec2fcc7573f24c3f79654b78bf133096f9b40c20d97ec1d8016" "4cf3221feff536e2b3385209e9b9dc4c2e0818a69a1cdb4b522756bcdf4e00a4" "bd7b7c5df1174796deefce5debc2d976b264585d51852c962362be83932873d9" "bb08c73af94ee74453c90422485b29e5643b73b05e8de029a6909af6a3fb3f58" "8db4b03b9ae654d4a57804286eb3e332725c84d7cdab38463cb6b97d5762ad26" "7ceb8967b229c1ba102378d3e2c5fef20ec96a41f615b454e0dc0bfa1d326ea6" "06f0b439b62164c6f8f84fdda32b62fb50b6d00e8b01c2208e55543a6337433a" "4aee8551b53a43a883cb0b7f3255d6859d766b6c5e14bcb01bed572fcbef4328" "d3a406c5905923546d8a3ad0164a266deaf451856eca5f21b36594ffcb08413a" "1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
 '(company-backends
   (quote
    (company-omnisharp company-bbdb company-nxml company-css company-eclim company-semantic company-cmake company-capf company-files
		       (company-dabbrev-code company-gtags company-etags company-keywords)
		       company-oddmuse company-dabbrev)))
 '(compilation-message-face (quote default))
 '(custom-enabled-themes (quote (sanityinc-tomorrow-bright)))
 '(custom-safe-themes
   (quote
    ("1b8d67b43ff1723960eb5e0cba512a2c7a2ad544ddb2533a90101fd1852b426e" default)))
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
 '(highlight-changes-colors (quote ("#FD5FF0" "#AE81FF")))
 '(highlight-tail-colors
   (quote
    (("#3C3D37" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#3C3D37" . 100))))
 '(magit-diff-use-overlays nil)
 '(omnisharp-auto-complete-popup-help-delay nil)
 '(omnisharp-imenu-support t)
 '(package-selected-packages
   (quote
    (org-super-agenda add-node-modules-path json-mode awesome-tab magit ir-black-theme dashboard helm-gtags company-anaconda protobuf-mode go-gopath golint gotest go-projectile company-jedi exec-path-from-shell go-autocomplete auto-complete-config auto-complete mc-extras multiple-cursors multi-term flycheck color-theme-solarized color-theme-sanityinc-tomorrow fill-column-indicator iedit dotnet sql-indent which-key evil-nerd-commenter powerline-evil evil-surround powerline window-numbering evil company monokai-theme hungry-delete smartparens js2-mode nodejs-repl popwin omnisharp helm web-mode expand-region popup cnfonts org-pomodoro yasnippet helm-ag elpy py-autopep8 counsel go-mode company-go)))
 '(popwin:popup-window-position (quote right))
 '(popwin:popup-window-width 80)
 '(pos-tip-background-color "#FFFACE")
 '(pos-tip-foreground-color "#272822")
 '(weechat-color-list
   (unspecified "#272822" "#3C3D37" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(which-key-side-window-location (quote right)))

(set-default-font "Source Code Pro Medium 16")
