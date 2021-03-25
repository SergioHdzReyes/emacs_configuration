;;; magit --- Summary
;;; Commentary:
;;; Code:
(use-package forge)
(use-package magit
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (global-set-key (kbd "C-c C-g") 'magit)
  (setq magit-ediff-dwim-show-on-hunks t))

(provide 'config-magit)
;;; config-magit.el ends here
