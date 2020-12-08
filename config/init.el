;; 加速配置
(require 'init-accelerate)

;; 设置字体
(require 'init-font)

(let (
      ;; 加载的时候临时增大`gc-cons-threshold'以加速启动速度。
      (gc-cons-threshold most-positive-fixnum)
      (gc-cons-percentage 0.8)
      ;; 清空避免加载远程文件的时候分析文件。
      (file-name-handler-alist nil))
  
  (with-temp-message ""
    (require 'init-elpa)
    (require 'init-require-package)
    (require 'init-ui)
    (require 'init-generic)
    (require 'init-themes)
    (require 'init-dashboard)
    
    ;; 可以延后加载的
    ;; (run-with-idle-timer
    ;;  1 t
    ;;  #'(lambda ()
    (when (featurep 'cocoa)
      (require 'init-exec-path-shell))
    (require 'init-utils)
    (require 'init-lazy-load)
    (require 'init-high-indent)
    (require 'init-rainbow)
    (require 'init-company)
    (require 'init-flycheck)
    (require 'init-powerline)
    (require 'init-window)
    (require 'init-mmm)
    (require 'init-helm)
;;    (require 'init-yasnippet)
  ;;  (require 'init-omnisharp)
    (require 'init-python)
;;    (require 'init-go)
    (require 'init-multi-cursors)
   ;; (require 'init-mssql)
  ;;  (require 'init-undo-tree)
;;    (require 'init-magit)
 ;;   (require 'init-tab)
 ;;   (require 'init-org)
    (require 'init-project)
  ;;  (require 'init-diminish)
 ;;   (require 'init-vue)
    ;; (require 'init-shell)
    ))

(provide 'init)
