
(setq ring-bell-function 'ignore)


;; diabled auto backup file model
(setq make-backup-files nil)
(setq auto-save-default nil)
(setq auto-save-interval 50)
(setq auto-save-timeout 120)
(setq backup-directory-alist `((".*" . "~/.autosave/")))
(setq auto-save-file-name-transforms `((".*","~/.autosave/" t)))

(prefer-coding-system 'utf-8-unix)
(define-coding-system-alias 'UTF-8 'utf-8)

;; enable recent file mode
(require 'recentf)
(recentf-mode 1)
(setq recentf-max-menu-items 25)


;; Add lisp () hook
(add-hook 'emacs-lisp-mode-hook 'show-paren-mode)

;; abbrev mode
(abbrev-mode t)
(define-abbrev-table 'global-abbrev-table '(
					    ;; signature
					    ("8sn" "frankwan")
					    ))


;; enable delete selection mode
(delete-selection-mode 1)

;; show row numbers 
(global-linum-mode 1)

;; auto reload file
(setq global-auto-revert-mode 1)

;; save open files for next run emacs
(desktop-save-mode -1)

;; replace yes-no to y-n
(fset 'yes-or-no-p 'y-or-n-p)

;; move files
(defun move-file (new-location)
  "Write this file to NEW-LOCATION, and delete the old one."
  (interactive (list (expand-file-name
                      (if buffer-file-name
                          (read-file-name "Move file to: ")
                        (read-file-name "Move file to: "
                                        default-directory
                                        (expand-file-name (file-name-nondirectory (buffer-name))
                                                          default-directory))))))
  (when (file-exists-p new-location)
    (delete-file new-location))
  (let ((old-location (expand-file-name (buffer-file-name))))
    (message "old file is %s and new file is %s"
             old-location
             new-location)
    (write-file new-location t)
    (when (and old-location
               (file-exists-p new-location)
               (not (string-equal old-location new-location)))
      (delete-file old-location))))

(global-set-key (kbd "C-c m") #'move-file)

;; indent buffer
(defun indent-buffer()
  (interactive)
  (indent-region (point-min) (point-max)))

(defun indent-region-or-buffer()
  (interactive)
  (save-excursion
    (if(region-active-p)
	(progn
	  (indent-region (region-beginning) (region-end))
	  (message "Indented selected region."))
      (progn
	(indent-buffer)
	(message "Indented buffer.")))))

(global-set-key (kbd "C-M-\\") 'indent-region-or-buffer)

;; hippie expand, make company mode more stong
(setq hippie-expand-try-functions-list '(
					 try-expand-dabbrev
					 try-expand-dabbrev-all-buffers
					 try-expand-dabbrev-from-kill
					 try-complete-file-name-partially
					 try-complete-file-name
					 try-expand-abbrevs
					 try-expand-list
					 try-expand-line
					 try-complete-lisp-symbol-partially
					 try-complete-lisp-symbol
					 ))

(global-set-key (kbd "C-.") 'hippie-expand)

;; remap company selection result keys
(with-eval-after-load 'company
  (define-key company-active-map (kbd "M-n") nil)
  (define-key company-active-map (kbd "M-p") nil)
  (define-key company-active-map (kbd "C-n") #'company-select-next)
  (define-key company-active-map (kbd "C-p") #'company-select-previous))

;; dired
(setq dired-recursive-copies 'always)
(setq dired-recursive-deletes 'always)

(put 'dired-find-alternate-file 'disabled nil)
(with-eval-after-load 'dired
  (define-key dired-mode-map (kbd "RET") 'dired-find-alternate-file))

(require 'dired-x)
(setq dired-dwim-target t)

;; showparen
(define-advice show-paren-function (:around (fn) fix-show-paren-function)
  "HighLight enclosing parens. "
  (cond ((looking-at-p "\\s(") (funcall fn))
	(t (save-excursion
	     (ignore-errors (backward-up-list))
	     (funcall fn)))))

;; hidden or remove dos '\r' char
(defun hidden-dos-eol()
  "Do not show ^M in files containing mixed UNIX and DOS line endings"
  (interactive)
  (setq buffer-display-table (make-display-table))
  (aset buffer-display-table ?\^M []))
(defun remove-dos-eol()
  "Replace DOS eolns CR LF with Unix eolns CR"
  (interactive)
  (goto-char (point-min))
  (while (search-forward "\r" nil t) (replace-match "")))

;; dwin = do what i mean. this is occur super func
(defun occur-dwin ()
  "Call 'occur' with a sane default"
  (interactive)
  (push (if (region-active-p)
	    (buffer-substring-no-properties
	     (region-beginning)
	     (region-end))
	  (let ((sym (thing-at-point 'symbol)))
	    (when (stringp sym)
	      (regexp-quote sym))))
	regexp-history)
  (call-interactively 'occur))

(global-set-key (kbd "M-s o") 'occur-dwin)

(provide 'init-better-defaults)

