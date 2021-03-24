;;; web-mode --- Summary
;;; Commentary:
;;; Code:
(use-package web-mode
  :init
  (add-to-list 'auto-mode-alist '("\\.ctp\\'" . web-mode))
  )

(provide 'config-web)
;;; config-web.el ends here
