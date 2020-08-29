;;; Init --- Summary
;;; Commentary:

;;; Code:
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
(require 'config-wakatime)
(require 'config-general)
(require 'config-ido)
(require 'config-theme)
(require 'config-ag)
(require 'config-php)
(require 'config-javascript)
(require 'config-treemacs)
(require 'config-deploy)
(require 'config-smartparens)
(require 'config-multiple-cursors)
(require 'config-flycheck)
(require 'config-autocomplete)

;; function-args
;; (require 'function-args)
;; (fa-config-default)
;; (define-key c-mode-map  [(tab)] 'company-complete)
;; (define-key c++-mode-map  [(tab)] 'company-complete)
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(custom-enabled-themes '(dracula))
 '(custom-safe-themes
   '("24714e2cb4a9d6ec1335de295966906474fdb668429549416ed8636196cb1441" default))
 '(package-selected-packages
   '(company-php ac-php forge multiple-cursors multiple-cursor smartparens js2-mode php-mode wgrep-ag wrep-ag helm-ag ag ido-mode wakatime-mode use-package magit flycheck expand-region))
 '(wakatime-cli-path "/usr/local/bin/wakatime")
 '(wakatime-python-bin nil))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 )
(provide 'init)
;;; init.el ends here
