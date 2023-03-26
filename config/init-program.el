;;; ###################### Web ###########################
(use-package css-mode
  :init
  (setq css-indent-offset 2))

(use-package tide
  :ensure t
  :after(typescript-mode company flycheck)
  :hook((typescript-mode . tide-setup)
        (typescript-mode . tide-hl-identifier-mode)
        (before-save . tide-format-before-save)))

;; For typescript
(defun setup-tide-mode()
  (interactive)
  (tide-setup)
  (flycheck-mode +1)
  (setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  (tide-hl-identifier-mode +1)
  ;; company is an optional dependency. You have to
  ;; install it separately via package-install
  ;; `M-x package-install [ret] company`
  (company-mode +1)
  (setq typescript-indent-level
        (or (plist-get (tide-tsfmt-options) ':indentSize) 2)))

(setq tide-format-options '(:tabSize 2))
;; aligns annotation to the right hand side
(setq company-tooltip-align-annotations t)
;; formats the buffer before saving
(add-hook 'before-save-hook 'tide-format-before-save)
(add-hook 'typescript-mode-hook #'setup-tide-mode)

(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.tsx\\'" . web-mode))
  :config
  (flycheck-add-mode 'typescript-tslint 'web-mode)
  :hook
  ((web-mode . (lambda()
		 (when(string-equal "tsx" (file-name-extension buffer-file-name))
		   (setup-tide-mode))))))
;;;###################### Web END ##############################


(use-package json-mode)

(provide 'init-program)
