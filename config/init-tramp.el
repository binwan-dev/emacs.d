(use-package tramp
  :ensure nil
  :config
  (add-to-list 'tramp-remote-path "/home/binwan/.dotnet/tools/")
  (add-to-list 'tramp-remote-path 'tramp-own-remote-path))

(provide 'init-tramp)
