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
;;; init.el ends here
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["unspecified-bg" "red" "green" "yellow" "blue" "brightmagenta" "brightcyan" "brightwhite"])
 '(custom-enabled-themes (quote (dracula)))
 '(custom-safe-themes
   (quote
    ("1436985fac77baf06193993d88fa7d6b358ad7d600c1e52d12e64a2f07f07176" default)))
 '(flycheck-highlighting-mode (quote lines))
 '(flycheck-indication-mode (quote left-margin))
 '(global-display-line-numbers-mode t)
 '(package-selected-packages
   (quote
    (flycheck-inline readline-complete company flycheck multiple-cursors smartparens treemacs dracula-theme use-package forge))))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
