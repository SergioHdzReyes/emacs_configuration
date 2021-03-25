;;; AG --- Summary
;;; Commentary:
;;; Code:
(use-package wgrep-ag)
(use-package helm-ag)
(use-package ag
  :init
  (setq ag-executable "/usr/local/bin/ag")
  (setq helm-ag-base-command "ag -e --nocolor --nogroup")
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  (setq ag-reuse-buffers t))

(provide 'config-ag)
;;; config-ag.el ends here
