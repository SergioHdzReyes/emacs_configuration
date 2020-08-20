;;; DEPLOY
(use-package ssh-deploy
  :init
  ;;; (ssh-deploy-line-mode)
  (ssh-deploy-add-after-save-hook)
  (ssh-deploy-add-find-file-hook)
  (ssh-deploy-hydra "C-c C-y"))

(provide 'config-deploy)
