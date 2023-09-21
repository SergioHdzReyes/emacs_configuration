;;; treemacs --- Summary
;;; Commentary:
;;; Code:

(use-package treemacs
  :init
  (global-set-key (kbd "M-g M-r") 'treemacs)
  (treemacs-add-and-display-current-project-exclusively)
  (setq treemacs-project-follow-mode t)
  (setq treemacs-indent-guide-mode t)
  ;;;(setq treemacs-follow-mode t)
  (setq treemacs-git-mode t)
  )

(provide 'config-treemacs)
;;; config-treemacs.el ends here
