(require-package 'yasnippet)
(add-hook 'prog-mode-hook #'yas-minor-mode)

(setq yas-snippet-dirs
      '("~/.emacs.d/snippets"))

;; for csharp extend begin
(defun find-project-root ()
  (interactive)
  (if (ignore-errors (eproject-root))
      (eproject-root)
    (or (find-git-repo (buffer-file-name) 0) (file-name-directory (buffer-file-name)))))

(defun find-git-repo (dir)
  (if (string= "/" dir)
      nil
    (if (file-exists-p (expand-file-name "../.git/" dir))
	dir
      (find-git-repo (expand-file-name "../" dir)))))

(defun file-path-to-namespace ()
  (interactive)
  (let (
        (root (find-project-root))
        (base (file-name-nondirectory buffer-file-name))
        )
    (if (string= "" (substring buffer-file-name (length root) (* -1 (length base))))
	(setq root (expand-file-name "../" root)))
    (substring (replace-regexp-in-string "/" "\." (substring buffer-file-name (length root) (* -1 (length base))) t t) 0 -1)))

;; for csharp end


(provide 'init-yasnippet)
