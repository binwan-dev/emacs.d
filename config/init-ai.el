;; (use-package aider
;;   :config
;;   (setq aider-args '("--model" ""))
;;   (setenv "OPENROUTER_API_KEY" "")
;;   ;; For latest claude sonnet model
;;   ;; (setq aider-args '("--model" "sonnet" "--no-auto-accept-architect")) ;; add --no-auto-commits if you don't want it
;;   ;; (setenv "ANTHROPIC_API_KEY" anthropic-api-key)
;;   ;; Or chatgpt model
;;   ;; (setq aider-args '("--model" "o4-mini"))
;;   ;; (setenv "OPENAI_API_KEY" "<OPENAI_API_KEY>")
;;   ;; Or use your personal config file
;;   ;; (setq aider-args `("--config" ,(expand-file-name "~/.aider.conf.yml")))
;;   ;; ;;
;;   ;; Optional: Set a key binding for the transient menu
;;   (global-set-key (kbd "C-c C-a a") 'aider-transient-menu) ;; for wider screen
;;   ;; or use aider-transient-menu-2cols / aider-transient-menu-1col, for narrow screen
;;   (aider-magit-setup-transients) ;; add aider magit function to magit menu
;;   ;; auto revert buffer
;;   (global-auto-revert-mode 1)
;;   (auto-revert-mode 1))

;; (require 'aider-helm)

;; (use-package copilot
;;   :vc (:url "https://github.com/copilot-emacs/copilot.el"
;;             :rev :newest
;;             :branch "main")
;;   :config
;;   (define-key copilot-completion-map (kbd "C-<tab>") 'copilot-accept-completion)
;;   ;; (global-set-key (kbd "C-i C-t") 'toggle-auto-composition)
;;   :hook
;;   (prog-mode-hook . copilot-mode)
;;   )

;; (use-package minuet
;;     :bind
;;     (("C-c C-a y" . #'minuet-complete-with-minibuffer) ;; use minibuffer for completion
;;      ("C-c C-a i" . #'minuet-show-suggestion) ;; use overlay for completion
;;      ("C-c C-a m" . #'minuet-configure-provider)
;;      :map minuet-active-mode-map
;;      ;; These keymaps activate only when a minuet suggestion is displayed in the current buffer
;;      ("M-p" . #'minuet-previous-suggestion) ;; invoke completion or cycle to next completion
;;      ("M-n" . #'minuet-next-suggestion) ;; invoke completion or cycle to previous completion
;;      ("M-A" . #'minuet-accept-suggestion) ;; accept whole completion
;;      ;; Accept the first line of completion, or N lines with a numeric-prefix:
;;      ;; e.g. C-u 2 M-a will accepts 2 lines of completion.
;;      ("C-<tab>" . #'minuet-accept-suggestion-line)
;;      ("M-e" . #'minuet-dismiss-suggestion))
;;     :init
;;     (add-hook 'prog-mode-hook #'minuet-auto-suggestion-mode)
;;     :config
;;     (setq minuet-request-timeout 2.5)
;;     (setq minuet-auto-suggestion-throttle-delay 1.5) ;; Increase to reduce costs and avoid rate limits
;;     (setq minuet-auto-suggestion-debounce-delay 0.6) ;; Increase to reduce costs and avoid rate limits
;;     (setq minuet-n-completions 1)
;;     (setq minuet-context-window 512)
;;     (setq minuet-add-single-line-entry t)

;;     (setq minuet-provider 'openai-compatible)
;;     (plist-put minuet-openai-compatible-options :end-point "https://api.siliconflow.cn/v1/completions")
;;     (plist-put minuet-openai-compatible-options :name "SiliconFlow")
;;     (plist-put minuet-openai-compatible-options :api-key "SILICONFLOW_API_KEY")
;;     (plist-put minuet-openai-compatible-options :model "deepseek-ai/DeepSeek-V3")

;;     ;; (setq minuet-provider 'openai-fim-compatible)
;;     ;; (plist-put minuet-openai-fim-compatible-options :end-point "http://localhost:1234/v1/completions")
;;     ;; (plist-put minuet-openai-fim-compatible-options :name "Ollama")
;;     ;; (plist-put minuet-openai-fim-compatible-options :api-key "TERM")
;;     ;; (plist-put minuet-openai-fim-compatible-options :model "qwen2.5-coder-3b-instruct")

;;     (minuet-set-optional-options minuet-openai-fim-compatible-options :max_tokens 24)
;;     (minuet-set-optional-options minuet-openai-fim-compatible-options :stop "\n"))

(provide 'init-ai)
