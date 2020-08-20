;; MAGIT
(use-package wakatime-mode
	     :init
	     (setq wakatime-api-key "")
	     (setq wakatime-cli-path "")
	     (global-wakatime-mode))

(provide 'config-wakatime)
