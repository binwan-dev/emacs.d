;; -*- lexical-binding: t; -*-

(require 'init-package)
(require 'init-appearance)
(require 'init-profile)

(require 'init-org)
(require 'init-projectile)
(require 'init-treemacs)
(require 'init-helm)
(require 'init-ide)
(require 'init-sql)
;; (require 'init-ai)
(require 'init-music)
(require 'init-terminal)

;; load local custom setting
;; The custom.el file should not be uploaded to Github, only saved locally on your PC.
(setq custom-file (expand-file-name "config/init-custom.el" user-emacs-directory))
;; 只有当文件存在时才加载它，避免报错
(when (file-exists-p custom-file)
  (load custom-file))

(provide 'init-config)
