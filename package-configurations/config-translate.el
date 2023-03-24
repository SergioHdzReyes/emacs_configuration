;;; google-translate --- Summary
;;; Commentary:
;;; Code:
(use-package google-translate)

(custom-set-variables
 '(google-translate-default-source-language "en")
 '(google-translate-default-target-language "es"))

(global-set-key (kbd "M-g M-t") 'google-translate-query-translate)
(global-set-key (kbd "M-g M-y") 'google-translate-query-translate-reverse)

(provide 'config-translate)
;;; config-translate.el ends here
