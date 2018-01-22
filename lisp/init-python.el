;;(elpy-enable)
;;(require 'py-autopep8)
;;(add-hook 'elpy-mode-hook 'py-autopep8-enable-on-save)

(defun my-python-mode-setup()
  (elpy-enable)
  (elpy-mode)
  (setq python-indent-offset 4))

(add-hook 'python-mode-hook 'my-python-mode-setup t)

(provide 'init-python)
