(require-package 'plantuml-mode)

(setq plantuml-jar-path "~/.emacs.d/third/plantuml/plantuml.jar")
(setq plantuml-default-exec-mode 'jar)
(add-to-list 'auto-mode-alist '("\\.plantuml\\'" . plantuml-mode))
(setq plantuml-set-output-type 'svg)

(setq org-plantuml-jar-path "~/.emacs.d/third/plantuml/plantuml.jar")
(org-babel-do-load-languages
  'org-babel-load-languages
  '(;; other Babel languages
  (plantuml . t)))
(setq tab-width 4)
