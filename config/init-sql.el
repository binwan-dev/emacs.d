;; -*- lexical-binding: t; -*-

(use-package pgsql)

(setenv "PASSWORD_STORE_DIR" "/Users/binwan/Documents/binwan-dev/password")
(setq password-store-dir "/Users/binwan/Documents/binwan-dev/password")

(use-package auth-source-pass
  :config
  (auth-source-pass-enable))

(use-package clutch
  :hook (clutch-result-mode . (lambda()
                                (when (fboundp 'writeroom-mode)
                                  (writeroom-mode -1))))
  :config
  (setq clutch-connect-timeout-seconds 10
      clutch-read-idle-timeout-seconds 30
      clutch-query-timeout-seconds 20
      clutch-jdbc-rpc-timeout-seconds 15
      clutch-jdbc-validate-after-idle-seconds 300)
  :bind (
         ("C-c C-d" . clutch-query-console))
  ;; :bind (:map clutch-mode-map
  ;;        ("C-c C-d" . clutch--describe-object-entry))
  )

(provide 'init-sql)
