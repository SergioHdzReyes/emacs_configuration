;;; Init --- Summary
;;; Commentary:

;;; Code:
(setq gnutls-algorithm-priority "NORMAL:-VERS-TLS1.3")

(require 'package)
(add-to-list 'package-archives
         '("melpa" . "http://melpa.org/packages/") t)

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq custom-file "~/.emacs.d/custom.el")

(add-to-list 'load-path "~/.emacs.d/package-configurations")

(require 'config-magit)
(require 'config-general)
(require 'config-ido)
(require 'config-theme)
(require 'config-treemacs)
(require 'config-smartparens)
(require 'config-multiple-cursors)
(require 'config-flycheck)
(require 'config-autocomplete)

(provide 'init)

(load custom-file)

;;; init.el ends here
