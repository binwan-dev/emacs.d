;; set words much warnning with rows.
(require-package 'fill-column-indicator)
(setq fci-rule-column 120) 
(setq fci-rule-color "gray")
(setq fci-rule-character 124)
(setq fci-rule-width 1)
(fci-mode 1) 

(provide 'init-fci)
