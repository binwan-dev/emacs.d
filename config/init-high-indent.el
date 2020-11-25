(require-package 'highlight-indent-guides)
(use-package highlight-indent-guides
  :config
  (setq highlight-indent-guides-method 'bitmap)
  (setq highlight-indent-guides-responsive 'top)
  :hook (prog-mode . highlight-indent-guides-mode))

(provide 'init-high-indent)
