(evil-mode 1)
(setcdr evil-insert-state-map nil)
(define-key evil-insert-state-map [escape] 'evil-normal-state)

(global-evil-leader-mode)
(evil-leader/set-key
  "ff" 'helm-find-files
  "fs" 'save-buffer
  "fr" 'recentf-open-files
  "pf" 'counsel-git
  "ps" 'helm-do-ag-project-root
  "bb" 'switch-to-buffer
  "qq" 'save-buffers-kill-terminal
  "w/" 'split-window-right
  "w-" 'split-window-below
  "wM" 'delete-other-windows
  ":" 'counsel-M-x
  "0" 'select-window-0
  "1" 'select-window-1
  "2" 'select-window-2
  "3" 'select-window-3)

(window-numbering-mode 1)
(require 'evil-surround)
(global-evil-surround-mode)

(evilnc-default-hotkeys)
(define-key evil-normal-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)
(define-key evil-visual-state-map (kbd ",/") 'evilnc-comment-or-uncomment-lines)

(which-key-mode 1)

(provide 'init-evil)
