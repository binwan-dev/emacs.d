(require-package 'web-mode)
(require-package 'company-web)
;; (require - package 'prettier-js)
(require-package 'tide)
(require-package 'rjsx-mode)
(require-package 'react-snippets)
(require-package 'css-mode)
(require-package 'scss-mode)
(require-package 'emmet-mode)
(require-package 'js2-mode)


(defun my/web-mode-setup()
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-css-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-enable-current-element-highlight t)
  (setq web-mode-enable-css-colorization t)
  ;; (set-face-attribute 'web-mode-html-tag-face nil :foreground "royalblue")
  ;; (set-face-attribute 'web-mode-html-attr-name-face nil :foreground "powderblue")
  ;; (set-face-attribute 'web-mode-doctype-face nil :foreground "lightskyblue")
  (setq web-mode-content-types-alist
	'(("vue" . "\\.vue\\'")))
  (add-hook 'web-mode-hook (lambda()
			     (cond((equal web-mode-content-type "html")
				   (my/web-html-setup))
				  ((member web-mode-content-type '("vue"))
				   (my/web-vue-setup)))))
  (web-mode)
  )
;;
;; html
;;
(defun my/web-html-setup()
  "Setup for web-mode html files."
  (message "web-mode use html related setup")
  (flycheck-add-mode 'html-tidy 'web-mode)
  (flycheck-select-checker 'html-tidy)
  (add-to-list(make-local-variable 'company-backends)
	      '(company-web-html company-files company-css company-capf company-dabbrev))
  (add-hook 'before-save-hook #'sgml-pretty-print)

  )

;;
;; web-mode for vue
					; ;
(defun my/web-vue-setup()
  "Setup for js related."
  (message "web-mode use vue related setup")
  (prettier-js-mode)
  ;; (my/use-eslint-from-node-modules)
  (add-to-list(make-local-variable 'company-backends)
	      '(comany-tide company-web-html company-css company-files))
  (setup-tide-mode)
  (flycheck-add-mode 'javascript-eslint 'web-mode)
  (flycheck-select-checker 'javascript-eslint))


;;eslint use local

(defun my/use-eslint-from-node-modules ()
  "Use local eslint from node_modules before global."
  (let* ((root (locate-dominating-file
                (or (buffer-file-name) default-directory)
                "node_modules"))
         (eslint (and root
                      (expand-file-name "node_modules/eslint/bin/eslint.js"
                                        root))))
    (when (and eslint (file-executable-p eslint))
      (setq-local flycheck-javascript-eslint-executable eslint))))

(add-hook 'flycheck-mode-hook #'my/use-eslint-from-node-modules)


;;rjsx;

(add-auto-mode 'rjsx-mode "\\.js\\'")
(setq js2-basic-offset 2)
(add-hook 'rjsx-mode-hook (lambda()
			    (flycheck-add-mode 'javascript-eslint 'rjsx-mode)
			    (my/use-eslint-from-node-modules)
			    (flycheck-select-checker 'javascript-eslint)
			    ))
(setq js2-basic-offset 2)


;;css;

(add-auto-mode 'css-mode "\\.css\\'")
(add-hook 'css-mode-hook (lambda()
			   (add-to-list(make-local-variable 'company-backends)
				       '(company-css company-files company-yasnippet company-capf))))
(setq css-indent-offset 4)
(setq flycheck-stylelintrc "~/.stylelintrc")

(add-auto-mode 'scss-mode "\\.scss\\'")


;;emmet;

(add-hook 'web-mode-hook 'emmet-mode)
(add-hook 'css-mode-hook 'emmet-mode)
(add-hook 'scss-mode-hook 'emmet-mode)
(add-hook 'sgml-mode-hook 'emmet-mode)
(add-hook 'rjsx-mode-hook 'emmet-mode)
(add-hook 'emmet-mode-hook (lambda()
			     (setq emmet-indent-after-insert t)))
;; (setq-mode-local rjsx-mode emmet-expand-jsx-className ? t)
;; (setq-mode-local web-mode emmet-expand-jsx-className ? nil)


;;js;

(setq indent-tabs-mode nil)
(setq js2-basic-offset 2)
(setq js-indent-level 2)
(setq js2-global-externs '("module" "require" "assert" "setInterval" "console" "__dirname__") )

;;typescript;
(defun setup-tide-mode()
  "Setup tide mode for other mode."
  (interactive)
  (message "setup tide mode")
  (tide-setup)
  (flycheck-mode +1)
  ;;(setq flycheck-check-syntax-automatically '(save mode-enabled))
  (eldoc-mode +1)
  ;;(tide-hl-identifier-mode +1)
  (company-mode +1))

;; (add-hook 'js2-mode-hook #'setup-tide-mode)
;; (add-hook 'typescript-mode-hook #'setup-tide-mode)
;; (add-hook 'rjsx-mode-hook #'setup-tide-mode)


;; (after-load 'company
;;   '(typescript-mode company flycheck))
;; (add-hook 'typescript-mode-hook 'tide-setup)
;; (add-hook 'typescript-mode-hook 'tide-hl-identifier-mode)
;; (setq tide-completion-enable-autoimport-suggestions t)



(setq prettier-js-command "prettier")
(setq prettier-js-args '(
			 "--bracket-spacing" "false"
			 "--html-whitespace-sensitivity" "strict"
			 ))

(add-auto-mode 'my/web-mode-setup "\\.html\\'" "\\.vue\\'")

(provide 'init-vue)
