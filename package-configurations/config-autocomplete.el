;;; ac-php --- Summary
;;; Commentary:
;;; Code:
(use-package company)
(use-package ac-php
  :init
  (add-hook 'php-mode-hook
          '(lambda ()
             ;; Enable company-mode
             (company-mode t)
             (require 'company-php)

             ;; Enable ElDoc support (optional)
             (ac-php-core-eldoc-setup)

             (set (make-local-variable 'company-backends)
                  '((company-ac-php-backend company-dabbrev-code)
                    company-capf company-files))

             ;; Jump to definition (optional)
             ;; (define-key php-mode-map (kbd "M-]")
             ;;   'ac-php-find-symbol-at-point)

             ;; Return back (optional)
             ;; (define-key php-mode-map (kbd "M-[")
             ;;   'ac-php-location-stack-back)
	     )
	  )
  )
(global-company-mode 1)

(provide 'config-autocomplete)
;;; config-autocomplete.el ends here
