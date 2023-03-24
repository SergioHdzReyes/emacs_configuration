;;; Init --- Summary
;;; Commentary:

;;; Code:
(require 'package)
(add-to-list 'package-archives
             '("melpa" . "http://melpa.org/packages/") t)
(add-to-list 'initial-frame-alist '(fullscreen . maximized))

(package-initialize)

(when (not package-archive-contents)
  (package-refresh-contents))

(unless (package-installed-p 'use-package)
  (package-install 'use-package))

(require 'use-package)
(setq use-package-always-ensure t)
(setq custom-file "~/.emacs.d/custom.el")

(add-to-list 'load-path "~/.emacs.d/package-configurations")

(require 'config-searcher)
(require 'config-magit)
(require 'config-general)
(require 'config-ido)
(require 'config-theme)
(require 'config-treemacs)
(require 'config-smartparens)
(require 'config-multiple-cursors)
(require 'config-flycheck)
(require 'config-autocomplete)
(require 'config-translate)

(provide 'init)

(load custom-file)

;;; init.el ends here
