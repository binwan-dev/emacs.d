(use-package conda
  :init
  (setq conda-env-home-directory (expand-file-name "~/anaconda3/"))
  ;; (setq conda-anaconda-home (expand-file-name "/opt/anaconda/"))
  (conda-env-initialize-interactive-shells)
  (conda-env-initialize-eshell))

(provide 'init-conda)
