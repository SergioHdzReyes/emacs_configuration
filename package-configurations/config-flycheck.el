;;; flycheck --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-php-phpmd-executable "/usr/local/bin/phpmd")
  ;;; (setq flycheck-php-phpcs-executable "/usr/local/opt/php@7.2/bin/phpcs")
  (setq flycheck-checker-error-threshold 2000)
  )

(provide 'config-flycheck)
;;; config-flycheck ends here
