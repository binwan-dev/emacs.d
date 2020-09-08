;;; Code:

(fset 'yes-or-no-p 'y-or-n-p)           ;以 y/n代表 yes/no
(blink-cursor-mode -1)                  ;指针不闪动
(transient-mark-mode 1)                 ;标记高亮
(global-subword-mode 1)                 ;Word移动支持 FooBar 的格式
(prefer-coding-system 'utf-8-unix)
(define-coding-system-alias 'UTF-8 'utf-8)
(which-key-mode 1)

(setq use-dialog-box nil)               ;never pop dialog
(setq inhibit-startup-screen t)         ;inhibit start screen
(setq initial-scratch-message "") ;关闭启动空白buffer, 这个buffer会干扰session恢复
(setq-default comment-style 'indent)    ;设定自动缩进的注释风格
(setq ring-bell-function 'ignore)       ;关闭烦人的出错时的提示声
(setq default-major-mode 'text-mode)    ;设置默认地主模式为TEXT模式
(setq mouse-yank-at-point t)            ;粘贴于光标处,而不是鼠标指针处
(setq x-select-enable-clipboard t)      ;支持emacs和外部程序的粘贴
(setq split-width-threshold nil)        ;分屏的时候使用上下分屏
(setq inhibit-compacting-font-caches t) ;使用字体缓存，避免卡顿
(setq confirm-kill-processes nil)       ;退出自动杀掉进程
(setq async-bytecomp-allowed-packages nil) ;避免magit报错
(setq global-auto-revert-mode 1)        ;自动刷新文件
(setq profiler-report-cpu-line-format ;让 profiler-report 第一列宽一点
      '((100 left)
        (24 right ((19 right)
                   (5 right)))))
(setq profiler-report-memory-line-format
      '((100 left)
        (19 right ((14 right profiler-format-number)
                   (5 right)))))

;; diabled auto backup file model
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-interval 50)
(setq auto-save-timeout 120)
(setq backup-directory-alist `((".*" . "~/.autosave/")))
(setq auto-save-file-name-transforms `((".*","~/.autosave/" t)))

;; enable recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)

(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;;(defun felix-open-my-init-file ()
;; (interactive)
;; (find-file "~/.emacs.d/config/init.el"))
;;(global-set-key (kbd "<f1>") 'felix-open-my-init-file)　　         ;打开配置文件　　　

(global-set-key (kbd "C-h C-f") 'find-function)                   ;调用查找函数    
(global-set-key (kbd "C-h C-v") 'find-variable)                   ;调用查找变量　
(global-set-key (kbd "C-h C-k") 'find-function-on-key)            ;调用查找快捷键绑定的函数
(global-set-key (kbd "C-c C-u") #'undo-tree-mode)                 ;绑定撤销模式快捷键

(global-set-key (kbd "M-p") #'scroll-down-line)                   ;绑定滚动条下拉
(global-set-key (kbd "M-n") #'scroll-up-line)                     ;绑定滚动条上拉 
(global-set-key (kbd "C-c b r") #'revert-buffer)                  ;绑定刷新buffer
;;(global-set-key (kbd "C-c C-r") 'ivy-resume)

;;(global-set-key (kbd "C-c p f") 'counsel-git)


;; ;; binding shift+tab to removing code space
;; ;;(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;; ;; flycheck
;; (global-set-key (kbd "C-c C-v") #'flycheck-mode)
;; (global-set-key (kbd "C-c v n") #'flycheck-next-error)
;; (global-set-key (kbd "C-c v p") #'flycheck-previous-error)

;; ;; backward kill word
;; ;; (global-set-key (kbd "C-w") #'backward-kill-word)

;; (global-set-key (kbd "M-p") #'scroll-down-line)
;; (global-set-key (kbd "M-n") #'scroll-up-line)
;; (global-set-key (kbd "C-c b r") #'revert-buffer)


;; Add lisp () hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; move files
(defun move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (expand-file-name
                      (if buffer-file-name
                          (read-file-name "Move file to: ")
                        (read-file-name "Move file to: "
                                        default-directory
                                        (expand-file-name (file-name-nondirectory (buffer-name))
                                                          default-directory))))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (message "old file is %s and new file is %s"
             old-location
             new-location)
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))

(global-set-key (kbd "C-c m") #'move-file)

;; indent buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if(region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;; hippie expand, make company mode more stong
(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol
					 ))

(global-set-key (kbd "C-c .") 'hippie-expand)

;; remap company selection result keys
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwim-target t)

;; showparen
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "HighLight enclosing parens. "
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; hidden or remove dos '\r' char
(defun hidden-dos-eol()
  "Do not show ^M in files containing mixed UNIX and DOS line endings"
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(defun remove-dos-eol()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; dwin = do what i mean. this is occur super func
(defun occur-dwin ()
  "Call 'occur' with a sane default"
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(global-set-key (kbd "M-s o") 'occur-dwin)

;; comment-or-uncomment
(defun my-comment-or-uncomment-region (beg end &optional arg)    
  (interactive (if (use-region-p)    
                   (list (region-beginning) (region-end) nil)    
                 (list (line-beginning-position)    
                       (line-beginning-position 2))))    
  (comment-or-uncomment-region beg end arg))

(global-set-key [remap comment-or-uncomment-region] 'my-comment-or-uncomment-region)
(global-set-key (kbd "C-c C-/") #'comment-or-uncomment-region)

(global-set-key (kbd "C-M-o") 'View-scroll-half-page-backward)
(global-set-key (kbd "C-M-n") #'View-scroll-half-page-forward)

;; use huagry-delete
(require-package 'hungry-delete)
(global-hungry-delete-mode)

;; company
(require-package 'company)
(global-company-mode)

(provide 'init-generic)
