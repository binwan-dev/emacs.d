(let ((emacs-font-size 13)
      emacs-font-name)
  (setq emacs-font-name "Fira Code")
  (when (display-grayscale-p)
    (set-frame-font (format "%s-%s" (eval emacs-font-name) (eval emacs-font-size)))
    (set-fontset-font (frame-parameter nil 'font) 'unicode (eval emacs-font-name))

    (setq nox-doc-tooltip-font (format "%s-%s" emacs-font-name emacs-font-size))
    )
  (with-eval-after-load 'doom-modeline
    (set-face-attribute 'mode-line nil :font "SourceCodePro-12")
    (set-face-attribute 'mode-line-inactive nil :font "SourceCodePro-12")))

(setq line-spacing 0.2)

(provide 'init-font)
