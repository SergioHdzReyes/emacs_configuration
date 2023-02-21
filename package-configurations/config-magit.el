;;; magit --- Summary
;;; Commentary:
;;; Code:
(use-package forge)
(use-package diff-hl)
(use-package magit
  :init
  (setq magit-display-buffer-function #'magit-display-buffer-fullframe-status-v1)
  (global-set-key (kbd "M-g M-m") 'magit)
  (setq magit-ediff-dwim-show-on-hunks t)

  (add-hook 'magit-pre-refresh-hook 'diff-hl-magit-pre-refresh)
  (add-hook 'magit-post-refresh-hook 'diff-hl-magit-post-refresh)
  (global-diff-hl-mode)
  (global-set-key (kbd "M-g M-h") 'diff-hl-show-hunk)
  )

(provide 'config-magit)
;;; config-magit.el ends here
