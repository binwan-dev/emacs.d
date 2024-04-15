;;; Code:
(tool-bar-mode -1)                      ;禁用工具栏
(menu-bar-mode -1)                      ;禁用菜单栏
(scroll-bar-mode -1)                    ;禁用滚动条
(delete-selection-mode 1)               ;启用删除选择模式
(desktop-save-mode -1)                  ;记录文件供下次打开
(setq-default cursor-type 'bar)         ;设置光标为 |
(global-display-line-numbers-mode t)
(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(blink-cursor-mode -1)                  ;指针不闪动
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式
(prefer-coding-system 'utf-8-unix)
(define-coding-system-alias 'UTF-8 'utf-8)
(set-frame-parameter (selected-frame) 'ns-transparent-titlebar t) ;状态栏透明
;; (pixel-scroll-precision-mode 1)         ;     

; 设置透明函数
(defun binwan-toggle-frame-transparency ()
  (interactive)
  (if (equal (frame-parameter nil 'alpha-background) 100)
      (set-frame-parameter nil 'alpha-background 85)
    (set-frame-parameter nil 'alpha-background 100)))

; 开启窗口序号管理
(use-package window-numbering
  :init
  (window-numbering-mode))

;; 居中显示
(use-package writeroom-mode
  :config
  (setq writeroom-width 128
        writeroom-bottom-divider-width 0
        writeroom-fringes-outside-margins t
        writeroom-fullscreen-effect nil
        writeroom-major-modes '(text-mode prog-mode conf-mode special-mode Info-mode dired-mode)
        writeroom-maximize-window nil
        writeroom-mode-line t
        writeroom-mode-line-toggle-position 'mode-line-format)
  :hook
  (emacs-startup . global-writeroom-mode))


; 缩进线
(use-package highlight-indent-guides
  :ensure t
  :init
  (setq highlight-indent-guides-method 'character)
  ;; (setq highlight-indent-guides-auto-odd-face-perc 20)
  ;; (setq highlight-indent-guides-auto-even-face-perc 40)
  ;; (setq highlight-indent-guides-auto-character-face-perc 50)
  :hook
  ((prog-mode . highlight-indent-guides-mode)))

(if (featurep 'cocoa)
    (progn
      ;; 在Mac平台, Emacs不能进入Mac原生的全屏模式,否则会导致 `make-frame' 创建时也集成原生全屏属性后造成白屏和左右滑动现象.
      ;; 所以先设置 `ns-use-native-fullscreen' 和 `ns-use-fullscreen-animation' 禁止Emacs使用Mac原生的全屏模式.
      ;; 而是采用传统的全屏模式, 传统的全屏模式, 只会在当前工作区全屏,而不是切换到Mac那种单独的全屏工作区,
      ;; 这样执行 `make-frame' 先关代码或插件时,就不会因为Mac单独工作区左右滑动产生的bug.
      ;;
      ;; Mac平台下,不能直接使用 `set-frame-parameter' 和 `fullboth' 来设置全屏,
      ;; 那样也会导致Mac窗口管理器直接把Emacs窗口扔到单独的工作区, 从而对 `make-frame' 产生同样的Bug.
      ;; 所以, 启动的时候通过 `set-frame-parameter' 和 `maximized' 先设置Emacs为最大化窗口状态, 启动5秒以后再设置成全屏状态,
      ;; Mac就不会移动Emacs窗口到单独的工作区, 最终解决Mac平台下原生全屏窗口导致 `make-frame' 左右滑动闪烁的问题.
      (setq ns-use-native-fullscreen nil)
      (setq ns-use-fullscreen-animation nil)

      ;; 默认先最大化。
      (set-frame-parameter (selected-frame) 'fullscreen 'maximized))

  ;; 非Mac平台直接全屏
  (setq initial-frame-alist (quote ((fullscreen . maximized)))))


(provide 'init-ui)
