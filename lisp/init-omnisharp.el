(require 'omnisharp)

(setq omnisharp-server-executable-path "C:\\emacs_x64\\packages\\omnisharp-roslyn\\OmniSharp.exe")

(setq omnisharp-company-match-type 'company-match-flex)
(setq omnisharp-company-match-sort-by-flx-score t)

(defun my-csharp-mode-setup ()
  (setq indent-tabs-mode nil)
  (setq c-syntactic-indentation t)
  (c-set-style "ellemtel")
  (setq c-basic-offset 4)
  (setq truncate-lines t)
  (setq tab-width 4)
  (setq evil-shift-width 1)
  (define-key omnisharp-mode-map (kbd "C-c C-c") 'recompile)
  (define-key omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "C-c i") 'omnisharp-find-implementations)
  (define-key omnisharp-mode-map (kbd "C-c C-b") 'pop-tag-mark)
  (define-key omnisharp-mode-map (kbd "C-c r") 'omnisharp-rename)
  (define-key omnisharp-mode-map (kbd "C-c s s") 'omnisharp-start-omnisharp-server)
  (define-key csharp-mode-map (kbd "C-c n") 'csharp-move-back-to-beginning-of-namespace)
  (define-key csharp-mode-map (kbd "C-c c b") 'csharp-move-back-to-beginning-of-class)
  (define-key csharp-mode-map (kbd "C-c c e") 'csharp-move-fwd-to-end-of-class)
  (define-key csharp-mode-map (kbd "C-c f b") 'csharp-move-back-to-beginning-of-defun)
  (define-key csharp-mode-map (kbd "C-c f e") 'csharp-move-fwd-to-end-of-defun)
  (omnisharp-mode)
  (flycheck-mode)
  (company-mode))

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(eval-after-load
    'company
  '(add-to-list 'company-backends 'company-omnisharp))

(setq auto-mode-alist
      (append
       '(("\\.cs\\'" . csharp-mode))
       auto-mode-alist))



;; evil mode
					;(evil-define-key 'insert omnisharp-mode-map (kbd "M-.") 'omnisharp-auto-complete)
					;(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
					;(evil-define-key 'normal omnisharp-mode-map (kbd "g u") 'omnisharp-find-usages)
					;(evil-define-key 'normal omnisharp-mode-map (kbd "g I") 'omnisharp-find-implementations) ; g i is taken
					;(evil-define-key 'normal omnisharp-mode-map (kbd "g o") 'omnisharp-go-to-definition)
					;(evil-define-key 'normal omnisharp-mode-map (kbd "g r") 'omnisharp-run-code-action-refactoring)
					;(evil-define-key 'normal omnisharp-mode-map (kbd "g f") 'omnisharp-fix-code-issue-at-point)
;;(evil-define-key 'normal omnisharp-mode-map (kbd "g F") 'omnisharp-fix-usings)
;;(evil-define-key 'normal omnisharp-mode-map (kbd "g R") 'omnisharp-rename)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", i") 'omnisharp-current-type-information)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", I") 'omnisharp-current-type-documentation)
;;(evil-define-key 'insert omnisharp-mode-map (kbd ".") 'omnisharp-add-dot-and-auto-complete)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", n t") 'omnisharp-navigate-to-current-file-member)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", n s") 'omnisharp-navigate-to-solution-member)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", n f") 'omnisharp-navigate-to-solution-file-then-file-member)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", n F") 'omnisharp-navigate-to-solution-file)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ", n r") 'omnisharp-navigate-to-region)
;;(evil-define-key 'normal omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
;;(evil-define-key 'insert omnisharp-mode-map (kbd "<f12>") 'omnisharp-show-last-auto-complete-result)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ",.") 'omnisharp-show-overloads-at-point)
;;(evil-define-key 'normal omnisharp-mode-map (kbd ",rl") 'recompile)



(provide 'init-omnisharp)
