(require-package 'highlight-indent-guides)

(setq highlight-indent-guides-method 'bitmap)
(setq highlight-indent-guides-responsive 'top)

(add-hook 'prog-mode-hook 'highlight-indent-guides-mode)

(provide 'init-high-indent)
