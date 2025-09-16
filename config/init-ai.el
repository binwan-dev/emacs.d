(use-package aider
  :config
  (setq aider-args '("--model" "deepseek"))
  (setenv "DEEPSEEK_API_KEY" "<DEEPSEEK_API_KEY>")
  ;; For latest claude sonnet model
  ;; (setq aider-args '("--model" "sonnet" "--no-auto-accept-architect")) ;; add --no-auto-commits if you don't want it
  ;; (setenv "ANTHROPIC_API_KEY" anthropic-api-key)
  ;; Or chatgpt model
  ;; (setq aider-args '("--model" "o4-mini"))
  ;; (setenv "OPENAI_API_KEY" "<OPENAI_API_KEY>")
  ;; Or use your personal config file
  ;; (setq aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml")))
  ;; ;;
  ;; Optional: Set a key binding for the transient menu
  (global-set-key (kbd "C-c C-a a") 'aider-transient-menu) ;; for wider screen
  ;; or use aider-transient-menu-2cols / aider-transient-menu-1col, for narrow screen
  (aider-magit-setup-transients) ;; add aider magit function to magit menu
  ;; auto revert buffer
  (global-auto-revert-mode 1)
  (auto-revert-mode 1))

(require 'aider-helm)

(use-package copilot
  :vc (:url "https://github.com/copilot-emacs/copilot.el"
            :rev :newest
            :branch "main")
  :config
  (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion)
  ;; (global-set-key (kbd "C-i C-t") 'toggle-auto-composition)
  :hook
  (prog-mode-hook . copilot-mode)
  )

(provide 'init-ai)
