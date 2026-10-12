;; -*- lexical-binding: t; -*-
(use-package bongo
  :config
  (add-to-list 'auto-mode-alist '("\\.playlist?\\'" . bongo-playlist-mode)))

(provide 'init-music)
