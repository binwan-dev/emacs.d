;; (require-package 'rainbow-mode)

(use-package rainbow-delimiters)

(use-package rainbow-mode
  :ensure t
  :hook (prog-mode . rainbow-delimiters-mode))

(provide 'init-rainbow)
