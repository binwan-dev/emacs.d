;; (use-package vterm
;;   :ensure t
;;   :config
;;   (setq vterm-buffer-name-string "vterm %s")
;;   (defvar my-vterm-display-table (make-display-table))

;;   ;; Map U+2B1D (Black Very Small Square) to display as U+00B7 (Middle Dot)
;;   (aset my-vterm-display-table ?\u2B1D (vector ?\u00B7))
;;   ;; Map U+FF65 (Halfwidth Katakana Middle Dot) to display as U+00B7 (Middle Dot)
;;   (aset my-vterm-display-table ?\uFF65 (vector ?\u00B7))
;;   :hook
;;   (vterm-mode . (lambda ()
;;                   (setq buffer-display-table my-vterm-display-table))))

;; (use-package vterm-toggle
;;   :config
;;   (global-set-key (kbd "C-c C-v") 'vterm-toggle)
;;   ;Switch to next vterm buffer
;;   (define-key vterm-mode-map (kbd "s-n")   'vterm-toggle-forward)
;;   ;Switch to previous vterm buffer
;;   (define-key vterm-mode-map (kbd "s-p")   'vterm-toggle-backward))

(use-package ghostel
  :ensure t
  :config
  (global-set-key (kbd "C-x C-t") 'ghostel)
  (global-set-key (kbd "C-x p t") 'ghostel-project))


(provide 'init-terminal)
