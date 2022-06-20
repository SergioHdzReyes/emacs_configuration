;;; flycheck --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (global-flycheck-inline-mode)
  )

(add-hook 'sh-mode-hook 'flycheck-mode)

(provide 'config-flycheck)
;;; config-flycheck ends here
