;;; AG
(use-package wgrep-ag)
(use-package helm-ag)
(use-package ag
  :init
  (setq ag-executable "/usr/local/bin/ag")
  (setq helm-ag-base-command "pt -e --nocolor --nogroup")
  (setq ag-highlight-search t)
  (setq ag-reuse-window t)
  (setq ag-reuse-buffers t))

(provide 'config-ag)
