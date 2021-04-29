;; (quelpa '(eaf :fetcher github
;;               :repo  "manateelazycat/emacs-application-framework"
;;               :files ("*")))

(use-package eaf
  :load-path "~/.emacs.d/third/emacs-application-framework" ; Set to "/usr/share/emacs/site-lisp/eaf" if installed from AUR
  :init
  (use-package epc :defer t :ensure t)
  (use-package ctable :defer t :ensure t)
  (use-package deferred :defer t :ensure t)
  (use-package s :defer t :ensure t)
  :custom
  (eaf-browser-continue-where-left-off t)
  :config
  (eaf-setq eaf-browser-enable-adblocker "true")
  (eaf-bind-key scroll_up "C-n" eaf-pdf-viewer-keybinding)
  (eaf-bind-key scroll_down "C-p" eaf-pdf-viewer-keybinding)
  (eaf-bind-key take_photo "p" eaf-camera-keybinding)
  (eaf-bind-key nil "M-q" eaf-browser-keybinding)
  (setq eaf-proxy-type "socks5"
              eaf-proxy-host "127.0.0.1"
              eaf-proxy-port "1080")
  ;; Browser
  ;; 开启广告屏蔽
  (eaf-setq eaf-browser-enable-adblocker "true")
  ;; Default "blank" page
  (eaf-setq eaf-browse-blank-page-url "https://google.com")
  ;; 打开上次浏览器关闭的地方
  (setq eaf-browser-continue-where-left-off t)
  ;; 默认搜索引擎
  (setq eaf-browser-default-search-engine 'google)
  ;; 不开启 dark 模式
  ;; (eaf-setq eaf-browser-dark-mode "ignore")
  ;; 广告屏蔽
  (eaf-setq eaf-browser-enable-adblocker "true"))

(provide 'init-eaf)
