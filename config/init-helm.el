(use-package helm-gtags)

(use-package helm
  :ensure t
  :init
  (helm-mode 1)
  :bind (("C-c h" . 'helm-command-prefix)
	 ("C-s" . 'helm-occur)
	 ("M-s f" . 'helm-imenu-anywhere)
	 ("M-s g" . 'helm-imenu-in-all-buffers)
	 ("M-x" . #'helm-M-x)
	 ("C-x r b" . #'helm-filtered-bookmarks)
	 ("C-x C-f" . 'helm-find-files)
	 ("C-x b" . 'helm-buffers-list)
	 ("C-x C-b" . 'helm-buffers-list))
  :bind (:map helm-map
	 ("<tab>" . 'helm-execute-persistent-action) ; rebind tab to run persistent action
	 ("C-i" . 'helm-execute-persistent-action) ; make TAB work in terminal
	 ("C-z" . 'helm-select-action)) ; list actions using C-z
  :config
  (require 'helm-config)
  (helm-gtags-mode t)
  (setq helm-split-window-in-side-p           t ; open helm buffer inside current window, not occupy whole other window
      helm-move-to-line-cycle-in-source     t ; move to end or beginning of source when reaching top or bottom of source.
      helm-ff-search-library-in-sexp        t ; search for library in `require' and `declare-function' sexp.
      helm-scroll-amount                    8 ; scroll 8 lines other window using M-<next>/M-<prior>
      helm-ff-file-name-history-use-recentf t
      helm-echo-input-in-header-line t)

  )

(use-package helm-tramp
  :ensure t)

(provide 'init-helm)
