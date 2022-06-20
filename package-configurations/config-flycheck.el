;;; flycheck --- Summary
;;; Commentary:
;;; Code:
(use-package flycheck
  :ensure t
  :init
  (global-flycheck-mode)
  (setq flycheck-highlighting-mode (quote lines))
  (setq flycheck-indication-mode (quote left-margin))
  )

(add-hook 'sh-mode-hook 'flycheck-mode)

(use-package flycheck-inline
  :init
  (global-flycheck-inline-mode))

(provide 'config-flycheck)
;;; config-flycheck ends here
