(use-package lsp-bridge
  :straight '(lsp-bridge :type git :host github :repo "manateelazycat/lsp-bridge"
            :files (:defaults "*.el" "*.py" "acm" "core" "langserver" "multiserver" "resources")
            :build (:not compile))
  :init
  (global-lsp-bridge-mode)
  (setq lsp-bridge-python-command "~/.pyenv/versions/3.13.1/bin/python3"))

(provide 'init-lsp-bridge)
