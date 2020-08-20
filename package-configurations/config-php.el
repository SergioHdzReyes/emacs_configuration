(use-package php-mode
  :init
  ;; Funcion para ir a primer caracter de linea o a bloque de texto
  (defun xah-beginning-of-line-or-block ()
    (interactive)
    (let (($p (point)))
      (if (or (equal (point) (line-beginning-position))
              (equal last-command this-command ))
          (if (re-search-backward "\n[\t\n ]*\n+" nil "NOERROR")
              (progn
		(skip-chars-backward "\n\t ")
		(forward-char ))
            (goto-char (point-min)))
	(progn
          (back-to-indentation)
          (when (eq $p (point))
            (beginning-of-line))))))

  (defun xah-end-of-line-or-block ()
    "Move cursor to end of line or next paragraph.

    • When called first time, move cursor to end of line.
    • When called again, move cursor forward by jumping over any sequence of whitespaces containing 2 blank lines.

    URL `http://ergoemacs.org/emacs/emacs_keybinding_design_beginning-of-line-or-block.html'
    Version 2017-05-30"
    (interactive)
    (if (or (equal (point) (line-end-position))
            (equal last-command this-command ))
	(progn
          (re-search-forward "\n[\t\n ]*\n+" nil "NOERROR" ))
      (end-of-line)))

  (global-set-key (kbd "C-a") 'xah-beginning-of-line-or-block)
  (global-set-key (kbd "C-e") 'xah-end-of-line-or-block)

  (add-hook 'php-mode-hook
            '(lambda ()
               ;; Enable auto-complete-mode
               (auto-complete-mode t)

               (require 'ac-php)
               (setq ac-sources '(ac-source-php))

               ;; As an example (optional)
               (yas-global-mode 1)

               ;; Enable ElDoc support (optional)
               (ac-php-core-eldoc-setup)

	       (setq indent-tabs-mode nil
		     tab-width 4
		     c-basic-offset 4)))

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
               (define-key php-mode-map (kbd "M-]")
		 'ac-php-find-symbol-at-point)

               ;; Return back (optional)
               (define-key php-mode-map (kbd "M-[")
		 'ac-php-location-stack-back)))

  (add-to-list 'auto-mode-alist '("\\.ctp$" . php-mode))
  (global-set-key (kbd "C-x C-j") 'ac-php-find-symbol-at-point))

(provide 'config-php)
