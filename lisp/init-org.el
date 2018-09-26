
;; use org
(require 'org)

;; enable code light
(setq org-src-fontify-natively t)

;; set agenda config
(setq org-agenda-files '("~/org/"))
(global-set-key (kbd "C-c a") 'org-agenda)

;; org capture
(setq org-capture-templates
      '(("t" "Todo" entry (file+headline "~/org/gtd.org" "Work Plan")
	 "* TODO {#B} %?\n %i\n"
	 :empty-lines 1)
	("d" "Work Daily of week" entry (file+headline "~/org/fm_daily.org" "Work daily for followme")
	 "* TODO %?\n %i\n"
	 :empty-lines 1)))

(global-set-key (kbd "C-c c") 'org-capture)

(defun org-insert-src-block (src-code-type)
  "Insert a `SRC-CODE-TYPE' type source code block in org-mode."
  (interactive
   (let ((src-code-types
          '("emacs-lisp" "python" "C" "sh" "java" "js" "clojure" "C++" "css"
            "calc" "asymptote" "dot" "gnuplot" "ledger" "lilypond" "mscgen"
            "octave" "oz" "plantuml" "R" "sass" "screen" "sql" "awk" "ditaa"
            "haskell" "latex" "lisp" "matlab" "ocaml" "org" "perl" "ruby"
            "scheme" "sqlite")))
     (list (ido-completing-read "Source code type: " src-code-types))))
  (progn
    (newline-and-indent)
    (insert (format "#+BEGIN_SRC %s\n" src-code-type))
    (newline-and-indent)
    (insert "#+END_SRC\n")
    (previous-line 2)
    (org-edit-src-code)))

(defun my-org-mode-setup ()
  (define-key org-mode-map (kbd "C-c s e") 'org-insert-src-block))

(add-hook 'org-mode-hook 'my-org-mode-setup t)

(global-set-key (kbd "C-c C-a r") 'org-agenda-to-appt)

;;agenda-appt
(require 'appt)
(appt-activate t);启用约会提醒
(setq appt-display-format 'window);提醒出现的方式
(setq appt-message-warning-time '5);在到期前5分钟提醒
(setq appt-display-duration '30);提醒持续时间（秒）
(setq appt-audible t)  ;声音提醒 -->没有响声!!？？？？？
(setq appt-display-mode-line t);在状态栏显示时间（分钟）

(provide 'init-org)
