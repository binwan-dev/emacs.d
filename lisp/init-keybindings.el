
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "C-x C-r") 'recentf-open-files)

;; binding key 'f1' to open init-file
(global-set-key (kbd "<f1>") 'open-my-init-file)

;; set help
(global-set-key (kbd "C-h C-f") 'find-function)
(global-set-key (kbd "C-h C-v") 'find-variable)
(global-set-key (kbd "C-h C-k") 'find-function-on-key)

(global-set-key (kbd "C-c C-r") 'ivy-resume)

;; binding key 'C-c TAB' to toggle company mode
(global-set-key (kbd "C-c TAB") 'global-company-mode)

(global-set-key (kbd "C-c p f") 'counsel-git)

;; helm
(global-set-key (kbd "M-x") #'helm-M-x)
(global-set-key (kbd "C-x r b") #'helm-filtered-bookmarks)
(global-set-key (kbd "C-x C-f") #'helm-find-files)

;; binding shift+tab to removing code space
;;(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)

;; flycheck
(global-set-key (kbd "C-c C-v") #'flycheck-mode)
(global-set-key (kbd "C-c v n") #'flycheck-next-error)
(global-set-key (kbd "C-c v p") #'flycheck-previous-error)

;; backward kill word
;; (global-set-key (kbd "C-w") #'backward-kill-word)

(global-set-key (kbd "M-p") #'scroll-down-line)
(global-set-key (kbd "M-n") #'scroll-up-line)
(global-set-key (kbd "C-c b r") #'revert-buffer)

;; undo-tree-mode
(global-set-key (kbd "C-c C-u") #'undo-tree-mode)

;; open wiki.org
(defun open-my-wiki-file()
  (interactive)
  (find-file "~/Documents/project/org/wiki.org"))
(defun open-my-doc-file()
  (interactive)
  (find-file "~/Documents/project/org/doc.org"))
(defun open-my-work-file()
  (interactive)
  (find-file "~/Documents/project/org/work.org"))

(global-set-key (kbd "C-c w w") 'open-my-wiki-file)
(global-set-key (kbd "C-c w d") 'open-my-doc-file)
(global-set-key (kbd "C-c w j") 'open-my-work-file)

(provide 'init-keybindings)
