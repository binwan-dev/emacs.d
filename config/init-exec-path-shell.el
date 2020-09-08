(require-package 'exec-path-from-shell)

(exec-path-from-shell-initialize)
(exec-path-from-shell-copy-env "PATH")
(exec-path-from-shell-copy-env "GO111MODULE")
(exec-path-from-shell-copy-env "GOPROXY")
(exec-path-from-shell-copy-env "GOPRIVATE")

(provide 'init-exec-path-shell)
