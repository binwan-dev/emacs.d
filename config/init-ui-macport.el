;; (set-face-background 'default "mac:windowBackgroundColor")
;; (set-face-stipple 'default "alpha:60%")
(dolist (f (face-list)) (set-face-stipple f "alpha:60%"))
(setq face-remapping-alist (append face-remapping-alist '((default my/default-blurred))))
(defface my/default-blurred
   '((t :inherit 'default :stipple "alpha:60%"))
   "Like 'default but blurred."
   :group 'my)

(provide 'init-ui-macport)
