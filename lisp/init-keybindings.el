
;; (global-set-key "\C-x\ \C-r" 'recentf-open-files)
(global-set-key (kbd "<f2>") 'recentf-open-files)

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
(global-set-key (kbd "<S-tab>") 'un-indent-by-removing-4-spaces)
(defun un-indent-by-removing-4-spaces ()
  "remove 4 spaces from beginning of of line"
  (interactive)
  (save-excursion
    (save-match-data
      (beginning-of-line)
      ;; get rid of tabs at beginning of line
      (when (looking-at "^\\s-+")
        (untabify (match-beginning 0) (match-end 0)))
      (when (looking-at "^    ")
        (replace-match "")))))

;; flycheck
(global-set-key (kbd "C-c C-v") #'flycheck-mode)
(global-set-key (kbd "C-c v n") #'flycheck-next-error)
(global-set-key (kbd "C-c v p") #'flycheck-previous-error)

;; backward kill word
;; (global-set-key (kbd "C-w") #'backward-kill-word)


(provide 'init-keybindings)
