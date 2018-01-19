(require 'omnisharp)

(setq omnisharp-server-executable-path "C:\\emacs_x64\\packages\\omnisharp-roslyn\\OmniSharp.exe")

(setq omnisharp-company-match-sort-by-flx-score t)
(setq omnisharp-company-match-type 'company-match-flex)

(defun my-csharp-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 4)
  (setq company-minimum-prefix-length 3)
  (setq company-echo-delay 0)
  (add-to-list 'company-backends #'company-omnisharp)
  (define-key omnisharp-mode-map (kbd "C-c C-j") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "C-c C-b") 'pop-tag-mark)
  (define-key omnisharp-mode-map (kbd "C-c C-c") 'omnisharp-helm-find-usages)
  (define-key omnisharp-mode-map (kbd "C-c s s") 'omnisharp-start-omnisharp-server)
  (define-key omnisharp-mode-map (kbd "C-c C-v") 'flycheck-mode)
  (omnisharp-mode))

;;(after-load 'company
;;  '(add-to-list 'company-backends #'company-omnisharp))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)
(provide 'init-omnisharp)
