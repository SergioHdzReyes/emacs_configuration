;;; Searcher --- Summary
;;; Commentary:
;;; Code:
(use-package wgrep-ag)
(use-package helm-ag)
(use-package ag
  :init
  (setq ag-executable "/usr/bin/ag")
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  (setq ag-reuse-buffers t)

  (setq helm-ag-base-command "ag --nocolor --nogroup --ignore-case")
  (global-set-key (kbd "M-g M-s") 'helm-do-ag)
)

(provide 'config-searcher)
;;; config-searcher.el ends here
