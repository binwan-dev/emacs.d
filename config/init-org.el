;; use org
(require 'org)

;; org capture
(setq org-capture-templates
      '(("i" "Private Agenda" entry (file+headline "~/icloud/Documents/belog/private.org" "Private")
	 "* TODO %?\n %i\n"
	 :empty-lines 1)
	("w" "Work Agenda" entry (file+headline "~/icloud/Documents/belog/Brothers.org" "Work")
	 "* TODO %?\n %i\n"
	 :empty-lines 1)))

(global-set-key (kbd "C-c c") 'org-capture)
(add-hook 'org-mode-hook (lambda () (setq truncate-lines nil)))

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite" "csharp")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun my-org-mode-setup ()
  (define-key org-mode-map (kbd "C-c s e") 'org-insert-src-block)
  (setq org-log-done 'time))

(add-hook 'org-mode-hook 'my-org-mode-setup t)

;; set agenda config
(setq org-agenda-files '("~/icloud/Documents/belog/"))
(global-set-key (kbd "C-c a") 'org-agenda)

(global-set-key (kbd "C-c C-a r") 'org-agenda-to-appt)

(setq org-agenda-custom-commands
      '(("g" . "GTD contexts")
        ("go" "Office" tags-todo "office")
        ("gc" "Computer" tags-todo "computer")
        ("gp" "Phone" tags-todo "phone")
        ("gh" "Home" tags-todo "home")
        ("ge" "Errands" tags-todo "errands")
        ("G" "GTD Block Agenda"
         ((tags-todo "office")
          (tags-todo "computer")
          (tags-todo "phone")
          (tags-todo "home")
          (tags-todo "errands"))
         nil                      ;; i.e., no local settings
         ("~/next-actions.html")) ;; exports block to this file with C-c a e
       ;; ..other commands here
	      ("d" "Weekly Review"
		       ((agenda "" (;; (org-agenda-overriding-header "Tasks Completed:")
                        (org-agenda-skip-function '(org-agenda-skip-subtree-if 'nottodo 'done))
                        (org-agenda-skip-scheduled-if-done nil)
                        (org-agenda-skip-timestamp-if-done nil)                      
                        (org-agenda-span 7)
                        (org-agenda-use-time-grid nil)
                        (setq org-agenda-show-all-dates nil)))))))

;;agenda-appt
(require 'appt)
(appt-activate t);启用约会提醒
(setq appt-display-format 'window);提醒出现的方式
(setq appt-message-warning-time '5);在到期前5分钟提醒
(setq appt-display-duration '30);提醒持续时间（秒）
(setq appt-audible t)  ;声音提醒 -->没有响声!!？？？？？
(setq appt-display-mode-line t);在状态栏显示时间（分钟）

;; open wiki.org
(defun open-my-wiki-file()
  (interactive)
  (find-file "~/Documents/org/wiki.org"))
(defun open-my-doc-file()
  (interactive)
  (find-file "~/Documents/org/doc.org"))
(defun open-my-password-file()
  (interactive)
  (find-file "~/Documents/org/passwd.org"))

(global-set-key (kbd "C-c w w") 'open-my-wiki-file)
(global-set-key (kbd "C-c w d") 'open-my-doc-file)
(global-set-key (kbd "C-c w p") 'open-my-password-file)

;;add export markdown
(use-package ox-gfm)
(require 'ox-gfm)

(provide 'init-org)
