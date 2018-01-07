
;; hide tool bar
(tool-bar-mode -1)
;; hide scrol bar
(scroll-bar-mode -1)
;; ? 
(setq inhibit-splash-screen 1)

;; close scroll
(scroll-bar-mode -1)

;;set cursor
(setq-default cursor-type 'bar)

;;full screen
(setq initial-frame-alist (quote ((fullscreen . maximized))))

;; disable current row light
(global-hl-line-mode -1)

(set-default-font "Consolas")

(provide 'init-ui)
