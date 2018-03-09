(require 'omnisharp)

(if (eq system-type 'windows-nt)
    (setq omnisharp-server-executable-path "C:\\emacs_x64\\p ackages\\omnisharp-roslyn\\OmniSharp.exe"))
(if (eq system-type 'darwin)
    (setq omnisharp-server-executable-path "/usr/local/share/omnisharp-osx/run"))


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
  (setq fci-rule-column 100)
  (add-to-list 'company-backends #'company-omnisharp)
  (define-key omnisharp-mode-map (kbd "C-c C-j") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "<f12>") 'omnisharp-go-to-definition)
  (define-key omnisharp-mode-map (kbd "C-c C-b") 'pop-tag-mark)
  (define-key omnisharp-mode-map (kbd "C-c C-c") 'omnisharp-helm-find-usages)
  (define-key omnisharp-mode-map (kbd "C-c s s") 'omnisharp-start-omnisharp-server)
  (define-key omnisharp-mode-map (kbd "C-.") 'omnisharp-run-code-action-refactoring)
  ;; (define-key omnisharp-mode-map (kbd "<RET>") 'csharp-newline-and-indent)
  (define-key omnisharp-mode-map (kbd "C-d n") 'dotnet-new)
  (define-key omnisharp-mode-map (kbd "C-d r") 'dotnet-run)
  (define-key omnisharp-mode-map (kbd "C-d b") 'dotnet-build)
  (define-key omnisharp-mode-map (kbd "C-d a p") 'dotnet-add-package)
  (define-key omnisharp-mode-map (kbd "C-d g c") 'dotnet-goto-csproj)
  (define-key omnisharp-mode-map (kbd "C-c i") #'omnisharp-find-implementations)
  (omnisharp-mode)
  (flycheck-mode)
  (fci-mode))

;;(after-load 'company
;;  '(add-to-list 'company-backends #'company-omnisharp))

(defun csharp-newline-and-indent ()
  "Open a newline and indent.
If point is between a pair of braces, opens newlines to put braces
on their own line."
  (interactive)
  (save-excursion
    (save-match-data
      (when (and
             (looking-at " *}")
             (save-match-data
               (when (looking-back "{ *")
                 (goto-char (match-beginning 0))
                 (unless (looking-back "^[[:space:]]*")
                   (newline-and-indent))
                 t)))
        (unless (and (boundp electric-pair-open-newline-between-pairs)
                     electric-pair-open-newline-between-pairs
                     electric-pair-mode)
          (goto-char (match-beginning 0))
          (newline-and-indent)))))
  (newline-and-indent)) 

(add-hook 'csharp-mode-hook 'my-csharp-mode-setup t)

(provide 'init-omnisharp)
