(require-package 'exwm)
(require 'exwm)
(require 'exwm-config)
(require 'exwm-systemtray)
(exwm-config-default)
(exwm-systemtray-enable)

(setq exwm-systemtray-height 25)

(provide 'init-exwm)
