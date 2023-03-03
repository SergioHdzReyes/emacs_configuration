;;; flycheck --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-c/c++-gcc-executable "/usr/bin/gcc")
  (setq flycheck-c/c++-cppcheck-executable "/usr/bin/cppcheck")
  (setq flycheck-checker-error-threshold 2000)
  (setq flycheck-error-list-minimum-level t)
  )

(provide 'config-flycheck)
;;; config-flycheck ends here
