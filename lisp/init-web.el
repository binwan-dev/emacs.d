;; use js2-mode
;; config js2-mode for js files
(setq auto-mode-alist
      (append
       '(("\\.js\\'" . js2-mode))
       '(("\\.html\\'" . web-mode))
       auto-mode-alist))

;; use nodejs-repl
(require 'nodejs-repl)

;; config for web mode
(defun my-web-mode-indent-setup()
  (setq web-mode-markup-indent-offest 2) ; web-mode, html tag in html file
  (setq web-mode-css-indent-offest 2) ; web-mode,css in html file
  (setq web-mode-code-indent-offest 2) ; web-mode, js code in html file
  )

(add-hook 'web-mode-hook 'my-web-mode-indent-setup)

(defun my-toggle-web-indent ()
  ;; web development
  (interactive)
  (if(or (eq major-mode 'js-mode) (eq major-mode 'js2-mode))
      (progn
	(setq js-indent-level (if (= js-indent-level 2) 4 2))
	(setq js2-basic-offest (if (= js2-basic-offest 2) 4 2))))
  (if(eq major-mode 'web-mode)
      (progn
	(setq web-mode-markup-indent-offest (if (= web-mode-markup-indent-offest 2) 4 2))
	(setq web-mode-css-indent-offest (if (= web-mode-css-indent-offest 2) 4 2))
	(setq web-mode-code-indent-offest (if (= web-mode-code-indent-offest 2) 4 2))))
  (if(eq major-mode 'css-mode)
      (setq css-indent-offest (if(= css-indent-offest 2) 4 2)))

  (setq indent-tabs-mode nil))

(global-set-key (kbd "C-c t i") 'my-toggle-web-indent)

(provide 'init-web)
